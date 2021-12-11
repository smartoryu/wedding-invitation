import 'package:wedding_invitation/src/screens/components/button_open.dart';
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Pemberkatan Perkawinan",
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          TextStyled("Sabtu"),
                          TextStyled("08.00 - 09.00 WIB"),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "18",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          TextStyled("Desember"),
                          TextStyled("2021"),
                        ],
                      ),
                    ),
                  ],
                ),

                //
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Gereja St. Antonius Padua, Kendal"),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        ButtonOpenYT("https://youtu.be/upIZ6qQ8n8Y"),
                        SizedBox(width: 8),
                        ButtonOpenIG("https://instagram.com/kunteptarawa"),
                        SizedBox(width: 8),
                        ButtonOpenMap("https://goo.gl/maps/T7XpbZ3jkAorY9S1A"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextStyled extends StatelessWidget {
  const TextStyled(this.child, {Key? key}) : super(key: key);
  final String child;

  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
