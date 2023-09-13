import 'package:mineral/api/server/channels/category_channel.dart';
import 'package:mineral/api/server/channels/resources/permissions_overwrite.dart';
import 'package:mineral/api/server/guild.dart';
import 'package:mineral/api/shared/channel.dart';
import 'package:mineral/internal/services/http/discord_http_client.dart';

class GuildChannel extends Channel {
  final Guild guild;
  CategoryChannel categoryChannel;
  List<PermissionsOverwrite> permissions;
  int? flags;

  GuildChannel(super.id, super.label, {
    required this.guild,
    required this.categoryChannel,
    required this.permissions,
    required this.flags,
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
