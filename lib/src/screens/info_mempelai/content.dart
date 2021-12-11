import 'package:wedding_invitation/src/views.dart';

class InfoMempelaiContent extends StatelessWidget {
  const InfoMempelaiContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 32),
          Spring.fadeIn(
            animDuration: const Duration(milliseconds: 1000),
            delay: const Duration(milliseconds: 1000),
            child: Container(
              width: width > 450 ? 480 : width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/img/img-bg-paper-canvas.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.75),
                    BlendMode.dstATop,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 32, 8, 64),
                child: Column(
                  children: [
                    Column(
                      children: const [
                        TextTitle('Maria Nirmala Putri'),
                        TextContent('Putri Pertama dari:', isBold: true),
                        TextContent('Bapak Anton Tri Raharjo'),
                        TextContent('Ibu Eustasia Christine Martati'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const TextTitle('&', fontSize: 32),
                    const SizedBox(height: 8),
                    Column(
                      children: const [
                        TextTitle('Kristian Kuntep Hagatang'),
                        TextContent('Putra Keempat dari:', isBold: true),
                        TextContent('Bapak Djuni Re Tarawa (\u2020)'),
                        TextContent('Ibu Anita Rudji'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextTitle extends StatelessWidget {
  final String title;
  final double? fontSize;

  const TextTitle(
    this.title, {
    Key? key,
    this.fontSize = 28,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        letterSpacing: 1.5,
        color: Colors.black,
        fontSize: fontSize,
        fontFamily: "DancingScript",
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TextContent extends StatelessWidget {
  final String title;
  final double? fontSize;
  final bool? isBold;

  const TextContent(
    this.title, {
    Key? key,
    this.fontSize = 16,
    this.isBold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        // fontFamily: "DancingScript",
        fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
