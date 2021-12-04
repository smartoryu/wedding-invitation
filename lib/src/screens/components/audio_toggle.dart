import 'package:wedding_invitation/src/views.dart';

class AudioToggle extends StatelessWidget {
  final void Function() toggleAudio;
  final bool isPlaying;
  final double? bottom;
  final double? top;
  final double? left;
  final double? right;

  const AudioToggle({
    Key? key,
    required this.toggleAudio,
    required this.isPlaying,
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
      child: GestureDetector(
        onTap: toggleAudio,
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          size: 24,
        ),
      ),
    );
  }
}
