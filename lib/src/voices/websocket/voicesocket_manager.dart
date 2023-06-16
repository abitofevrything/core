import 'dart:io';

class VoiceSocket {
  final String _endpoint;
  final String _token;
  late WebSocket _socket;

  VoiceSocket(this._endpoint, this._token);

  Future<void> connect() async {
    WebSocket socket = await WebSocket.connect(_endpoint);
    _socket = socket;

    _socket.listen((event) {
      print(event);
    });
  }
}