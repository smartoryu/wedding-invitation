import 'package:wedding_invitation/src/views.dart';

class GiftScreen extends StatelessWidget {
  const GiftScreen({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GIFT")),
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
      floatingActionButton: FloatingActionButton(
        onPressed: onTap,
        tooltip: 'Back to Home',
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
