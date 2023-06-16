import 'dart:io';

import 'package:mineral/core/api.dart';
import 'package:mineral/framework.dart';

class VoiceServerUpdateEvent extends Event {
  final String token;
  final Guild guild;
  final WebSocket voiceServer;

  VoiceServerUpdateEvent(this.token, this.guild, this.voiceServer);
}