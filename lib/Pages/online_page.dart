import 'package:flutter/material.dart';

import '../Widgets/custom_buttom.dart';

class OnlinePageSelected extends StatefulWidget {
  const OnlinePageSelected({Key? key}) : super(key: key);

  @override
  State<OnlinePageSelected> createState() => _OnlinePageSelectedState();
}

class _OnlinePageSelectedState extends State<OnlinePageSelected> {
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
              texto: "Crear Sala",
              onPressed: () {},
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
