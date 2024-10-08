class Aria2cStatus {
  final String gid;
  final String status;
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
  final String files;
  final String bittorrent;
  final String verifiedLength;
  final String verifyIntegrityPending;

  Aria2cStatus({
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

  factory Aria2cStatus.fromJson(Map<String, dynamic> json) {
    return Aria2cStatus(
      gid: json['gid']??'',
      status: json['status']??'',
      totalLength: json['totalLength']??0,
      completedLength: json['completedLength']??0,
      uploadLength: json['uploadLength']??0,
      bitfield: json['bitfield']??'',
      downloadSpeed: json['downloadSpeed']??0,
      uploadSpeed: json['uploadSpeed']??0,
      connections: json['connections']??0,
      infoHash: json['infoHash']??'',
      numSeeders: json['numSeeders']??'',
      seeder: json['seeder']??'',
      pieceLength: json['pieceLength']??'',
      numPieces: json['numPieces']??'',
      errorCode: json['errorCode']??'',
      errorMessage: json['errorMessage']??'',
      followedBy: json['followedBy']??'',
      following: json['following']??'',
      belongsTo: json['belongsTo']??'',
      dir: json['dir']??'',
      files: json['files']??'',
      bittorrent: json['bittorrent']??'',
      verifiedLength: json['verifiedLength']??'',
      verifyIntegrityPending: json['verifyIntegrityPending']??'',
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