import 'package:wedding_invitation/src/views.dart';

class ScrollLogo extends StatelessWidget {
  final double? bottom;
  final double? top;
  final double? left;
  final double? right;

  const ScrollLogo({
    Key? key,
    this.bottom,
    this.left,
    this.right,
    this.top,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: left,
      top: top,
      right: right,
      child: Spring.slide(
        animDuration: const Duration(milliseconds: 3000),
        delay: const Duration(milliseconds: 1000),
        slideType: SlideType.slide_in_bottom,
        child: Column(
          children: const [
            Text("scroll", style: TextStyle(fontSize: 12)),
            Icon(UniconsLine.angle_double_down, size: 24),
          ],
        ),
      ),
    );
  }
}
