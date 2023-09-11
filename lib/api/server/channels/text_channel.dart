import '../cache/guild_message_cache.dart';
import 'guild_channel.dart';

class TextChannel extends GuildChannel {
  GuildMessageCache messages = GuildMessageCacheEntity();
  bool? nsfw;
  int? rateLimitPerUser;
  String? topic;

  TextChannel._(super.id, super.label, {
    required super.guild,
    required super.categoryChannel,
    required super.permissions,
    required super.flags,
    required super.position,
    required this.nsfw,
    required this.rateLimitPerUser,
    required this.topic
  });
}