import 'dart:math';

import 'package:flutter/material.dart';

class Jokenpo extends StatefulWidget {
  const Jokenpo({Key? key}) : super(key: key);

  @override
  State<Jokenpo> createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {

  List options = ["pedra", "papel", "tesoura"];
  String message = "Faça a sua escolha";
  var imgpadrao = const AssetImage("image/all.png");
  var imgjog = const AssetImage("image/all.png");

  void jogar(String escolhaJog) {
    int i = Random().nextInt(options.length);
    String escolhacomp = options[i];

    imgpadrao = AssetImage("image/$escolhacomp.png");
    imgjog = AssetImage("image/$escolhaJog.png");

    if (escolhaJog == "pedra" && escolhacomp == "tesoura" ||
      escolhaJog == "papel" && escolhacomp == "pedra" ||
      escolhaJog == "tesoura" && escolhacomp == "papel") {
      setState(() {
        message = "Você venceu!";
      });
    } else if (escolhaJog == "pedra" && escolhacomp == "papel" ||
        escolhaJog == "papel" && escolhacomp == "tesoura" ||
        escolhaJog == "tesoura" && escolhacomp == "pedra") {
      setState(() {
        message = "Você perdeu!";
    });
    } else {
      setState(() {
        message = "Empate!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Jokenpô'),
        )
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Image(image: imgpadrao, width: 150,),
          SizedBox(height: 20,),
          Text(message),
          SizedBox(height: 70,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => jogar("pedra"),
                child: Image.asset("image/pedra.png", width: 80,),
              ),
              GestureDetector(
                onTap: () => jogar("papel"),
                child: Image.asset("image/papel.png", width: 80,),
              ),
              GestureDetector(
                onTap: () => jogar("tesoura"),
                child: Image.asset("image/tesoura.png", width: 80,),
              ),
            ],
          ),
          Column(
            children: [
              Text('Sua escolha:'),
              Image(image: imgjog, width: 80,),
            ],
          )
        ],
      )
    );
  }
}

