import 'package:wedding_invitation/src/views.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  double currentPage = 0;

  final TextEditingController conName = TextEditingController();
  final TextEditingController conMessage = TextEditingController();

  String inputName = '';
  String inputMsg = '';
  void setName(String e) => setState(() => inputName = e);
  void setMsg(String e) => setState(() => inputMsg = e);
  void resetInput() {
    conName.text = '';
    conMessage.text = '';
    setState(() {
      inputName = '';
      inputMsg = '';
    });
  }

  List<List<String>> ucapan = [
    ['Ani', "Selamat Menikah"],
    ['Bayu', "Selamat Menjalankan Kehidupan Baru"],
    // ['Deni', "Selamat berbahagia!!!"],
    // ['Rina', "Selamat Menempuh Hidup Baru"],
    // ['Okta', "Met nikaah"],
    // ['Yanu', "Selamat menikah"],
    // ['Yuni', "Selamat berbahagia!"],
    // ['Ani', "Selamat Menikah"],
    [
      'Bayu',
      "Selamat Menikah. Selamat Menjalankan Kehidupan Baru dan sehat selalu"
    ],
    // ['Deni', "Selamat berbahagia!!!"],
    // ['Rina', "Selamat Menempuh Hidup Baru"],
    // ['Okta', "Met nikaah"],
    // ['Yanu', "Selamat menikah"],
    ['Yuni', "Selamat berbahagia!"],
  ];

  void addUcapan(String name, String msg) {
    setState(() {
      ucapan.add([name, msg]);
    });
  }

  @override
  void initState() {
    resetInput();

    conName.addListener(() => setName(conName.text));
    conMessage.addListener(() => setMsg(conMessage.text));
    _pageController.addListener(() {
      setState(() => currentPage = _pageController.page ?? 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double bgWidth = width > 480 ? 480 : width;

    Future<bool> onWillPop() async {
      if (_pageController.page == 0) {
        return true;
      } else {
        _pageController.previousPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
        return false;
      }
    }

    void changePage(int page) {
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    }

    debugPrint("currentPage $currentPage");

    IconData? findFABIcon() {
      if (currentPage > 2.5 && currentPage <= 3.5) {
        return Icons.margin;
      } else if (currentPage > 1.5 && currentPage <= 2.5) {
        return Icons.brush;
      } else if (currentPage > 0.5 && currentPage <= 1.5) {
        return Icons.pin_drop;
      } else if (currentPage >= 0) {
        return Icons.accessibility;
      } else {
        return null;
      }
    }

    bool isFABOnBottom() => currentPage > 2.5 && currentPage <= 3.5;

    return Column(
      children: [
        Expanded(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            width: bgWidth,
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    width: bgWidth,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/img-bg-pink-purple.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    width: bgWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/img/img-see-each-other.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.75),
                          BlendMode.dstATop,
                        ),
                      ),
                    ),
                  ),
                  PageView(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    children: [
                      const InfoMempelaiScreen(),
                      // const QuoteScreen(),
                      Jadwal1Screen(onWillPop: onWillPop),
                      // Jadwal2Screen(onWillPop: onWillPop),
                      const PenutupScreen(),
                      UcapanScreen(
                        ucapan: ucapan.reversed.toList(),
                        conName: conName,
                        conMessage: conMessage,
                        onSend: inputName == '' || inputMsg == ''
                            ? null
                            : () {
                                addUcapan(conName.text, conMessage.text);
                                resetInput();
                                FocusScope.of(context).unfocus();
                              },
                      ),
                    ],
                  ),
                ],
              ),
              floatingActionButtonLocation: isFABOnBottom()
                  ? FloatingActionButtonLocation.endFloat
                  : FloatingActionButtonLocation.endTop,
              floatingActionButton: SpeedDial(
                // animatedIcon: AnimatedIcons.menu_close,
                // animatedIconTheme: IconThemeData(size: 22.0),
                // / This is ignored if animatedIcon is non null
                // child: Text("open"),
                // activeChild: Text("close"),
                icon: findFABIcon(),
                activeIcon: Icons.close,
                spacing: 3,
                // openCloseDial: isDialOpen,
                // childPadding: const EdgeInsets.all(5),
                spaceBetweenChildren: 4,
                // dialRoot: (ctx, open, toggleChildren) {
                //   return ElevatedButton(
                //     onPressed: toggleChildren,
                //     style: ElevatedButton.styleFrom(
                //       primary: Colors.blue[900],
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 22,
                //         vertical: 18,
                //       ),
                //     ),
                //     child: const Text(
                //       "Custom Dial Root",
                //       style: TextStyle(fontSize: 17),
                //     ),
                //   );
                // },

                buttonSize: 56.0,
                // it's the SpeedDial size which defaults to 56 itself
                // iconTheme: IconThemeData(size: 22),
                // label: const Text("Open"), // The label of the main button.
                /// The active label of the main button, Defaults to label if not specified.
                // activeLabel: const Text("Close"),

                /// Transition Builder between label and activeLabel, defaults to FadeTransition.
                // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
                /// The below button size defaults to 56 itself, its the SpeedDial childrens size
                childrenButtonSize: 56.0,
                visible: true,
                direction: isFABOnBottom()
                    ? SpeedDialDirection.up
                    : SpeedDialDirection.down,
                switchLabelPosition: false,

                /// If true user is forced to close dial manually
                // closeManually: closeManually,

                /// If false, backgroundOverlay will not be rendered.
                renderOverlay: false,
                overlayColor: Colors.black,
                // overlayOpacity: 0.5,
                // onOpen: () => debugPrint('OPENING DIAL'),
                // onClose: () => debugPrint('DIAL CLOSED'),
                useRotationAnimation: true,
                // tooltip: 'Open Speed Dial',
                heroTag: 'speed-dial-hero-tag',
                // foregroundColor: Colors.black,
                // backgroundColor: Colors.white,
                // activeForegroundColor: Colors.red,
                // activeBackgroundColor: Colors.blue,
                elevation: 8.0,
                isOpenOnStart: false,
                animationSpeed: 200,
                shape: const StadiumBorder(),
                // shape: customDialRoot
                //     ? const RoundedRectangleBorder()
                //     : const StadiumBorder(),
                // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                children: [
                  SpeedDialChild(
                    child: const Icon(Icons.accessibility),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    label: 'Mempelai',
                    onTap: () => changePage(0),
                  ),
                  SpeedDialChild(
                    child: const Icon(Icons.pin_drop),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    label: 'Jadwal & Lokasi',
                    onTap: () => changePage(1),
                  ),
                  SpeedDialChild(
                    child: const Icon(Icons.brush),
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    label: 'Penutup',
                    onTap: () => changePage(2),
                  ),
                  SpeedDialChild(
                    child: const Icon(Icons.margin),
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    label: 'Ucapan',
                    visible: true,
                    onTap: () => changePage(3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
