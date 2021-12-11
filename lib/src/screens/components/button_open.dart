import 'package:wedding_invitation/src/views.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonOpenMap extends StatelessWidget {
  const ButtonOpenMap(this.url, {Key? key}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return ButtonOpen(
      title: "Lokasi Acara",
      icon: UniconsLine.map_marker,
      url: url,
    );
  }
}

class ButtonOpenIG extends StatelessWidget {
  const ButtonOpenIG(this.url, {Key? key}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return ButtonOpen(
      title: "Instagram",
      icon: UniconsLine.instagram,
      url: url,
    );
  }
}

class ButtonOpenYT extends StatelessWidget {
  const ButtonOpenYT(this.url, {Key? key}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return ButtonOpen(
      title: "Live Youtube",
      icon: UniconsLine.youtube,
      url: url,
    );
  }
}

class ButtonOpen extends StatelessWidget {
  const ButtonOpen({
    Key? key,
    required this.url,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String url;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () async {
          if (await canLaunch(url)) {
            await launch(
              url,
              forceSafariVC: true,
              forceWebView: true,
              webOnlyWindowName: '_blank',
            );
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.pinkAccent, width: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 12),
              const SizedBox(width: 2),
              Text(title, style: const TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
