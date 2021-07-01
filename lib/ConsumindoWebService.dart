import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsumindoWebService extends StatefulWidget {
  const ConsumindoWebService({Key? key}) : super(key: key);

  @override
  _ConsumindoWebServiceState createState() => _ConsumindoWebServiceState();
}

class _ConsumindoWebServiceState extends State<ConsumindoWebService> {
  TextEditingController _cepDigitadoController = new TextEditingController();
  String _resultado = "Resultado";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Consumo de serviço web"),
        ),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Insira seu CEP, ex: 88000999",
                  ),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  controller: _cepDigitadoController,
                  maxLength: 8,
                  enabled: true,
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.bottom,
                ),
                Text(_resultado),
                ElevatedButton(onPressed: _enviar, child: Text("Enviar"))
              ],
            ),
          ),
        ));
  }

  _enviar() async {
    String endereco =
        "https://viacep.com.br/ws/${_cepDigitadoController.text}/json";
    Uri url = Uri.parse(endereco);
    http.Response response = await http.get(url);

    Map<String, dynamic> dadosEndereco = json.decode(response.body);

    setState(() {
      _resultado = dadosEndereco.toString();
    });

    String logradouro = dadosEndereco["logradouro"];
    String localidade = dadosEndereco["localidade"];
    String uf = dadosEndereco["uf"];

    print("Resposta: " + response.statusCode.toString());
    print("Logradouro: " + logradouro);
    print("localidade: " + localidade);
    print("uf: " + uf);
  }

  void _buscarValorBitCoin() async {
    String endereco = "https://blockchain.info/ticker";
    Uri url = Uri.parse(endereco);
    http.Response response = await http.get(url);

    Map<String, dynamic> dadosResgatados = json.decode(response.body);
    String real = dadosResgatados['BRL']["buy"].toString();

    setState(() {
      var _preco = real;
    });
  }
}
