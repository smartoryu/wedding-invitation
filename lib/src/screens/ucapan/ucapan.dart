// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:wedding_invitation/src/screens/components/audio_toggle.dart';
import 'package:wedding_invitation/src/views.dart';

import '__model.dart';
import '_background.dart';
import '_input.dart';

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
    // width: width > 480 ? 480 - 64 : width,

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              UcapanBackground(bgWidth: bgWidth, height: height),

              Container(
                constraints: const BoxConstraints(maxWidth: 480),
                width: bgWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                        child: greetingList(bgWidth),
                      ),
                    ),
                    UcapanInput(
                      conName: conName,
                      conMessage: conMessage,
                      onSend: onSend,
                    ),
                  ],
                ),
              ),

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

  StreamBuilder<QuerySnapshot<Object?>> greetingList(double width) {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: DatabaseService().greetings.fetch,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          debugPrint(snapshot.error.toString());
          return const Text("Network Error");
        }

        if (snapshot.hasData) {
          List<UcapanModel> data = [];
          for (var e in snapshot.data!.docs) {
            var json = e.data();
            var item = UcapanModel.fromJson(jsonDecode(jsonEncode(json)));
            data.insert(0, item);
          }

          debugPrint("$data");

          return ListView.separated(
              reverse: true,
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemCount: data.length,
              itemBuilder: (context, index) {
                var item = data[index];

                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item.message,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
