import 'package:wedding_invitation/src/views.dart';

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
          child: const Center(child: Text("TOP")),
        ),
      ),
    );
  }
}
