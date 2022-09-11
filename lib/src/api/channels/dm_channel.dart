import 'package:mineral/api.dart';
import 'package:mineral/core.dart';
import 'package:mineral/src/api/managers/message_manager.dart';

class DmChannel extends PartialChannel {
  Snowflake? lastMessageId;
  MessageManager messages;
  Map<Snowflake, User> recipients;

  DmChannel(
    this.lastMessageId,
    this.messages,
    this.recipients,
    super.id
  );

  factory DmChannel.fromPayload(dynamic payload) {
    MineralClient client = ioc.singleton(ioc.services.client);

    Map<Snowflake, User> users = {};
    if (payload['recipients'] != null) {
      for (dynamic element in payload['recipients']) {
        User? user = client.users.cache.get(element['id']);
        user ??= User.from(element);

        users.putIfAbsent(user.id, () => user!);
      }
    }

    return DmChannel(
      payload['last_message_id'],
      MessageManager(),
      users,
      payload['id'],
    );
  }
}