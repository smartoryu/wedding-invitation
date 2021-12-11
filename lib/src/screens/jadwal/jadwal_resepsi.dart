import 'package:wedding_invitation/src/screens/components/button_open_map.dart';
import 'package:wedding_invitation/src/views.dart';

class JadwalResepsi extends StatelessWidget {
  const JadwalResepsi({
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
                  "Resepsi",
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 32,
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
                          Text("Sabtu"),
                          Text("11.00 - 14.00 WIB"),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text("18", style: TextStyle(fontSize: 32)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Desember"),
                          Text("2021"),
                        ],
                      ),
                    ),
                  ],
                ),

                //
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Hotel Sae Inn"),
                    Text("Jalan Raya Soekarno Hatta 338, Kendal"),
                    SizedBox(height: 4),
                    ButtonOpenMap(),
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
