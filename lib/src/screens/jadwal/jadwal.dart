import 'package:wedding_invitation/src/screens/components/audio_toggle.dart';
import 'package:wedding_invitation/src/screens/components/scroll_logo.dart';
import 'package:wedding_invitation/src/views.dart';

import 'flower_bottom.dart';
import 'flower_top.dart';
import 'jadwal_pemberkatan.dart';

class JadwalScreen extends StatelessWidget {
  final Future<bool> Function() onWillPop;
  final bool isPlaying;
  final void Function() toggleAudio;

  const JadwalScreen({
    Key? key,
    required this.onWillPop,
    required this.isPlaying,
    required this.toggleAudio,
  }) : super(key: key);

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
                  image: const AssetImage('assets/img/logo-bg-with-spark.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.75),
                    BlendMode.dstATop,
                  ),
                ),
              ),
            ),

            // FLOWER BOTTOM
            const FlowerBottom(),

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
                      child: const Center(child: Text("BOTTOM")),
                    ),
                  ),
                ),
              ],
            ),

            // FLOWER TOP
            const FlowerTop(),

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
