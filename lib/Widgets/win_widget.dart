import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/control_provider.dart';

class WinWidget extends StatelessWidget {
  const WinWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controlProvider = Provider.of<ControlProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          controlProvider.resultado,
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
      ],
    );
  }
}
