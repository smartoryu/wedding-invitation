import 'package:wedding_invitation/src/views.dart';

class InfoMempelaiScreen extends StatelessWidget {
  const InfoMempelaiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("INFO MEMPELAI")),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text('You have pushed the button this many times:'),
              Text('0', style: Theme.of(context).textTheme.headline4),
            ],
          ),
        ),
      ),
    );
  }
}
