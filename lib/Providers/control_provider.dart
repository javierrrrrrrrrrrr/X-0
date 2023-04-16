import 'package:flutter/material.dart';
import 'package:x_and_0/models/card_model.dart';

class ControlProvider extends ChangeNotifier {
  late int endTime = DateTime.now().millisecondsSinceEpoch + 30000;

  int controlindex = 0;
  //valor de la carta si tiene 1=x o 2=0 y cero por defecto no se ha jugado
  List<int> cradvalue = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  //un boleano para controlar el truno de que jugador es
  bool isplayer1turn = false;

  List<CustommodelCard> selectedcard = [];

  //add card to the list

  //resultado

  String resultado = "";

  ////poscionn de los cuadros que se van a dibujar con la liena
  List<int> cuadrosdibujados = [10, 10, 10];

  ///metodo para agregar cuadros dibujados a la lista
  ///
  addListLine(int a, int b, int c) {
    cuadrosdibujados.clear();
    cuadrosdibujados.add(a);
    cuadrosdibujados.add(b);
    cuadrosdibujados.add(c);
    notifyListeners();
  }

  addCradtolist(CustommodelCard c) {
    selectedcard.add(c);
    notifyListeners();
  }

  //cambiar el turno del jugador
  chnageplayerturn() {
    isplayer1turn = !isplayer1turn;
    notifyListeners();
  }
  //comprobar si ya tocaron la carta esa

  bool checkcardstatus(int index) {
    for (int i = 0; i < selectedcard.length; i++) {
      if (selectedcard[i].index == index) {
        return true;
      }
    }
    return false;
  }

  //reset game

  resetgame() {
    cradvalue = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    cuadrosdibujados = [10, 10, 10];
    resultado = '';
    selectedcard = [];
    endTime = DateTime.now().millisecondsSinceEpoch + 30000;
    notifyListeners();
  }

  //cambiar el valor para saber como dibujar el; contenedero cardvalue
  changecontainerforma(int index, int valor) {
    cradvalue[index] = valor;
    notifyListeners();
  }

  changebuttomindex(int x) {
    controlindex = x;
    notifyListeners();
  }

  resettimer() {
    endTime = DateTime.now().millisecondsSinceEpoch + 30000;
    notifyListeners();
  }

  //comprobar victoria
  String checkwin() {
    //horizontal
    if (cradvalue[0] == 1 && cradvalue[1] == 1 && cradvalue[2] == 1) {
      resultado = "Gana el jugador 1";
      addListLine(0, 1, 2);
      return resultado;
    }
    if (cradvalue[3] == 1 && cradvalue[4] == 1 && cradvalue[5] == 1) {
      addListLine(3, 4, 5);
      resultado = "Gana el jugador 1";
      return resultado;
    }
    if (cradvalue[6] == 1 && cradvalue[7] == 1 && cradvalue[8] == 1) {
      addListLine(6, 7, 8);
      resultado = "Gana el jugador 1";
      return resultado;
    }
    //vertical
    if (cradvalue[0] == 1 && cradvalue[3] == 1 && cradvalue[6] == 1) {
      addListLine(0, 3, 6);
      resultado = "Gana el jugador 1";
      return resultado;
    }
    if (cradvalue[1] == 1 && cradvalue[4] == 1 && cradvalue[7] == 1) {
      addListLine(1, 4, 7);
      resultado = "Gana el jugador 1";
      return resultado;
    }
    if (cradvalue[2] == 1 && cradvalue[5] == 1 && cradvalue[8] == 1) {
      addListLine(2, 5, 8);
      resultado = "Gana el jugador 1";
      return resultado;
    }
    //en diagonal
    if (cradvalue[0] == 1 && cradvalue[4] == 1 && cradvalue[8] == 1) {
      addListLine(0, 4, 8);
      resultado = "Gana el jugador 1";
      return resultado;
    }
    if (cradvalue[2] == 1 && cradvalue[4] == 1 && cradvalue[6] == 1) {
      addListLine(2, 4, 6);
      resultado = "Gana el jugador 1";
      return resultado;
    }
    //condiciones jugador 2
    ////
    ///////
    ///horizontal
    if (cradvalue[0] == 2 && cradvalue[1] == 2 && cradvalue[2] == 2) {
      addListLine(0, 1, 2);
      resultado = "Gana el jugador 2";
      return resultado;
    }
    if (cradvalue[3] == 2 && cradvalue[4] == 2 && cradvalue[5] == 2) {
      addListLine(3, 4, 5);
      resultado = "Gana el jugador 2";
      return resultado;
    }
    if (cradvalue[6] == 2 && cradvalue[7] == 2 && cradvalue[8] == 2) {
      addListLine(6, 7, 8);
      resultado = "Gana el jugador 2";
      return resultado;
    }
    ////vertical
    if (cradvalue[0] == 2 && cradvalue[3] == 2 && cradvalue[6] == 2) {
      addListLine(0, 3, 6);
      resultado = "Gana el jugador 2";
      return resultado;
    }
    if (cradvalue[1] == 2 && cradvalue[4] == 2 && cradvalue[7] == 2) {
      addListLine(1, 4, 7);
      resultado = "Gana el jugador 2";
      return resultado;
    }
    if (cradvalue[2] == 2 && cradvalue[5] == 2 && cradvalue[8] == 2) {
      addListLine(2, 5, 8);
      resultado = "Gana el jugador 2";
      return resultado;
    }
    //en diagonal
    if (cradvalue[0] == 2 && cradvalue[4] == 2 && cradvalue[8] == 2) {
      addListLine(0, 4, 8);
      resultado = "Gana el jugador 2";
      return resultado;
    }
    if (cradvalue[2] == 2 && cradvalue[4] == 2 && cradvalue[6] == 2) {
      addListLine(2, 4, 6);
      resultado = "Gana el jugador 2";
      return resultado;
    }

    notifyListeners();
    return "En discusión...";
  }
}
