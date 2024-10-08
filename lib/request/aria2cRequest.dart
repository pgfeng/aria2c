import 'package:uuid/uuid.dart';

class Aria2cRequest {
  final String method;
  final String jsonrpc;
  final dynamic id;
  final List<dynamic> params;
  late final String _token;

  Aria2cRequest(
      {required this.method,
      required this.params,
      this.jsonrpc = '2.0',
      String token = ''})
      : _token = token,
        id = const Uuid().v4();

  setToken(String token) {
    _token = token;
  }

  Map<String, dynamic> toJson() {
    if (_token != '') {
      params.insert(0, 'token:$_token');
    }
    return {
      'jsonrpc': jsonrpc,
      'id': id,
      'method': method,
      'params': params,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
