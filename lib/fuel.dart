// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textResult = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textResult = "Digite conforme os exemplos";
      });
    }

    double result = precoAlcool! / precoGasolina!;

    if (result < 0.7) {
      setState(() {
        _textResult = "É melhor abastecer com álcool";
      });
    } else {
      setState(() {
        _textResult = "É melhor abastecer com gasolina";
      });
    }

    _limpar();
  }

  void _limpar() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1d3599),
        title: const Text("Álcool ou Gasolina?"),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset(
                  "assets/logo.png",
                  width: 300,
                ),
              ),
              const Text(
                "Saiba qual a melhor opção par abastecimento do seu carro: ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                //text, number, emailAddress, datetime
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Preço do Álcool (Ex: 5.69): ",
                ),
                style: const TextStyle(fontSize: 25, color: Colors.black),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Preço da Gasolina (Ex: 7.19): ",
                ),
                style: const TextStyle(fontSize: 25, color: Colors.black),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextButton(
                    child: const Text(
                      "Calcular",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF1d3599),
                        padding: EdgeInsets.only(top: 15, bottom: 15)),
                    onPressed: _calcular),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textResult,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
