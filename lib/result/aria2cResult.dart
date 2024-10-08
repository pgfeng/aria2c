class Aria2cResult {
  final String id;
  final String gid;
  final Map result;

  Aria2cResult(this.id, this.gid, this.result);

  factory Aria2cResult.fromJson(Map json) {
    Map result = {};
    // 只保存非ID和GID的数据
    json.forEach((key, value) {
      if (key != 'id' && key != 'gid') {
        result[key] = value;
      }
    });
    return Aria2cResult(json['id'], json['result'] ?? '', result);
  }

  toJson() {
    return {
      'id': id,
      'gid': gid,
      'result': result,
    };
  }

  @override
  toString() {
    return toJson().toString();
  }
}
