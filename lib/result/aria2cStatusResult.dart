enum Aria2cStatus{
  active,
  waiting,
  paused,
  error,
  complete,
  removed,
  unknown,
}
class Aria2cStatusResult {
  final String gid;
  final Aria2cStatus status;
  final int totalLength;
  final int completedLength;
  final int uploadLength;
  final String bitfield;
  final int downloadSpeed;
  final int uploadSpeed;
  final int connections;
  final String infoHash;
  final String numSeeders;
  final String seeder;
  final String pieceLength;
  final String numPieces;
  final String errorCode;
  final String errorMessage;
  final String followedBy;
  final String following;
  final String belongsTo;
  final String dir;
  final List files;
  final String bittorrent;
  final int verifiedLength;
  final String verifyIntegrityPending;

  Aria2cStatusResult({
    required this.gid,
    required this.status,
    required this.totalLength,
    required this.completedLength,
    required this.uploadLength,
    required this.bitfield,
    required this.downloadSpeed,
    required this.uploadSpeed,
    required this.connections,
    required this.infoHash,
    required this.numSeeders,
    required this.seeder,
    required this.pieceLength,
    required this.numPieces,
    required this.errorCode,
    required this.errorMessage,
    required this.followedBy,
    required this.following,
    required this.belongsTo,
    required this.dir,
    required this.files,
    required this.bittorrent,
    required this.verifiedLength,
    required this.verifyIntegrityPending,
  });

  factory Aria2cStatusResult.fromJson(Map json) {
    print(json);
    Aria2cStatus status = Aria2cStatus.unknown;
    Map data=json['result']??{};
    switch(data['status']){
      case 'active':
        status = Aria2cStatus.active;
        break;
      case 'waiting':
        status = Aria2cStatus.waiting;
        break;
      case 'paused':
        status = Aria2cStatus.paused;
        break;
      case 'error':
        status = Aria2cStatus.error;
        break;
      case 'complete':
        status = Aria2cStatus.complete;
        break;
      case 'removed':
        status = Aria2cStatus.removed;
        break;
      default:
        status = Aria2cStatus.unknown;
        break;
    }
    return Aria2cStatusResult(
      gid: data['gid']??'',
      status: status,
      totalLength: int.parse((data['totalLength']??0).toString()),
      completedLength: int.parse((data['completedLength']??0).toString()),
      uploadLength: int.parse((data['uploadLength']??0).toString()),
      bitfield: data['bitfield']??'',
      downloadSpeed: int.parse((data['downloadSpeed']??0).toString()),
      uploadSpeed: int.parse((data['uploadSpeed']??0).toString()),
      connections: int.parse((data['connections']??0).toString()),
      infoHash: data['infoHash']??'',
      numSeeders: data['numSeeders']??'',
      seeder: data['seeder']??'',
      pieceLength: data['pieceLength']??'',
      numPieces: data['numPieces']??'',
      errorCode: data['errorCode']??'',
      errorMessage: data['errorMessage']??'',
      followedBy: data['followedBy']??'',
      following: data['following']??'',
      belongsTo: data['belongsTo']??'',
      dir: data['dir']??'',
      files: data['files']??[],
      bittorrent: data['bittorrent']??'',
      verifiedLength: int.parse((data['verifiedLength']??'0').toString()),
      verifyIntegrityPending: data['verifyIntegrityPending']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gid': gid,
      'status': status,
      'totalLength': totalLength,
      'completedLength': completedLength,
      'uploadLength': uploadLength,
      'bitfield': bitfield,
      'downloadSpeed': downloadSpeed,
      'uploadSpeed': uploadSpeed,
      'connections': connections,
      'infoHash': infoHash,
      'numSeeders': numSeeders,
      'seeder': seeder,
      'pieceLength': pieceLength,
      'numPieces': numPieces,
      'errorCode': errorCode,
      'errorMessage': errorMessage,
      'followedBy': followedBy,
      'following': following,
      'belongsTo': belongsTo,
      'dir': dir,
      'files': files,
      'bittorrent': bittorrent,
      'verifiedLength': verifiedLength,
      'verifyIntegrityPending': verifyIntegrityPending,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}