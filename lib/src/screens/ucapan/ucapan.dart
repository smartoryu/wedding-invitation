// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:wedding_invitation/src/screens/components/audio_toggle.dart';
import 'package:wedding_invitation/src/views.dart';

class UcapanScreen extends StatelessWidget {
  const UcapanScreen({
    Key? key,
    required this.onWillPop,
    required this.isPlaying,
    required this.toggleAudio,
    this.ucapan = const [],
    this.onSend,
    this.conName,
    this.conMessage,
  }) : super(key: key);

  final Future<bool> Function() onWillPop;
  final bool isPlaying;
  final void Function() toggleAudio;
  final List<List<String>>? ucapan;
  final void Function()? onSend;
  final TextEditingController? conName;
  final TextEditingController? conMessage;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double bgWidth = width > 480 ? 480 : width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                bottom: 150,
                child: Image.asset(
                  'assets/img/img-side-by-side.jpg',
                  width: bgWidth,
                  height: height,
                  fit: BoxFit.cover,
                ),
              ),

              //

              Container(
                constraints: const BoxConstraints(maxWidth: 480),
                width: bgWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
                          reverse: true,
                          itemCount: ucapan?.length ?? 0,
                          itemBuilder: (context, index) {
                            var item = ucapan?[index];

                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                width: width > 480 ? 480 - 64 : width,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.withOpacity(0.75),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item?[0] ?? "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      item?[1] ?? "",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image:
                              AssetImage('assets/img/logo-bg-with-spark.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.5),
                            BlendMode.dstATop,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
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
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(),
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
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(),
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
                            child: Text("Kirim"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //

              // AUDIO TOGGLE
              AudioToggle(
                bottom: 8,
                right: 16,
                toggleAudio: toggleAudio,
                isPlaying: isPlaying,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// assets/img/img-side-by-side.jpg
