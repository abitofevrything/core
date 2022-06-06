import 'package:http/http.dart';
import 'package:mineral/api.dart';
import 'package:mineral/core.dart';
import 'package:mineral/exception.dart';
import 'package:mineral/helper.dart';
import 'package:mineral/src/api/managers/role_manager.dart';

class Tag {
  Snowflake? botId;
  Snowflake? integrationId;
  bool? premiumSubscriber;

  Tag({ required this.botId, required Snowflake? integrationId, required bool? premiumSubscriber });

  factory Tag.from({ required payload }) {
    return Tag(
      botId: payload['bot_id'],
      integrationId: payload['integration_id'],
      premiumSubscriber: payload['premium_subscriber']
    );
  }
}

class Role {
  Snowflake id;
  String label;
  int color;
  bool hoist;
  String? icon;
  String? unicodeEmoji;
  int position;
  int permissions;
  bool managed;
  bool mentionable;
  Tag? tags;
  RoleManager manager;

  Role({
    required this.id,
    required this.label,
    required this.color,
    required this.hoist,
    required this.icon,
    required this.unicodeEmoji,
    required this.position,
    required this.permissions,
    required this.managed,
    required this.mentionable,
    required this.tags,
    required this.manager,
  });

  Future<void> setLabel (String label) async {
    Http http = ioc.singleton(Service.http);

    Response response = await http.patch(url: "/guilds/${manager.guildId}/roles/$id", payload: { 'name': label });
    if (response.statusCode == 200) {
      this.label = label;
    }
  }

  Future<void> setPermissions (List<Permission> permissions) async {
    Http http = ioc.singleton(Service.http);

    int _permissions = Helper.reduceRolePermissions(permissions);
    Response response = await http.patch(url: "/guilds/${manager.guildId}/roles/$id", payload: { 'permissions': _permissions });

    if (response.statusCode == 200) {
      this.permissions = _permissions;
    }
  }

  Future<void> setColor (Color color) async {
    Http http = ioc.singleton(Service.http);

    int _color = Helper.toRgbColor(color);
    Response response = await http.patch(url: "/guilds/${manager.guildId}/roles/$id", payload: { 'color': _color });
    if (response.statusCode == 200) {
      this.color = _color;
    }
  }

  Future<void> setHoist (bool hoist) async {
    Http http = ioc.singleton(Service.http);

    Response response = await http.patch(url: "/guilds/${manager.guildId}/roles/$id", payload: { 'hoist': hoist });
    if (response.statusCode == 200) {
      this.hoist = hoist;
    }
  }

  Future<void> setIcon (String path) async {
    if (!manager.guild.features.contains('ROLE_ICONS')) {
      throw MissingFeatureException(cause: "Guild ${manager.guild.name} has no 'ROLE_ICONS' feature.");
    }

    String icon = await Helper.getPicture(path);

    Http http = ioc.singleton(Service.http);
    Response response = await http.patch(url: "/guilds/${manager.guildId}/roles/$id", payload: { 'icon': icon });
    if (response.statusCode == 200) {
      this.icon = icon;
    }
  }

  Future<void> setUnicodeEmoji (String unicode) async {
    if (!manager.guild.features.contains('ROLE_ICONS')) {
      throw MissingFeatureException(cause: "Guild ${manager.guild.name} has no 'ROLE_ICONS' feature.");
    }

    Http http = ioc.singleton(Service.http);
    Response response = await http.patch(url: "/guilds/${manager.guildId}/roles/$id", payload: { 'unicode_emoji': unicode });
    if (response.statusCode == 200) {
      unicodeEmoji = unicode;
    }
  }

  Future<void> setMentionable (bool mentionable) async {
    Http http = ioc.singleton(Service.http);
    Response response = await http.patch(url: "/guilds/${manager.guildId}/roles/$id", payload: { 'mentionable': mentionable });
    if (response.statusCode == 200) {
      this.mentionable = mentionable;
    }
  }

  Future<void> delete () async {
    if (managed || label == '@everyone') {
      return;
    }

    Http http = ioc.singleton(Service.http);
    Response response = await http.destroy(url: "/guilds/${manager.guildId}/roles/$id");

    if (response.statusCode == 200) {
      manager.cache.remove(id);
    }
  }

  factory Role.from({ required RoleManager roleManager, dynamic payload }) {
    return Role(
      id: payload['id'],
      label: payload['name'],
      color: payload['color'],
      hoist: payload['hoist'],
      icon: payload['icon'],
      unicodeEmoji: payload['unicode_emoji'],
      position: payload['position'],
      permissions: payload['permissions'],
      managed: payload['managed'],
      mentionable: payload['mentionable'],
      tags: payload['tags'] != null ? Tag.from(payload: payload['tags']) : null,
      manager: roleManager,
    );
  }
}