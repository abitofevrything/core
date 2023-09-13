enum ContentFilterLevel {
  DISABLED(0, "Don't scan any messages."),
  MEMBERS_WITHOUT_ROLES(1, "Scan messages from members without a role."),
  ALL_MEMBERS(2, "Scan messages sent by all members.");

  final int value;
  final String description;

  const ContentFilterLevel(this.value, this.description);

  static ContentFilterLevel from(final int value) {
    switch (value) {
      case 0: return ContentFilterLevel.DISABLED;
      case 1: return ContentFilterLevel.MEMBERS_WITHOUT_ROLES;
      case 2: return ContentFilterLevel.ALL_MEMBERS;
      default: throw ArgumentError('Unknown content filter level: $value');
    }
  }
}