class Timestamp {
  final int timestamp;

  Timestamp(this.timestamp);

  DateTime get dateTime => DateTime.fromMillisecondsSinceEpoch(timestamp);
  String get date => dateTime.toIso8601String();
  String get beautifulDate => '${dateTime.day}/${dateTime.month}/${dateTime.year}';
}