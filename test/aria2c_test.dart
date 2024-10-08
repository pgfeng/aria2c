import 'dart:io';

import 'package:aria2c/aria2cWebSocketRPC.dart';
import 'package:aria2c/result/aria2cStatusResult.dart';

import 'package:test/test.dart';

void main() {
  // Test Aria2cWebSocketRPC
  test('Test SocketConnect', () async {
    Aria2cWebSocketRPC rpc = Aria2cWebSocketRPC(Uri.parse('ws://127.0.0.1:6800/jsonrpc'), rpcSecret: '123456789');
    await rpc.connect();
    // rpc.messages.listen((r){
    //   print('???');
    //   print(r);
    //   print(r.runtimeType);
    // });
    print('Socket Connected');
    rpc.getVersion().then((r){
      print(r);
    });
    rpc.getGlobalStat().then((r){
      print(r);
    });
  });
  // test('Test Aria2cStatus FromJson', () async {
  //   print(Aria2cStatus.fromJson({
  //     "gid": "0",
  //     "status": "active",
  //     "totalLength": 0,
  //     "completedLength": 0,
  //     "uploadLength": 0,
  //     "bitfield": "000000000000000000000000000",
  //   }));
  // });
}
