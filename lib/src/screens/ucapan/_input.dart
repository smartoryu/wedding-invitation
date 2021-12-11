import 'package:wedding_invitation/src/views.dart';

class UcapanInput extends StatelessWidget {
  const UcapanInput({
    Key? key,
    required this.conName,
    required this.conMessage,
    this.onSend,
  }) : super(key: key);

  final TextEditingController? conName;
  final TextEditingController? conMessage;
  final void Function()? onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: const AssetImage('assets/img/logo-bg-with-spark.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Column(
        children: [
          const Text(
            "Tulis ucapanmu di sini",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "DancingScript",
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(),
              ),
              isDense: true,
              labelText: 'Nama',
              hintText: "Isikan Nama Anda",
            ),
            controller: conName,
          ),
          const SizedBox(height: 8),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(),
              ),
              isDense: true,
              labelText: 'Ucapan',
              hintText: "Isikan Ucapan Anda",
            ),
            controller: conMessage,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onSend,
            child: const Text("Kirim"),
          )
        ],
      ),
    );
  }
}

// assets/img/img-side-by-side.jpg
