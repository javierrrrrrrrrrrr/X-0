import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.cardvalue,
    required this.listindex,
    required this.index,
  });

  final int cardvalue;
  final List<int> listindex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
            color: (listindex[0] == index ||
                    listindex[1] == index ||
                    listindex[2] == index)
                ? Colors.blue
                : Colors.amber[300],
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: cardvalue == 0
            ? Container()
            : cardvalue == 1
                ? const Center(
                    child: Text(
                      "X",
                      style: TextStyle(fontSize: 45, color: Colors.white),
                    ),
                  )
                : const Center(
                    child: Text(
                      "0",
                      style: TextStyle(fontSize: 45, color: Colors.black),
                    ),
                  ));
  }
}
