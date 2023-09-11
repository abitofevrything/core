import 'package:mineral/api/private/user.dart';
import 'package:mineral/api/shared/resources/message_type.dart';
import 'package:mineral/api/shared/resources/timestamp.dart';

abstract class Message {
  final String id;
  String? content;
  final User user;
  final Timestamp timestamp;
  final Timestamp? editedTimestamp;
  bool tts;
  bool mentionEveryone;
  List<User> mentions;
  bool pinned;
  MessageType type;
  List<Null> reactions; // todo implement reactions
  List<Null> attachments; // todo implement attachments
  List<Null> embeds;

  // todo implement embeds, components, flags: https://discord.com/developers/docs/resources/channel#message-object

  Message({
    required this.id,
    required this.content,
    required this.user,
    required this.timestamp,
    required this.editedTimestamp,
    required this.tts,
    required this.mentionEveryone,
    required this.mentions,
    required this.pinned,
    required this.type,
    required this.reactions,
    required this.attachments,
    required this.embeds
  });
}