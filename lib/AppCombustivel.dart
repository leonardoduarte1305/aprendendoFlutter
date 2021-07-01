import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCombustivel extends StatefulWidget {
  const AppCombustivel({Key? key}) : super(key: key);

  @override
  _AppCombustivelState createState() => _AppCombustivelState();
}

class _AppCombustivelState extends State<AppCombustivel> {
  TextEditingController _controllerAlcool = new TextEditingController();
  TextEditingController _controllerGasolina = new TextEditingController();
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Álcool ou Gasolina",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        body: Container(
            child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset(
                  'images/logo.png',
                  //alignment: AlignmentDirectional.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              TextField(
                //TIPO TEXT, NUMBER, EMAILADDRESS, DATETIME
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Alcool, ex: 2.59",
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerAlcool,
                onSubmitted: (String s) {
                  //PARA RECUPERAR O QUE FOI DIGITADO
                  print('O valor digitado no campo foi: $s');
                },

                enabled: true,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.bottom,
                //maxLength: 10,
                obscureText: false, // PARA CAMPOS TIPO SENHA
              ),
              TextField(
                //TIPO TEXT, NUMBER, EMAILADDRESS, DATETIME
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex: 4.59",
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerGasolina,
                onSubmitted: (String s) {
                  //PARA RECUPERAR O QUE FOI DIGITADO
                  print('O valor digitado no campo foi: $s');
                },

                enabled: true,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.bottom,
                //maxLength: 10,
                obscureText: false, // PARA CAMPOS TIPO SENHA
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: ElevatedButton(
                  onPressed: _calcularResultado,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      onPrimary: Colors.white,
                      alignment: AlignmentDirectional.center),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _resultado,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )));
  }

  _calcularResultado() {
    double precoAlcool = double.parse(_controllerAlcool.text);
    double precoGasolina = double.parse(_controllerGasolina.text);

    if (precoAlcool == null ||
        precoGasolina == null ||
        precoAlcool <= 0 ||
        precoGasolina <= 0) {
      setState(() {
        _resultado =
            "Ops! Tem algum número inválido, digite numeros maiores que 0 e utilizando (.)";
      });
    }

    if ((precoAlcool / precoGasolina) >= 0.7) {
      setState(() {
        _resultado = "Melhor abastecer com gasolina.";
      });
    } else {
      setState(() {
        _resultado = "Melhor abastecer com alcool.";
      });
    }
    limparCampos();
  }

  void limparCampos() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }
}
