import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double sizedImg = 90;

  String resultado = "";
  String imgPadrao = "images/padrao.png";

  Color corPadrao = Colors.white;

  List<Color> colors = [Colors.red, Colors.green, Colors.orange];

  List<String> imgBackgournd = [
    "images/pedra.png",
    "images/papel.png",
    "images/tesoura.png",
  ];

  void result(int jogador) {
    int computador = Random().nextInt(2);

    switch (jogador) {
      // pedra
      case 0:
        switch (computador) {
          case 0:
            resultado = "Empate";
            break;
          case 1:
            resultado = "Derrota";
            break;
          case 2:
            resultado = "Vitoria";
            break;
        }
        break;

      // papel
      case 1:
        switch (computador) {
          case 0:
            resultado = "Vitoria";
            break;
          case 1:
            resultado = "Empate";
            break;
          case 2:
            resultado = "Derrota";
            break;
        }
        break;

      // tesoura
      case 2:
        switch (computador) {
          case 0:
            resultado = "Derrota";
            break;
          case 1:
            resultado = "Vitoria";
            break;
          case 2:
            resultado = "Empate";
            break;
        }
        break;
    }

    setState(() {
      resultado = resultado;
      corPadrao = resultado.toLowerCase() == "vitoria"
          ? colors[1]
          : resultado.toLowerCase() == "derrota"
              ? colors[0]
              : colors[2];
      imgPadrao = imgBackgournd[computador];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JoKenPo"),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          const Text(
            "Escolha do App: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(imgPadrao),
          ),
          const Text(
            "Escolha uma opção abaixo ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () => result(0),
                    child: Image.asset(
                      imgBackgournd[0],
                      width: sizedImg,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: (() => result(1)),
                    child: Image.asset(
                      imgBackgournd[1],
                      width: sizedImg,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: (() => result(2)),
                    child: Image.asset(
                      imgBackgournd[2],
                      width: sizedImg,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Container(
              width: double.infinity,
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: corPadrao, borderRadius: BorderRadius.circular(12)),
              child: Text(
                resultado.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
