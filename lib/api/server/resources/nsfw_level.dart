enum NSFWLevel {
  DEFAULT(0, "Default"),
  EXPLICIT(1, "Explicit"),
  SAFE(2, "Safe"),
  AGE_RESTRICTED(3, "Age restricted");

  final int value;
  final String description;

  const NSFWLevel(this.value, this.description);

  static NSFWLevel from(final int value) {
    switch (value) {
      case 0: return NSFWLevel.DEFAULT;
      case 1: return NSFWLevel.EXPLICIT;
      case 2: return NSFWLevel.SAFE;
      case 3: return NSFWLevel.AGE_RESTRICTED;
      default: throw ArgumentError('Unknown NSFW level: $value');
    }
  }
}