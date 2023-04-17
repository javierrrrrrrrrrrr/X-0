import 'package:flutter/material.dart';
import 'package:x_and_0/Pages/home_page.dart';

import '../Widgets/custom_buttom.dart';
import 'online_page.dart';

class ModeSelectedPage extends StatelessWidget {
  const ModeSelectedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtom(
              texto: "Single Player",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            CustomButtom(
              texto: "Multiplayer offline",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            CustomButtom(
                texto: "Multiplayer online",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OnlinePageSelected()));
                }),
          ],
        ),
      ),
    );
  }
}
