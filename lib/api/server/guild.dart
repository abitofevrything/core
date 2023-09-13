import 'package:mineral/api/managers/guild_managers/channels_manager.dart';
import 'package:mineral/api/managers/guild_managers/emojis_manager.dart';
import 'package:mineral/api/managers/guild_managers/member_manager.dart';
import 'package:mineral/api/managers/guild_managers/roles_manager.dart';
import 'package:mineral/api/managers/image_formatter.dart';
import 'package:mineral/api/server/channels/text_channel.dart';
import 'package:mineral/api/server/channels/voice_channel.dart';
import 'package:mineral/api/server/resources/enums.dart';
import 'package:mineral/api/server/resources/vanity.dart';
import 'package:mineral/api/shared/snowflake.dart';
import 'package:mineral/internal/mixins/collection.dart';

final class Guild {
  final String id;
  String label;
  String? description;
  Snowflake ownerId;

  final MemberManager members = MemberManager();
  final RolesManager roles = RolesManager();
  final ChannelsManager channels = ChannelsManager();
  final EmojisManager emojis = EmojisManager();

  ImageFormatter? icon;
  ImageFormatter? banner;
  ImageFormatter? splash;

  Snowflake? afkChannelId;
  int? afkTimeout;

  Snowflake? rulesChannelId;
  Snowflake? publicUpdatesChannelId;
  Snowflake? safetyAlertsChannelId;
  Snowflake? systemChannelId;
  int? systemChannelFlags;

  bool? widgetEnabled;
  Snowflake? widgetChannelId;

  VerificationLevel verificationLevel;
  NotificationLevel defaultNotificationLevel;
  ContentFilterLevel explicitContentFilter;
  NSFWLevel nsfwLevel;
  MFALevel mfaLevel;
  PremiumTier premiumTier;
  Locale preferredLocale;
  List<GuildFeature> features;
  Vanity? vanity;

  String? applicationId;
  int? maxPresences;
  int? maxMembers;
  int? premiumSubscriptionCount;
  int? maxVideoChannelUsers;
  int? maxStageVideoChannelUsers;
  int? approximateMemberCount;
  int? approximatePresenceCount;
  bool premiumProgressBarEnabled;

  Guild._({
    required this.id,
    required this.label,
    required this.description,
    required this.ownerId,
    required this.icon,
    required this.banner,
    required this.splash,
    required this.afkChannelId,
    required this.afkTimeout,
    required this.rulesChannelId,
    required this.systemChannelId,
    required this.publicUpdatesChannelId,
    required this.systemChannelFlags,
    required this.safetyAlertsChannelId,
    required this.widgetEnabled,
    required this.widgetChannelId,
    required this.verificationLevel,
    required this.defaultNotificationLevel,
    required this.explicitContentFilter,
    required this.nsfwLevel,
    required this.mfaLevel,
    required this.premiumTier,
    required this.preferredLocale,
    required this.features,
    required this.applicationId,
    required this.maxPresences,
    required this.maxMembers,
    required this.premiumSubscriptionCount,
    required this.maxVideoChannelUsers,
    required this.maxStageVideoChannelUsers,
    required this.approximateMemberCount,
    required this.approximatePresenceCount,
    required this.premiumProgressBarEnabled,
  });

  TextChannel? get systemChannel => channels.cache.get(systemChannelId.toString());
  TextChannel? get publicUpdatesChannel => channels.cache.get(publicUpdatesChannelId.toString());
  TextChannel? get safetyAlertsChannel => channels.cache.get(safetyAlertsChannelId.toString());
  TextChannel? get widgetChannel => channels.cache.get(widgetChannelId.toString());
  VoiceChannel? get afkChannel => channels.cache.get(afkChannelId.toString());
  VoiceChannel? get rulesChannel => channels.cache.get(rulesChannelId.toString());

  /// [Guild] to Json method is private
  dynamic _toJson() {
    return {
      "name": label,
      "description": description,
      "icon": icon,
      "banner": banner,
      "verification_level": verificationLevel.value,
      "default_message_notifications": defaultNotificationLevel.value,
      "explicit_content_filter": explicitContentFilter.value,
      "afk_channel_id": afkChannelId,
      "afk_timeout": afkTimeout,
      "owner_id": ownerId,
      "splash": splash,
      "discovery_splash": splash,
      "system_channel_id": systemChannelId,
      "system_channel_flags": systemChannelFlags,
      "rules_channel_id": rulesChannelId,
      "public_updates_channel_id": publicUpdatesChannelId,
      "preferred_locale": preferredLocale.locale,
      "features": features.map((e) => e.name),
      "premium_progress_bar_enabled": premiumProgressBarEnabled,
      "safety_alerts_channel_id": safetyAlertsChannelId,
    };
  }

  // not tested
  factory Guild.from(final payload) {
    List<GuildFeature> features = [];

    if (payload["features"] != null) {
      for (final feature in payload["features"]) {
        GuildFeature? guildFeature = GuildFeature.from(feature);
        if (guildFeature != null) features.add(guildFeature);
      }
    }

    return Guild._(
        id: payload["id"],
        label: payload["name"],
        description: payload["description"],
        ownerId: payload["owner_id"],
        icon: ImageFormatter(payload["icon"]),
        banner: ImageFormatter(payload["banner"]),
        splash: ImageFormatter(payload["splash"]),
        afkChannelId: payload["afk_channel_id"],
        afkTimeout: payload["afk_timeout"],
        rulesChannelId: payload["rules_channel_id"],
        systemChannelId: payload["system_channel_id"],
        publicUpdatesChannelId: payload["public_updates_channel_id"],
        systemChannelFlags: payload["system_channel_flags"],
        safetyAlertsChannelId: payload["safety_alerts_channel_id"],
        widgetEnabled: payload["widget_enabled"],
        widgetChannelId: payload["widget_channel_id"],
        verificationLevel: VerificationLevel.from(payload["verification_level"]),
        defaultNotificationLevel: NotificationLevel.from(payload["default_message_notifications"]),
        explicitContentFilter: ContentFilterLevel.from(payload["explicit_content_filter"]),
        nsfwLevel: NSFWLevel.from(payload["nsfw_level"]),
        mfaLevel: MFALevel.from(payload["mfa_level"]),
        premiumTier: PremiumTier.from(payload["premium_tier"]),
        preferredLocale: Locale.from(payload["preferred_locale"]),
        features: features,
        applicationId: payload["application_id"],
        maxPresences: payload["max_presences"],
        maxMembers: payload["max_members"],
        premiumSubscriptionCount: payload["premium_subscription_count"],
        maxVideoChannelUsers: payload["max_video_channel_users"],
        maxStageVideoChannelUsers: payload["max_stage_video_channel_users"],
        approximateMemberCount: payload["approximate_member_count"],
        approximatePresenceCount: payload["approximate_presence_count"],
        premiumProgressBarEnabled: payload["premium_progress_bar_enabled"]
    );
  }
}
