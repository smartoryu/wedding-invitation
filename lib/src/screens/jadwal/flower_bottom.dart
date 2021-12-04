import 'dart:math' as math;
import 'package:wedding_invitation/src/views.dart';

class FlowerBottom extends StatelessWidget {
  const FlowerBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -10,
      right: 0,
      child: Spring.slide(
        animDuration: const Duration(milliseconds: 2000),
        delay: const Duration(milliseconds: 500),
        slideType: SlideType.slide_in_bottom,
        child: Transform.rotate(
          angle: math.pi / 180,
          child: Image.asset(
            'assets/img/logo-purple-flower-bottom.png',
            fit: BoxFit.contain,
            width: 125,
          ),
        ),
      ),
    );
  }
}
