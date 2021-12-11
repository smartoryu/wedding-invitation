import 'package:wedding_invitation/src/views.dart';

class ButtonOpenMap extends StatelessWidget {
  const ButtonOpenMap({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 75,
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.pinkAccent,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(UniconsLine.map_marker, size: 12),
              Text("Open map", style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
