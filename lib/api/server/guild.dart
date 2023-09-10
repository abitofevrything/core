import 'package:mineral/api/managers/guild_managers/channels_manager.dart';
import 'package:mineral/api/managers/guild_managers/emojis_manager.dart';
import 'package:mineral/api/managers/guild_managers/roles_manager.dart';
import 'package:mineral/api/private/user.dart';
import 'package:mineral/api/server/channels/text_channel.dart';
import 'package:mineral/api/server/resources/guild_enum.dart';
import 'package:mineral/api/server/resources/guild_features.dart';
import 'package:mineral/api/server/resources/locale.dart';
import 'package:mineral/api/shared/snowflake.dart';
import 'package:mineral/internal/mixins/collection.dart';

import '../managers/guild_managers/member_manager.dart';
import '../managers/image_formatter.dart';
import 'channels/voice_channel.dart';

final class Guild {
  final String id;
  String label;
  String? description;
  User owner;

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
  Snowflake? systemChannelId;
  Snowflake? publicUpdatesChannelId;
  Snowflake? systemChannelFlagsId;
  Snowflake? safetyAlertsChannelId;

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

  String? applicationId;
  int? maxPresences;
  int? maxMembers;
  String vanityUrlCode;
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
    required this.owner,
    required this.icon,
    required this.banner,
    required this.splash,
    required this.afkChannelId,
    required this.afkTimeout,
    required this.rulesChannelId,
    required this.systemChannelId,
    required this.publicUpdatesChannelId,
    required this.systemChannelFlagsId,
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
    required this.vanityUrlCode,
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
      "owner_id": owner.id,
      "splash": splash,
      "discovery_splash": splash,
      "system_channel_id": systemChannelId,
      "system_channel_flags": systemChannelFlagsId,
      "rules_channel_id": rulesChannelId,
      "public_updates_channel_id": publicUpdatesChannelId,
      "preferred_locale": preferredLocale.locale,
      "features": features.map((e) => e.name),
      "premium_progress_bar_enabled": premiumProgressBarEnabled,
      "safety_alerts_channel_id": safetyAlertsChannelId,
    };
  }
}
