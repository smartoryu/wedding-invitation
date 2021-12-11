import 'package:wedding_invitation/src/views.dart';

class UcapanBackground extends StatelessWidget {
  const UcapanBackground({
    Key? key,
    required this.bgWidth,
    required this.height,
  }) : super(key: key);

  final double bgWidth;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 150,
      child: Image.asset(
        'assets/img/img-bg-gallery-5.jpg',
        width: bgWidth,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
