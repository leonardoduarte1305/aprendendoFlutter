import 'package:flutter/material.dart';

class ListasEAlertas extends StatefulWidget {
  const ListasEAlertas({Key? key}) : super(key: key);

  @override
  _ListasEAlertasState createState() => _ListasEAlertasState();
}

class _ListasEAlertasState extends State<ListasEAlertas> {
  List _itens = [];

  void _carregarItens() {
    _itens = [];
    for (int i = 0; i <= 30; i++) {
      Map<String, String> item = Map();

      item["titulo"] = "O título ${i} é o titulo desta posição da list";
      item["descricao"] =
          "A descricao ${i} é a descrição desta posição da list";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Container(
        padding: EdgeInsetsDirectional.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice) {
              return ListTile(
                title: Text(_itens[indice]["titulo"].toString()),
                subtitle: Text(_itens[indice]["descricao"].toString()),
                onTap: () {
                  //print("OnTap: ${indice}");
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Título do alerta do item ${indice}"),
                          titlePadding: EdgeInsetsDirectional.all(20),
                          titleTextStyle:
                              TextStyle(color: Colors.green, fontSize: 20),
                          content: Text(
                              "Content deste item para mais detalhes veja o código"),
                          actions: [
                            TextButton(
                              onPressed: () => {
                                print("Selecionado sim"),
                                Navigator.pop(context)
                              },
                              child: Text("Sim"),
                            ),
                            TextButton(
                              onPressed: () => {
                                print("Selecionado não"),
                                Navigator.pop(context)
                              },
                              child: Text("Não"),
                            )
                          ],
                        );
                      });
                },
                onLongPress: () {
                  print("OnLongPress ${indice}");
                },
              );
            }),
      ),
    );
  }
}
