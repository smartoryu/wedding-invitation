// ignore_for_file: prefer_const_constructors
import 'dart:math' as math;
import 'package:wedding_invitation/src/views.dart';

class JadwalScreen extends StatelessWidget {
  const JadwalScreen({Key? key, required this.onWillPop}) : super(key: key);

  final Future<bool> Function() onWillPop;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double bgWidth = width > 450 ? 480 : width;

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // BACKGROUND
            Container(
              constraints: const BoxConstraints(maxWidth: 480),
              width: bgWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/logo-bg-with-spark.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.75),
                    BlendMode.dstATop,
                  ),
                ),
              ),
            ),

            // BOTTOM FLOWER
            Positioned(
              bottom: -10,
              right: 0,
              child: Spring.slide(
                animDuration: const Duration(milliseconds: 2000),
                delay: const Duration(milliseconds: 0),
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
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                JadwalPemberkatan(height: height),
                SizedBox(
                  height: height * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text("BOTTOM")),
                    ),
                  ),
                ),
              ],
            ),

            // TOP FLOWER
            Positioned(
              top: -15,
              left: -20,
              child: Spring.slide(
                animDuration: const Duration(milliseconds: 2000),
                delay: const Duration(milliseconds: 50),
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
            ),

            // SCROLL

            Positioned(
              bottom: 8,
              left: 16,
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
            ),
          ],
        ),
      ),
    );
  }
}

class JadwalPemberkatan extends StatelessWidget {
  const JadwalPemberkatan({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Text("TOP")),
        ),
      ),
    );
  }
}
