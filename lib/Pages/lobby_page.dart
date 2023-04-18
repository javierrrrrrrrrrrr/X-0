import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/connection_provider.dart';

// STEP1:  Stream setup

//STEP2: Add this function in main function in main.dart file and add incoming data to the stream

//Step3: Build widgets with streambuilder

class Lobby extends StatelessWidget {
  const Lobby({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connectionProvider = Provider.of<ConnectionProvider>(context);
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: connectionProvider.streamSocket.getResponse,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return Center(
                child: Text(
              snapshot.data.toString(),
              style: const TextStyle(fontSize: 40),
            ));
          },
        ),
      ),
    );
  }
}
