enum GuildFeature {
  ANIMATED_BANNER("ANIMATED_BANNER", "Guild has access to set an animated guild banner."),
  ANIMATED_ICON("ANIMATED_ICON", "Guild has access to set an animated guild icon."),
  APPLICATION_COMMAND_PERMISSIONS_V2("APPLICATION_COMMAND_PERMISSIONS_V2", "Guild is using the old permissions configuration behavior"),
  AUTO_MODERATION("AUTO_MODERATION", "Guild has set up auto moderation rules"),
  BANNER("BANNER", "Guild has access to set a guild banner image."),
  COMMUNITY("COMMUNITY", "Guild can enable welcome screen, Membership Screening, stage channels and discovery, and receives community updates."),
  CREATOR_MONETIZABLE_PROVISIONAL("CREATOR_MONETIZABLE_PROVISIONAL", "Guild has enabled monetization"),
  CREATOR_STORE_PAGE("CREATOR_STORE_PAGE", "Guild has enabled the role subscription promo page"),
  DEVELOPER_SUPPORT_SERVER("DEVELOPER_SUPPORT_SERVER", "Guild has been set as a support server on the App Directory"),
  DISCOVERABLE("DISCOVERABLE", "Guild is able to be discovered in the directory"),
  FEATURABLE("FEATURABLE", "Guild is able to be featured in the directory"),
  INVITES_DISABLED("INVITES_DISABLED", "Guild has disabled invites"),
  INVITE_SPLASH("INVITE_SPLASH", "Guild has access to set an invite splash background."),
  MEMBER_VERIFICATION_GATE_ENABLED("MEMBER_VERIFICATION_GATE_ENABLED", "Guild has enabled Membership Screening"),
  MORE_STICKERS("MORE_STICKERS", "Guild has access to more custom stickers"),
  NEWS("NEWS", "Guild has access to set guild news channel"),
  PARTNERED("PARTNERED", "Guild is partnered"),
  PREVIEW_ENABLED("PREVIEW_ENABLED", "Guild can be previewed before joining via Membership Screening or the directory"),
  RAID_ALERTS_DISABLED("RAID_ALERTS_DISABLED", "Guild has disabled alerts for join raids in the configured safety alerts channel"),
  ROLES_ICONS("ROLES_ICONS", "Guild has access to set role icons"),
  ROLE_SUBSCRIPTIONS_ENABLED("ROLE_SUBSCRIPTIONS_ENABLED", "Guild has enabled the role subscription feature"),
  TICKETED_EVENTS_ENABLED("TICKETED_EVENTS_ENABLED", "Guild has enabled ticketed events"),
  VANITY_URL("VANITY_URL", "Guild has access to set a vanity URL"),
  VERIFIED("VERIFIED", "Guild is verified"),
  VIP_REGIONS("VIP_REGIONS", "Guild has access to set 384kbps bitrate in voice (previously VIP voice servers)."),
  WELCOME_SCREEN_ENABLED("WELCOME_SCREEN_ENABLED", "Guild has enabled the welcome screen");

  final String name;
  final String description;

  const GuildFeature(this.name, this.description);
}