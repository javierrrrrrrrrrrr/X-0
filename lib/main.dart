import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/game_mode_selected.dart';
import 'Providers/control_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ControlProvider(),
      lazy: true,
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: ModeSelectedPage());
  }
}
