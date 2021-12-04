import 'package:wedding_invitation/src/views.dart';

class CoverScreen extends StatelessWidget {
  const CoverScreen({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink.withOpacity(0.005),
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(height: 20),
                Image.asset(
                  "assets/img/img-logo-inisial.png",
                  fit: BoxFit.cover,
                  width: 275,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  ),
                  child: Container(
                    height: 75,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(UniconsLine.envelope_open, size: 32),
                        Text("Buka Undangan"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
