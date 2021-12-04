import 'package:wedding_invitation/src/screens/components/audio_toggle.dart';
import 'package:wedding_invitation/src/screens/components/scroll_logo.dart';
import 'package:wedding_invitation/src/views.dart';

import 'content.dart';

class InfoMempelaiScreen extends StatelessWidget {
  final Future<bool> Function() onWillPop;
  final bool isPlaying;
  final void Function() toggleAudio;

  const InfoMempelaiScreen({
    Key? key,
    required this.onWillPop,
    required this.isPlaying,
    required this.toggleAudio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const InfoMempelaiContent(),

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
