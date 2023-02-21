import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:instagram_clone/state/constants/firebase_collection_name.dart';
import 'package:instagram_clone/state/image_upload/constants/constants.dart';
import 'package:instagram_clone/state/image_upload/exceptions/could_not_build_thumbnail_exception.dart';
import 'package:instagram_clone/state/image_upload/extensions/get_collection_name_from_file.dart';
import 'package:instagram_clone/state/image_upload/extensions/get_image_data_aspect_ratio.dart';
import 'package:instagram_clone/state/posts/models/post_payload.dart';
import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../post_settings/models/post_settings.dart';
import '../../posts/typedefs/user_id.dart';
import '../models/file_type.dart';
import '../typedefs/is_loading.dart';

class ImageUploadNotifier extends StateNotifier<IsLoading> {
  ImageUploadNotifier() : super(false);

  set isLoading(bool value) => state = value;

  Future<bool> upload({
    required File file,
    required FileType fileType,
    required String message,
    required Map<PostSettings, bool> postSettings,
    required UserId userId,
  }) async {
    isLoading = true;
    late Uint8List thumbnailUin8List;
    switch (fileType) {
      case FileType.image:
        final fileAsImage = img.decodeImage(file.readAsBytesSync());
        if (fileAsImage == null) {
          isLoading = false;
          throw const CouldNotBuildThumbnailException();
        }
        final thumbnail = img.copyResize(
          fileAsImage,
          width: Constants.imageThumbnailWidth,
        );
        final thumbnailData = img.encodeJpg(thumbnail);
        thumbnailUin8List = Uint8List.fromList(thumbnailData);
        break;
      case FileType.video:
        final thumb = await VideoThumbnail.thumbnailData(
          video: file.path,
          imageFormat: ImageFormat.JPEG,
          maxWidth: Constants.videoThumbnailMaxHeight,
          quality: Constants.videoThumbnailQuality,
        );
        if (thumb == null) {
          isLoading = false;
          throw const CouldNotBuildThumbnailException();
        } else {
          thumbnailUin8List = thumb;
        }
        break;
    }

    //calculate the aspect Ratio,

    final thumbnailAspectRatio = await thumbnailUin8List.getAspectRatio();
    // calculate references

    final fileName = const Uuid().v4();
    // create references to the thumbnail and the image itself
    final thumbnailReference = FirebaseStorage.instance
        .ref()
        .child(userId)
        .child(FirebaseCollectionName.thumbnails)
        .child(fileName);

    final originalFileRef = FirebaseStorage.instance
        .ref()
        .child(userId)
        .child(fileType.collectionName)
        .child(fileName);

    try {
      final thumbnailUploadTask =
          await thumbnailReference.putData(thumbnailUin8List);
      final thumbnailStorageId = thumbnailUploadTask.ref.name;

      // upload the original file
      final originalFileUploadTask = await originalFileRef.putFile(file);
      final originalFileStorageId = originalFileUploadTask.ref.name;
// upload the post itself
      final postPayload = PostPayload(
        userId: userId,
        message: message,
        thumbnailUrl: await thumbnailReference.getDownloadURL(),
        fileUrl: await originalFileRef.getDownloadURL(),
        fileType: fileType,
        aspectRatio: thumbnailAspectRatio,
        thumbnailStorageId: thumbnailStorageId,
        originalFileStorageId: originalFileStorageId,
        postSettings: postSettings,
        filename: fileName,
      );

      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.posts)
          .add(
            postPayload,
          );
      return true;
    } catch (_) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
