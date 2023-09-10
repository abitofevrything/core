final class Gateway {
  final String url;
  final int maxConcurrency;
  final int remaining;
  final int resetAfter;
  final int total;
  final int shards;

  Gateway._({
    required this.url,
    required this.maxConcurrency,
    required this.remaining,
    required this.resetAfter,
    required this.total,
    required this.shards
  });

  factory Gateway.fromRequest(Map<String, dynamic> payload) =>
    Gateway._(
      url: payload['url'],
      maxConcurrency: payload['session_start_limit']['max_concurrency'],
      remaining: payload['session_start_limit']['remaining'],
      resetAfter: payload['session_start_limit']['reset_after'],
      total: payload['session_start_limit']['total'],
      shards: payload['shards']
    );
}