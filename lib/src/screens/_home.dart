import 'package:flutter/material.dart';
import 'package:wedding_invitation/src/views.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AudioPlayer player;
  bool isPlaying = false;

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

  Future<void> startAudio() async {
    player = AudioPlayer();
    await player.setAsset('assets/audio/bgm.mp3');
    await player.setLoopMode(LoopMode.one);
    player.play();
    setState(() => isPlaying = true);
  }

  void toggleAudio() {
    if (isPlaying) {
      player.pause();
      setState(() => isPlaying = false);
    } else {
      player.play();
      setState(() => isPlaying = true);
    }
  }

  @override
  void initState() {
    resetInput();
    startAudio();

    conName.addListener(() => setName(conName.text));
    conMessage.addListener(() => setMsg(conMessage.text));
    _pageController.addListener(() {
      setState(() => currentPage = _pageController.page ?? 0);
    });
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
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

    debugPrint("isPlaying $isPlaying");
    debugPrint("audioSource ${player.audioSource}");

    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            constraints: const BoxConstraints(maxWidth: 480),
            width: bgWidth,
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    width: bgWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                          'assets/img/img-bg-mempelai.jpg',
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.75),
                          BlendMode.dstATop,
                        ),
                      ),
                    ),
                  ),

                  //

                  PageView(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    children: [
                      InfoMempelaiScreen(
                        onWillPop: onWillPop,
                        isPlaying: isPlaying,
                        toggleAudio: toggleAudio,
                      ),
                      JadwalScreen(
                        onWillPop: onWillPop,
                        isPlaying: isPlaying,
                        toggleAudio: toggleAudio,
                      ),
                      PenutupScreen(
                        onWillPop: onWillPop,
                        isPlaying: isPlaying,
                        toggleAudio: toggleAudio,
                      ),
                      UcapanScreen(
                        onWillPop: onWillPop,
                        isPlaying: isPlaying,
                        toggleAudio: toggleAudio,
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
            ),
          ),
        ),
      ],
    );
  }
}
