import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {
  String valor = "";
  int valor2 = 0;

  TelaSecundaria.semParametros();

  TelaSecundaria.comValoresObrigatorios(this.valor, String? nome);

  TelaSecundaria.comValoresOpcionais(this.valor, this.valor2);

  //const TelaSecundaria({Key? key}) : super(key: key);

  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Secundaria"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              child: Text("Ir para primeira tela"),
            )
            //Text("Segunda tela, Valor capturado: ${widget.valor}")
          ],
        ),
      ),
    );
  }
}
