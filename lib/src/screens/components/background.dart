import 'package:wedding_invitation/src/views.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spring.fadeIn(
          animDuration: const Duration(milliseconds: 1000),
          delay: const Duration(milliseconds: 500),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 480),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                    'assets/img/img-see-each-other.jpg',
                  ),
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.75),
                    BlendMode.dstATop,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
