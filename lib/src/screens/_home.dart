import 'package:wedding_invitation/src/views.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  double currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() => currentPage = _pageController.page ?? 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 480),
            width: 480,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/img-bg-pink-purple.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: [
              const InfoMempelaiScreen(),
              // const QuoteScreen(),
              const LokasiScreen(),
              const PenutupScreen(),
              GiftScreen(
                onTap: () {
                  _pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: SpeedDial(
        // animatedIcon: AnimatedIcons.menu_close,
        // animatedIconTheme: IconThemeData(size: 22.0),
        // / This is ignored if animatedIcon is non null
        // child: Text("open"),
        // activeChild: Text("close"),
        icon: Icons.add,
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

        buttonSize: 56.0, // it's the SpeedDial size which defaults to 56 itself
        // iconTheme: IconThemeData(size: 22),
        // label: const Text("Open"), // The label of the main button.
        /// The active label of the main button, Defaults to label if not specified.
        // activeLabel: const Text("Close"),

        /// Transition Builder between label and activeLabel, defaults to FadeTransition.
        // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
        /// The below button size defaults to 56 itself, its the SpeedDial childrens size
        childrenButtonSize: 56.0,
        visible: true,
        direction: SpeedDialDirection.down,
        switchLabelPosition: false,

        /// If true user is forced to close dial manually
        // closeManually: closeManually,

        /// If false, backgroundOverlay will not be rendered.
        renderOverlay: true,
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
            // child: !rmicons ? const Icon(Icons.accessibility) : null,
            child: const Icon(Icons.accessibility),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'First',
            onTap: () => debugPrint("FIRST CHILD"),
          ),
          SpeedDialChild(
            // child: !rmicons ? const Icon(Icons.brush) : null,
            child: const Icon(Icons.brush),
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            label: 'Second',
            onTap: () => debugPrint('SECOND CHILD'),
          ),
          SpeedDialChild(
            // child: !rmicons ? const Icon(Icons.margin) : null,
            child: const Icon(Icons.margin),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            label: 'Show Snackbar',
            visible: true,
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(("Third Child Pressed")))),
            onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
          ),
        ],
      ),
    );
  }
}
