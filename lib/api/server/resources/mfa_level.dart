enum MFALevel {
  NONE(0, "No MFA requirement for server members"),
  ELEVATED(1, "MFA requirement for server members with a role");

  final int value;
  final String description;

  const MFALevel(this.value, this.description);

  static MFALevel from(final int value) {
    switch (value) {
      case 0: return MFALevel.NONE;
      case 1: return MFALevel.ELEVATED;
      default: throw ArgumentError('Unknown MFA level: $value');
    }
  }
}