import 'dart:io';

import 'package:aria2c/result/aria2cStatus.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aria2c/aria2cWebSocketRPC.dart';

void main() {
  test('Test Running', () async {
    print(Aria2cStatus.fromJson({
      "gid": "0",
      "status": "active",
      "totalLength": 0,
      "completedLength": 0,
      "uploadLength": 0,
      "bitfield": "000000000000000000000000000",
    }));
  });
}
