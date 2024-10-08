library aria2c;

import 'dart:convert';

import 'package:aria2c/positionHow.dart';
import 'package:aria2c/request/aria2cRequest.dart';
import 'package:aria2c/result/aria2cResult.dart';
import 'package:aria2c/result/aria2cStatusResult.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Aria2cWebSocketRPC {
  final Uri rpcUri;
  final String rpcSecret;
  late WebSocketChannel _socket;
  final listeners = <String, Function>{};
  final _responses = <String, Future<Map>>{};
  final bool cancelOnError;

  Aria2cWebSocketRPC(this.rpcUri,
      {this.rpcSecret = '', this.cancelOnError = true}) {}

  connect() async {
    _socket = WebSocketChannel.connect(rpcUri);
    try{
      await _socket.ready;
    } catch(e) {
      await Future.delayed(Duration(seconds: 1), () {
        connect();
      });
      return;
    }
    _socket.stream.listen((event) {
      var data = jsonDecode(event);
      if (data['id'] != null) {
        _responses[data['id']] = Future.value(data);
      }
    }, onDone: () {
      _socket.sink.close();
      Future.delayed(Duration(seconds: 1), () {
        connect();
      });
    }, onError: (e) {
      Future.delayed(Duration(seconds: 1), () {
        connect();
      });
    }, cancelOnError: cancelOnError);
  }

  Future<Map> call(Aria2cRequest request) async {
    request.setToken(rpcSecret);
    String data = jsonEncode(request.toJson());
    _socket.sink.add(data);
    while (!_responses.containsKey(request.id)) {
      await Future.delayed(Duration(milliseconds: 100));
    }
    return _responses.remove(request.id)!;
  }

  // 添加下载任务
  Future<Aria2cResult> addUri(String uri, Map options) async {
    Map result = await call(Aria2cRequest(
      method: 'aria2.addUri',
      params: [
        [uri],
        options,
      ],
    ));
    return Aria2cResult.fromJson(result);
  }

  // 添加torrent下载任务
  Future<Map> addTorrent(String torrent, Map options) {
    return call(Aria2cRequest(method: 'aria2.addTorrent', params: [
      torrent,
      options,
    ]));
  }

  // 添加metalink下载任务
  Future<Map> addMetalink(String metalink, Map options) {
    return call(Aria2cRequest(method: 'aria2.addMetalink', params: [
      metalink,
      options,
    ]));
  }

  // 删除下载任务
  Future<Aria2cResult> remove(String gid) async {
    var result =
        await call(Aria2cRequest(method: 'aria2.remove', params: [gid]));
    return Aria2cResult.fromJson(result);
  }

  // 强制删除下载任务
  Future<Map> forceRemove(String gid) {
    return call(Aria2cRequest(method: 'aria2.forceRemove', params: [gid]));
  }

  // 暂停下载任务
  Future<Map> pause(String gid) {
    return call(Aria2cRequest(method: 'aria2.pause', params: [gid]));
  }

  // 暂停所有下载任务
  Future<Map> pauseAll() {
    return call(Aria2cRequest(method: 'aria2.pauseAll', params: []));
  }

  // 强制暂停下载任务
  Future<Map> forcePause(String gid) {
    return call(Aria2cRequest(method: 'aria2.forcePause', params: [gid]));
  }

  // 强制暂停所有下载任务
  Future<Map> forcePauseAll() {
    return call(Aria2cRequest(method: 'aria2.forcePauseAll', params: []));
  }

  // 恢复下载任务
  Future<Map> unpause(String gid) {
    return call(Aria2cRequest(method: 'aria2.unpause', params: [gid]));
  }

  // 恢复所有下载任务
  Future<Map> unpauseAll() {
    return call(Aria2cRequest(method: 'aria2.unpauseAll', params: []));
  }

  // 获取下载任务状态
  Future<Aria2cStatusResult> tellStatus(String gid) async {
    Map data = await call(Aria2cRequest(method: 'aria2.tellStatus', params: [
      gid,
    ]));
    return Aria2cStatusResult.fromJson(data);
  }

  // 获取下载任务的URI
  Future<Map> getUris(String gid) {
    return call(Aria2cRequest(method: 'aria2.getUris', params: [
      gid
    ]));
  }

  // 获取下载任务的文件路径
  Future<Map> getFiles(String gid) {
    return call(Aria2cRequest(method: 'aria2.getFiles', params: [gid]));
  }

  // [BitTorrent]获取下载任务的peers
  Future<Map> getPeers(String gid) {
    return call(Aria2cRequest(method: 'aria2.getPeers', params: [gid]));
  }

  // 获取下载任务的服务器
  Future<Map> getServers(String gid) {
    return call(Aria2cRequest(method: 'aria2.getServers', params: [gid]));
  }

  // 批量获取下载任务状态
  Future<Map> tellActive() {
    return call(Aria2cRequest(method: 'aria2.tellActive', params: []));
  }

  // 批量获取下载任务状态
  Future<Map> tellWaiting(int offset, int num) {
    return call(
        Aria2cRequest(method: 'aria2.tellWaiting', params: [offset, num]));
  }

  // 获取已停止下载任务状态
  Future<Map> tellStopped(int offset, int num) {
    return call(
        Aria2cRequest(method: 'aria2.tellStopped', params: [offset, num]));
  }

  // 改变下载任务的位置
  // @see https://aria2.github.io/manual/en/html/aria2c.html#aria2.changePosition
  Future<Map> changePosition(String gid, int pos, PositionHow how) {
    return call(Aria2cRequest(
      method: 'aria2.changePosition',
      params: [gid, pos, how.toString().split('.').last],
    ));
  }

  // 改变下载任务的URI
  Future<Map> changeUri(
      String gid, int fileIndex, List<String> deleteUri, List<String> addUris) {
    return call(Aria2cRequest(
      method: 'aria2.changeUri',
      params: [gid, fileIndex, deleteUri, addUris],
    ));
  }

  // 获取下载任务的选项
  Future<Map> getOption(String gid) {
    return call(Aria2cRequest(method: 'aria2.getOption', params: [gid]));
  }

  // 改变下载任务的选项
  Future<Map> changeOption(String gid, Map options) {
    return call(
        Aria2cRequest(method: 'aria2.changeOption', params: [gid, options]));
  }

  // 获取全局选项
  Future<Map> getGlobalOption() {
    return call(Aria2cRequest(method: 'aria2.getGlobalOption', params: []));
  }

  // 改变全局选项
  Future<Map> changeGlobalOption(Map options) {
    return call(
        Aria2cRequest(method: 'aria2.changeGlobalOption', params: [options]));
  }

  // 获取全局统计信息
  Future<Map> getGlobalStat() {
    return call(Aria2cRequest(method: 'aria2.getGlobalStat', params: []));
  }

  // 清除已完成/错误/已删除的下载以释放内存
  Future<Map> purgeDownloadResult() {
    return call(Aria2cRequest(method: 'aria2.purgeDownloadResult', params: []));
  }

  // 移除已完成/错误/已删除的下载
  Future<Map> removeDownloadResult(String gid) {
    return call(
        Aria2cRequest(method: 'aria2.removeDownloadResult', params: [gid]));
  }

  // 获取版本信息
  Future<Map> getVersion() {
    return call(Aria2cRequest(method: 'aria2.getVersion', params: []));
  }

  // 获取会话信息
  Future<Map> getSessionInfo() {
    return call(Aria2cRequest(method: 'aria2.getSessionInfo', params: []));
  }

  // 关闭aria2
  Future<Map> shutdown() {
    return call(Aria2cRequest(method: 'aria2.shutdown', params: []));
  }

  // 强制关闭aria2
  Future<Map> forceShutdown() {
    return call(Aria2cRequest(method: 'aria2.forceShutdown', params: []));
  }

  // 保存会话信息
  Future<Map> saveSession() {
    return call(Aria2cRequest(method: 'aria2.saveSession', params: []));
  }

  Future<Map> multiCall(List<Aria2cRequest> requests) {
    List params = requests.map((e) {
      return {
        'methodName': e.method,
        'params': e.params,
      };
    }).toList();
    return call(Aria2cRequest(method: 'system.multicall', params: params));
  }

  Future<Map> listMethods() {
    return call(Aria2cRequest(method: 'system.listMethods', params: []));
  }

  Future<Map> listNotifications() {
    return call(Aria2cRequest(method: 'system.listNotifications', params: []));
  }
}
