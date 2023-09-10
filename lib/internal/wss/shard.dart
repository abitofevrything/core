import 'package:mineral/internal/wss/discord_websocket.dart';

final class Shard {
  final DiscordWebsocket _websocket;
  final int id;
  final String _token;
  final String gatewayUrl;

  Shard(this._websocket, this.id, this._token, this.gatewayUrl);
}