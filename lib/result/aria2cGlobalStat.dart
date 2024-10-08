class Aria2cGlobalStat {
  final int downloadSpeed;
  final int uploadSpeed;
  final int numActive;
  final int numWaiting;
  final int numStopped;
  final int numStoppedTotal;

  Aria2cGlobalStat(this.downloadSpeed, this.uploadSpeed, this.numActive,
      this.numWaiting, this.numStopped, this.numStoppedTotal);

  factory Aria2cGlobalStat.fromJson(Map<String, dynamic> json) {
    return Aria2cGlobalStat(
      json['downloadSpeed'] ?? 0,
      json['uploadSpeed'] ?? 0,
      json['numActive'] ?? 0,
      json['numWaiting'] ?? 0,
      json['numStopped'] ?? 0,
      json['numStoppedTotal'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'downloadSpeed': downloadSpeed,
      'uploadSpeed': uploadSpeed,
      'numActive': numActive,
      'numWaiting': numWaiting,
      'numStopped': numStopped,
      'numStoppedTotal': numStoppedTotal,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
