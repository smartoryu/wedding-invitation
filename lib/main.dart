import 'package:wedding_invitation/src/views.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wedding Invitation',
      theme: ThemeData(fontFamily: 'Poppins', primarySwatch: Colors.deepPurple),
      home: Column(
        children: [
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 480),
              width: 480,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/img-bg-pink-purple.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const CoverScreen(),
            ),
          ),
        ],
      ),
    );
  }
}
