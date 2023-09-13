enum NotificationLevel {
  ALL_MESSAGES(0, "All messages"),
  ONLY_MENTIONS(1, "Only @mentions");

  final int value;
  final String description;

  const NotificationLevel(this.value, this.description);

  static NotificationLevel from(final int value) {
    switch (value) {
      case 0: return NotificationLevel.ALL_MESSAGES;
      case 1: return NotificationLevel.ONLY_MENTIONS;
      default: throw ArgumentError('Unknown notification level: $value');
    }
  }
}