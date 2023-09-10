import 'package:mineral/api/server/channels/text_channel.dart';
import 'package:mineral/api/channels/guild/voice_channel.dart';
import 'package:mineral/api/guild/enum/locale.dart';
import 'package:mineral/api/managers/guild_managers/channels_manager.dart';
import 'package:mineral/api/managers/guild_managers/emojis_manager.dart';
import 'package:mineral/api/managers/guild_managers/roles_manager.dart';
import 'package:mineral/api/private/user.dart';

import '../managers/guild_managers/member_manager.dart';
import '../managers/image_formatter.dart';
import '../guild/enum/guild_enum.dart';
import '../guild/enum/guild_features.dart';

final class Guild {
  final String id;
  String label;
  String? description;
  User owner;

  final MemberManager members;
  final RolesManager roles;
  final ChannelsManager channels;
  final EmojisManager emojis;

  ImageFormatter? icon;
  ImageFormatter? banner;

  VoiceChannel? afkChannel;
  int? afkTimeout;

  TextChannel? rulesChannel;
  TextChannel? systemChannel;
  TextChannel? publicUpdatesChannel;
  TextChannel? systemChannelFlags;
  TextChannel? safetyAlertsChannel;

  bool? widgetEnabled;
  TextChannel? widgetChannel;

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

  Guild({
    required this.id,
    required this.label,
    required this.description,
    required this.owner,
    required this.members,
    required this.roles,
    required this.channels,
    required this.icon,
    required this.banner,
    required this.afkChannel,
    required this.afkTimeout,
    required this.rulesChannel,
    required this.systemChannel,
    required this.publicUpdatesChannel,
    required this.widgetEnabled,
    required this.widgetChannel,
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
    required this.emojis,
    required this.systemChannelFlags,
    required this.safetyAlertsChannel,
  });
}
