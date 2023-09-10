enum VerificationLevel {
  NONE(0, "Unrestricted"),
  LOW(1, "Must have verified email on account"),
  MEDIUM(2, "Must be registered on Discord for longer than 5 minutes"),
  HIGH(3, "Must be a member of the server for longer than 10 minutes"),
  VERY_HIGH(4, "Must have a verified phone number");

  final int value;
  final String description;

  const VerificationLevel(this.value, this.description);
}

enum NotificationLevel {
  ALL_MESSAGES(0, "All messages"),
  ONLY_MENTIONS(1, "Only @mentions");

  final int value;
  final String description;

  const NotificationLevel(this.value, this.description);
}

enum ContentFilterLevel {
  DISABLED(0, "Don't scan any messages."),
  MEMBERS_WITHOUT_ROLES(1, "Scan messages from members without a role."),
  ALL_MEMBERS(2, "Scan messages sent by all members.");

  final int value;
  final String description;

  const ContentFilterLevel(this.value, this.description);
}

enum MFALevel {
  NONE(0, "No MFA requirement for server members"),
  ELEVATED(1, "MFA requirement for server members with a role");

  final int value;
  final String description;

  const MFALevel(this.value, this.description);
}

enum PremiumTier {
  NONE(0, "No boost"),
  TIER_1(1, "Tier 1"),
  TIER_2(2, "Tier 2"),
  TIER_3(3, "Tier 3");

  final int value;
  final String description;

  const PremiumTier(this.value, this.description);
}

enum NSFWLevel {
  DEFAULT(0, "Default"),
  EXPLICIT(1, "Explicit"),
  SAFE(2, "Safe"),
  AGE_RESTRICTED(3, "Age restricted");

  final int value;
  final String description;

  const NSFWLevel(this.value, this.description);

}