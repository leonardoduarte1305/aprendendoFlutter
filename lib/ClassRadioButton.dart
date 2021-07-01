import 'package:flutter/material.dart';

class ClasseRadioButton extends StatefulWidget {
  const ClasseRadioButton({Key? key}) : super(key: key);

  @override
  _ClasseRadioButtonState createState() => _ClasseRadioButtonState();
}

class _ClasseRadioButtonState extends State<ClasseRadioButton> {
  bool? _checkComidaBrasileiraSelecionada = false;
  bool? _checkComidaMexicanaSelecionada = false;

  String? _escolhaUsuario = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "RadioButton",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /*Text("Masculino"),
            Radio(
                value: "m", //
                groupValue: _escolhaUsuario, //
                onChanged: (String? string) => {_escolhaUsuario = string} //
                ),*/
            //
            RadioListTile(
                title: Text("Masculino"),
                value: "m", //
                groupValue: _escolhaUsuario, //
                onChanged: (String? string) => {
                      setState(() {
                        _escolhaUsuario = string;
                      })
                    } //
                ),
            RadioListTile(
                title: Text("Feminino"),
                value: "f", //
                groupValue: _escolhaUsuario, //
                onChanged: (String? string) => {
                      setState(() {
                        _escolhaUsuario = string;
                      })
                    } //
                ),
            Padding(
              padding: EdgeInsets.all(0),
              child: ElevatedButton(
                onPressed: () {
                  print("Resultado: " + _escolhaUsuario.toString());
                },
                child: Text(
                  "Salvar",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    onPrimary: Colors.white,
                    alignment: AlignmentDirectional.center),
              ),
            )
          ],
        ),
      ),
    );
  }
}
