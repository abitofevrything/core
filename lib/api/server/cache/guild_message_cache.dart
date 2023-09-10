import 'package:mineral/api/server/guild_message.dart';
import 'package:mineral/api/shared/cache.dart';

abstract interface class GuildMessageCache {
  Future<List<GuildMessage>> fetch ();
}

final class GuildMessageCacheEntity extends Cache<GuildMessage> implements GuildMessageCache {
  final Map<String, GuildMessage> _cache = {};

  @override
  Future<List<GuildMessage>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }
}