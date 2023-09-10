import 'package:mineral/internal/either.dart';
import 'package:mineral/internal/services/http/discord_http_client.dart';
import 'package:mineral/internal/services/intents/intents.dart';
import 'package:mineral/internal/wss/http_responses/gateway.dart';
import 'package:mineral/internal/wss/shard_bucket.dart';
import 'package:mineral/services/http/http_response.dart';

final class DiscordWebsocket {
  final ShardBucket _shards = ShardBucket();

  final DiscordHttpClient _http;
  final Intents intents;
  final String _token;
  late final int _maxConcurrency;
  late final Duration _identifyTimeout;

  late final String _gatewayUrl;

  DiscordWebsocket(this._http, this._token,{
    required this.intents,
  });

  /// Start the Discord websocket service
  Future<void> start ({ int? shardCount }) async {
    final Gateway gateway = await getGateway();

    _gatewayUrl = gateway.url;
    _maxConcurrency= gateway.maxConcurrency;
    _identifyTimeout = Duration(milliseconds: (5000 ~/ _maxConcurrency));
    _shards.totalShards = shardCount ?? gateway.shards;

    for (final shard in _shards.bucket.values) {
      _shards.createShardIfNotExists(this, _token, _gatewayUrl);
    }
  }

  /// Get the gateway payload
  Future<Gateway> getGateway() async {
    final response = await Either.future<Map<String, dynamic>, HttpResponse>(
      future: _http.get('/gateway/bot').build(),
      onSuccess: (response) => response.value.payload,
      onError: (failure) => print(failure.error)
    );

    return response is Success
      ? Gateway.fromRequest(response.value)
      : throw Exception('Failed to get gateway payload');
  }
}