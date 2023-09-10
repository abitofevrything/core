import 'package:mineral/internal/wss/discord_websocket.dart';
import 'package:mineral/internal/wss/shard.dart';

final class ShardBucket {
  final Map<int, dynamic> bucket = {};
  late int totalShards;

  void createShardIfNotExists (DiscordWebsocket websocket, String token, String gatewayUrl) {
    final id = bucket.length;
    final Shard shard = Shard(websocket, bucket.length, token, gatewayUrl);

    bucket.putIfAbsent(id, () => shard);
  }
}