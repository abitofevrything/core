import 'package:mineral/api/private/user.dart';
import 'package:mineral/api/shared/message.dart';

final class PrivateMessage extends Message {
  List<User> mentions;

  PrivateMessage({
      required super.id,
      required super.content,
      required super.user,
      required super.timestamp,
      required super.editedTimestamp,
      required super.tts,
      required super.mentionEveryone,
      required super.pinned,
      required super.type,
      required super.reactions,
      required super.attachments,
      required super.embeds,
      required this.mentions,
  });
}
