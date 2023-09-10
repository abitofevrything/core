class Snowflake {
  final String id;

  Snowflake(this.id);

  @override
  String toString() => id;

  @override
  bool operator ==(dynamic other) => other == id;

  @override
  int get hashCode => id.hashCode;
}

