import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
//import 'package:web_socket_channel/io.dart';

class ConnectionProvider extends ChangeNotifier {
  final String adress = 'http://198.46.166.155:3000';
  IO.Socket socket = IO.io('http://localhost:3000');

  List events = [
    'joinRoom',
    'playerJoined',
    'gameStarted',
  ];

  connectSockt() async {
    IO.Socket socket = IO.io(
        'http://198.46.166.155:3000',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());
    socket.connect();
  }

  joinroomEvent() {
    IO.Socket socket = IO.io(
        'http://198.46.166.155:3000',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());
    socket.emit('joinRoom', {"playerName": "Javier", "roomId": 96020303181});
  }
}
