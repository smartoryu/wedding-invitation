// ignore_for_file: unnecessary_const

import 'package:wedding_invitation/src/screens/components/audio_toggle.dart';
import 'package:wedding_invitation/src/screens/components/scroll_logo.dart';
import 'package:wedding_invitation/src/views.dart';

class PenutupScreen extends StatelessWidget {
  const PenutupScreen({
    Key? key,
    required this.onWillPop,
    required this.isPlaying,
    required this.toggleAudio,
  }) : super(key: key);

  final Future<bool> Function() onWillPop;
  final bool isPlaying;
  final void Function() toggleAudio;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 100, 32, 100),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  color: Colors.black.withOpacity(0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Terima kasih untuk segala cinta dan dukungan yang telah diberikan kepada kami. Kami mohon doa restu dari tempat Bapak Ibu di manapun berada.\n\nTurut berbahagia\nKeluarga Bapak Anton Tri Raharjo\nKeluarga Bapak Djuni Re Tarawa (\u2020)',
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

            // AUDIO TOGGLE
            AudioToggle(
              bottom: 8,
              right: 16,
              toggleAudio: toggleAudio,
              isPlaying: isPlaying,
            ),

            // SCROLL
            const ScrollLogo(bottom: 8, left: 16),
          ],
        ),
      ),
    );
  }
}
