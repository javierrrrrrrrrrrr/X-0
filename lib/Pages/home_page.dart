import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x_and_0/Widgets/time_and_star.dart';

import '../Providers/control_provider.dart';
import '../Widgets/body_card.dart';
import '../Widgets/head_info.dart';
import '../Widgets/win_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controlProvider = Provider.of<ControlProvider>(context);
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const InfoHead(),
            const SizedBox(height: 10),
            const BodyCard(),
            const WinWidget(),
            const SizedBox(height: 20),
            TimeAndSTar(controlindex: controlProvider.controlindex),
          ],
        ),
      ),
    );
  }
}
