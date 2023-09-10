import 'package:mineral/api/server/guild.dart';
import 'package:mineral/internal/services/http/discord_http_client.dart';

import '../../shared/channel.dart';

class GuildChannel extends Channel {
  final Guild guild;
  Null categoryChannel;
  List<Null> permissions;
  int? flags;
  int? position;

  GuildChannel(super.id, super.label, {
    required this.guild,
    required this.categoryChannel,
    required this.permissions,
    required this.flags,
    required this.position
  });

  /// Delete this channel
  /// ```dart
  /// await channel.delete();
  /// ```
  ///
  Future<void> delete() async {
    await DiscordHttpClient.singleton()
        .delete('/channels/$id')
        .build();
  }

  /// Edit this channel
  /// ```dart
  /// await channel.edit(label: 'new label', permissions: [PermissionsOverwrite(id: '', type: PermissionType.member, allow: true)]);
  /// ```
  Future<void> edit({String? label, List<Null>? permissions}) async {
    // todo
  }
}
