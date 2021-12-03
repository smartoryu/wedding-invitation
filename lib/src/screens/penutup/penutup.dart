// ignore_for_file: unnecessary_const

import 'package:wedding_invitation/src/views.dart';

class PenutupScreen extends StatelessWidget {
  const PenutupScreen({Key? key, required this.onWillPop}) : super(key: key);

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
            Container(
              constraints: const BoxConstraints(maxWidth: 480),
              width: bgWidth,
            ),

            //

            Padding(
              padding: const EdgeInsets.fromLTRB(32, 100, 32, 100),
              child: Center(
                child: Container(
                  // width: 250,
                  padding: const EdgeInsets.all(32),
                  color: Colors.black.withOpacity(0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Terima kasih untuk segala cinta, doa restu, dan dukungan yang telah diberikan kepada kami selama ini.\nStay safe and healthy\n\nTurut berbahagia\nSegenap keluarga besar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/img/img-logo-inisial-white.png',
                        width: 200,
                        fit: BoxFit.cover,
                      )
                    ],
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
