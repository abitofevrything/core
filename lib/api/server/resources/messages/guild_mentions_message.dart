import 'package:mineral/api/server/channels/guild_channel.dart';
import 'package:mineral/api/server/guild_member.dart';
import 'package:mineral/api/server/role.dart';

class GuildMentionsMessage {
  List<GuildMember> members;
  List<Role> roles;
  List<GuildChannel> channels;

  GuildMentionsMessage._({
    required this.members,
    required this.roles,
    required this.channels,
  });
}