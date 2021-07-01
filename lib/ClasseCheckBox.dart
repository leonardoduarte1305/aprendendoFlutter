import 'package:flutter/material.dart';

class ClasseCheckBox extends StatefulWidget {
  const ClasseCheckBox({Key? key}) : super(key: key);

  @override
  _ClasseCheckBoxState createState() => _ClasseCheckBoxState();
}

class _ClasseCheckBoxState extends State<ClasseCheckBox> {
  bool? _checkComidaBrasileiraSelecionada = false;
  bool? _checkComidaMexicanaSelecionada = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "CheckBox",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /*Text("Comida brasileira"),
            Checkbox(
              value: _checkComidaBrasileira,
              // true = marcado - false = desmarcado
              onChanged: (bool? valor) {
                setState(() {
                  _checkComidaBrasileira = valor;
                });
              },
            ),*/
            CheckboxListTile(
              title: Text("Comida brasileira"),
              subtitle: Text("A melhor comida do globo terrestre"),
              activeColor: Colors.red,
              //secondary: Icon(Icons.add_box),
              value: _checkComidaBrasileiraSelecionada,
              onChanged: (bool? valor) {
                setState(() {
                  _checkComidaBrasileiraSelecionada = valor;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Comida mexicana"),
              subtitle: Text("A segunda melhor comida do globo terrestre"),
              activeColor: Colors.red,
              //secondary: Icon(Icons.add_box),
              value: _checkComidaMexicanaSelecionada,
              onChanged: (bool? valor) {
                setState(() {
                  _checkComidaMexicanaSelecionada = valor;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                print("Comida brasileira: " +
                    _checkComidaBrasileiraSelecionada.toString() +
                    "     Comida mexicana: " +
                    _checkComidaMexicanaSelecionada.toString());
              },
              child: Text(
                "Clicar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  onPrimary: Colors.white,
                  alignment: AlignmentDirectional.center),
            ),
          ],
        ),
      ),
    );
  }
}
