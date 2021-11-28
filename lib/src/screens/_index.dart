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
      setState(() {
        currentPage = _pageController.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(currentPage.toString());

    return PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      children: [
        CoverScreen(
          onTap: () {
            _pageController.animateToPage(
              5,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
            );
          },
        ),
        const InfoMempelaiScreen(),
        const QuoteScreen(),
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
    );
  }
}
