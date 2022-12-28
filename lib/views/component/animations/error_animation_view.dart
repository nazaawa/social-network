import 'lottie_animation_view.dart';
import 'models/lottie_animation.dart';

class EmptyAnimationView extends LottieAnimationView {
  const EmptyAnimationView({super.key})
      : super(
          animation: LottieAnimation.empty,
        );
}
