import 'dart:math' as math;
import 'package:wedding_invitation/src/views.dart';

class FlowerTop extends StatelessWidget {
  const FlowerTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -15,
      left: -20,
      child: Spring.slide(
        animDuration: const Duration(milliseconds: 2000),
        delay: const Duration(milliseconds: 500),
        slideType: SlideType.slide_in_top,
        child: Transform.rotate(
          angle: math.pi / 180 * -20,
          child: Image.asset(
            'assets/img/logo-purple-flower-top.png',
            fit: BoxFit.contain,
            width: 125,
          ),
        ),
      ),
    );
  }
}
