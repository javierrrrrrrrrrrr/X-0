import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x_and_0/models/card_model.dart';

import '../Providers/control_provider.dart';
import 'custom_card.dart';

class BodyCard extends StatelessWidget {
  const BodyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controlProvider = Provider.of<ControlProvider>(context);
    return Expanded(
      child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: GestureDetector(
                onTap: () {
                  //comprobar si no  han tocado antes la carta
                  if (controlProvider.checkcardstatus(index) == false &&
                      controlProvider.resultado == "" &&
                      controlProvider.controlindex != 0) {
                    //comprobar el turno de que jugador es
                    if (controlProvider.isplayer1turn) {
                      controlProvider.addCradtolist(
                          CustommodelCard(valor: "1", index: index));
                      //cambiar el valor para saber como dibujar el contenedor
                      controlProvider.changecontainerforma(index, 1);
                      //
                      // comprobar si hay victoria
                      controlProvider.checkwin();
                      //recetear tiempo
                      controlProvider.resettimer();
                      controlProvider.chnageplayerturn();
                    } else {
                      controlProvider.addCradtolist(
                          CustommodelCard(valor: "2", index: index));
                      controlProvider.changecontainerforma(index, 2);
                      controlProvider.checkwin();
                      //recetear tiempo
                      controlProvider.resettimer();
                      controlProvider.chnageplayerturn();
                    }
                  }

                  print(controlProvider.selectedcard.length);
                },
                child: CustomCard(
                    cardvalue: controlProvider.cradvalue[index],
                    listindex: controlProvider.cuadrosdibujados,
                    index: index),
              ),
            );
          }),
    );
  }
}
