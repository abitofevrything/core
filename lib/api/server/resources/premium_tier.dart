enum PremiumTier {
  NONE(0, "No boost"),
  TIER_1(1, "Tier 1"),
  TIER_2(2, "Tier 2"),
  TIER_3(3, "Tier 3");

  final int value;
  final String description;

  const PremiumTier(this.value, this.description);

  static PremiumTier from(final int value) {
    switch (value) {
      case 0: return PremiumTier.NONE;
      case 1: return PremiumTier.TIER_1;
      case 2: return PremiumTier.TIER_2;
      case 3: return PremiumTier.TIER_3;
      default: throw ArgumentError('Unknown premium tier: $value');
    }
  }
}