import 'package:flutter/material.dart';

class ClasseEntradaSwitch extends StatefulWidget {
  const ClasseEntradaSwitch({Key? key}) : super(key: key);

  @override
  _ClasseEntradaSwitchState createState() => _ClasseEntradaSwitchState();
}

class _ClasseEntradaSwitchState extends State<ClasseEntradaSwitch> {
  bool _decisao = false;
  bool _decisao2 = false;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
                title: Text("Receber notificações do YouTube"),
                value: _decisao,
                onChanged: (bool decisaoTomada) {
                  setState(() {
                    _decisao = decisaoTomada;
                  });
                }),
            Padding(
              padding: EdgeInsets.all(0),
              child: ElevatedButton(
                onPressed: () {
                  if (_decisao) {
                    print("Salvar esta configuração");
                  } else {
                    print("Não salvar esta configuração");
                  }
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

            /*Text("Receber notificações?"),
            Switch(
                value: _decisao,
                onChanged: (bool decisaoTomada) {
                  setState(() {
                    _decisao = decisaoTomada;
                  });
                }),*/
          ],
        ),
      ),
    );
  }
}
