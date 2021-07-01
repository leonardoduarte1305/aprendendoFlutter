import 'package:flutter/material.dart';

class ClasseSlider extends StatefulWidget {
  const ClasseSlider({Key? key}) : super(key: key);

  @override
  _ClasseSliderState createState() => _ClasseSliderState();
}

class _ClasseSliderState extends State<ClasseSlider> {
  double _escolhaSlider = 0;

  var _label = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "EntradaSwitch",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(60),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Slider(
                activeColor: Colors.green,
                inactiveColor: Colors.grey,
                value: _escolhaSlider,
                min: 0,
                max: 5,
                label: _label,
                divisions: 10,
                onChanged: (double novoValor) {
                  setState(() {
                    _escolhaSlider = novoValor;
                    _label = _escolhaSlider.toString();
                  });
                }),
            Padding(
              padding: EdgeInsets.all(0),
              child: ElevatedButton(
                onPressed: () {
                  print("O valor selecionado foi:" + _escolhaSlider.toString());
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
