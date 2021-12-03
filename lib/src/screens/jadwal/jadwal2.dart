// ignore_for_file: prefer_const_constructors
import 'dart:math' as math;
import 'package:wedding_invitation/src/views.dart';

class Jadwal2Screen extends StatelessWidget {
  const Jadwal2Screen({Key? key, required this.onWillPop}) : super(key: key);

  final Future<bool> Function() onWillPop;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double bgWidth = width > 450 ? 480 : width;

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Container(
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
            ),
            // Container(
            //   constraints: const BoxConstraints(maxWidth: 480),
            //   width: bgWidth,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('assets/img/img-facing-front.jpg'),
            //       fit: BoxFit.cover,
            //       colorFilter: ColorFilter.mode(
            //         Colors.black.withOpacity(0.5),
            //         BlendMode.dstATop,
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              constraints: const BoxConstraints(maxWidth: 480),
              width: bgWidth,
              // color: Colors.black.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Text(
                    'You have pushed the button this many times:',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text('0', style: Theme.of(context).textTheme.headline4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
