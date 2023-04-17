import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.texto,
    this.onPressed,
  });

  final String texto;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 80,
        width: 300,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Center(child: Text(texto)),
        ),
      ),
    );
  }
}
