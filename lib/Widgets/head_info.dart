import 'package:flutter/material.dart';

class InfoHead extends StatelessWidget {
  const InfoHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: const [
          CustomRowInfo(
            name: "Players ",
            marca: "Jug",
            score: "Score",
          ),
          CustomRowInfo(
            name: "Javier ",
            marca: "X",
            score: "5    ",
          ),
          CustomRowInfo(
            name: "IA ",
            marca: "       0",
            score: "5    ",
          ),
        ],
      ),
    );
  }
}

class CustomRowInfo extends StatelessWidget {
  const CustomRowInfo({
    super.key,
    required this.name,
    required this.score,
    required this.marca,
  });

  final String name;
  final String score;
  final String marca;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
          Text(
            score.toString(),
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
