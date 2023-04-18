import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/connection_provider.dart';
import '../Widgets/custom_buttom.dart';
import 'lobby_page.dart';

class OnlinePageSelected extends StatefulWidget {
  const OnlinePageSelected({Key? key}) : super(key: key);

  @override
  State<OnlinePageSelected> createState() => _OnlinePageSelectedState();
}

class _OnlinePageSelectedState extends State<OnlinePageSelected> {
  @override
  Widget build(BuildContext context) {
    final connectionProvider = Provider.of<ConnectionProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtom(
              texto: "Crear Sala",
              onPressed: () {
                connectionProvider.joinroomEvent();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Lobby(
                              key: Key("1"),
                            )));
              },
            ),
            CustomButtom(
              texto: "Unirce a una sala",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
