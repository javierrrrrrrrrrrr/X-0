import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

//import 'package:web_socket_channel/io.dart';

class ConnectionProvider extends ChangeNotifier {
  final String adress = 'http://198.46.166.155:3000';
  IO.Socket socket = IO.io('http://localhost:3000');

  //
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  @override
  void dispose() {
    _socketResponse.close();
  }

  StreamSocket streamSocket = StreamSocket();

//
  List events = [
    'joinRoom',
    'playerJoined',
    'gameStarted',
  ];

  connectSocktAndListen() async {
    IO.Socket socket = IO.io(
        'http://198.46.166.155:3000',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());
    socket.connect();
    socket.on('playerJoined', (data) {
      print('Evento playerJoined recibido: $data');
      streamSocket.addResponse(data.toString());
    });

    socket.on('joinRoom', (data) {
      print('Evento joinRoom recibido: $data');
      streamSocket.addResponse(data.toString());
    });

    socket.on('gameStarted', (data) {
      print('Evento gameStarted recibido: $data');
      streamSocket.addResponse(data.toString());
    });
  }

  joinroomEvent() {
    IO.Socket socket = IO.io(
        'http://198.46.166.155:3000',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());

    socket.emit('joinRoom', {"playerName": "Javiers", "roomId": 964877});
  }
}

class StreamSocket {
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}
