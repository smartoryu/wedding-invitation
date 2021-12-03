import 'package:wedding_invitation/src/views.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("QUOTE"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          // color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width:
                    width > 450 ? 400 : MediaQuery.of(context).size.width * 0.9,
                child: Material(
                  color: Colors.black.withOpacity(0.5),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Tuhan membuat segala sesuatu indah pada waktuNya. Indah saat Dia mempertemukan, indah saat Dia menumbuhkan kasih dan indah saat Dia mempersatukan dalam Pernikahan Kudus.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "DancingScript",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
