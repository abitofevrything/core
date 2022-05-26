import 'dart:convert';

import 'package:http/http.dart';
import 'package:mineral/api.dart';
import 'package:mineral/core.dart';
import 'package:mineral/exception.dart';
import 'package:mineral/helper.dart';
import 'package:mineral/src/api/managers/cache_manager.dart';

class RoleManager implements CacheManager<Role> {
  @override
  Collection<Snowflake, Role> cache = Collection();

  Snowflake guildId;
  late Guild guild;

  RoleManager({ required this.guildId });

  @override
  Future<Collection<Snowflake, Role>> sync () async {
    Http http = ioc.singleton(Service.http);
    cache.clear();

    Response response = await http.get("/guilds/$guildId/roles");
    dynamic payload = jsonDecode(response.body);

    for(dynamic element in payload) {
      Role role = Role.from(
        roleManager: this,
        payload: element,
      );
      cache.putIfAbsent(role.id, () => role);
    }

    return cache;
  }

  Future<Role> create ({ required String label, Color? color, bool? hoist, String? icon, String? unicode, bool? mentionable, List<Permission>? permissions }) async {
    if ((icon != null || unicode != null) && !guild.features.contains('ROLE_ICONS')) {
      throw MissingFeatureException(cause: "Guild ${guild.name} has no 'ROLE_ICONS' feature.");
    }

    String? _icon = icon != null ? await Helper.getPicture(icon) : null;
    int? _permissions = permissions != null ? Helper.reduceRolePermissions(permissions) : null;

    Http http = ioc.singleton(Service.http);
    Response response = await http.post("/guilds/$guildId/roles", {
      'name': label,
      'color': color != null ? Helper.toRgbColor(color) : null,
      'hoist': hoist ?? false,
      'mentionable': mentionable ?? false,
      'unicode_emoji': unicode,
      'icon': _icon,
      'permissions': _permissions
    });

    Role role = Role.from(
      roleManager: this,
      payload: jsonDecode(response.body),
    );

    cache.putIfAbsent(role.id, () => role);

    return role;
  }
}
