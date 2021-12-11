import 'package:wedding_invitation/src/views.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  configureApp();

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) {
          return const Center(child: Text("Home"));
        }),
        RedirectRoute('/', to: '/putri-kuntep'),
        ChildRoute(
          '/putri-kuntep',
          child: (context, args) {
            String guest = Uri.base.queryParameters['guest'] ?? '-';

            return Column(
              children: [
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    width: 480,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/img/img-bg-leaf.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.75),
                          BlendMode.dstATop,
                        ),
                      ),
                    ),
                    child: CoverScreen(guest: guest),
                    // child: JadwalScreen(
                    //   onWillPop: () async => true,
                    //   isPlaying: true,
                    //   toggleAudio: () {},
                    // ),
                  ),
                ),
              ],
            );
          },
        ),
        WildcardRoute(child: (context, args) {
          return const Scaffold(
            body: Center(
              child: Text(
                'Page not found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        }),
      ];
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wedding Invitation',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.deepPurple,
      ),
    ).modular();
  }
}
