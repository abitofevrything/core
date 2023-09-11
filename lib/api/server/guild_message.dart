import 'package:mineral/api/server/channels/text_channel.dart';
import 'package:mineral/api/server/guild.dart';
import 'package:mineral/api/server/guild_member.dart';
import 'package:mineral/api/shared/message.dart';

final class GuildMessage extends Message {
  final TextChannel channel;
  final Guild guild;
  final GuildMember member;
  List<Null> roles; // todo implement roles

  GuildMessage._({
      required super.id,
      required super.content,
      required super.user,
      required super.timestamp,
      required super.editedTimestamp,
      required super.tts,
      required super.mentionEveryone,
      required super.mentions,
      required super.pinned,
      required super.type,
      required super.reactions,
      required super.attachments,
      required super.embeds,
      required this.channel,
      required this.guild,
      required this.member,
      required this.roles
  });
}
