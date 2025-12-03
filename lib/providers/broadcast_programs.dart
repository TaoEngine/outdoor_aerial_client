import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:outdoor_aerial_client/models/broadcast_program.dart';
import 'package:outdoor_aerial_client/models/broadcast_studio.dart';

part 'broadcast_programs.g.dart';

@riverpod
class BroadcastPrograms extends _$BroadcastPrograms {
  @override
  List<BroadcastProgram> build() {
    return [
      BroadcastProgram(
        id: ByteData(8),
        logo: AssetImage("assets/sample1.png"),
        name: "汽车315",
        studio: BroadcastStudio.getServer(Int8List.fromList([])),
        date: [.monday, .tuesday, .wednesday, .thursday, .friday],
        start: TimeOfDay(hour: 11, minute: 0),
        end: TimeOfDay(hour: 12, minute: 0),
        hosts: ["常虹", "周敏", "雪峰", "魏国", "梦泽", "十一"],
      ),
    ];
  }
}
