import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gasolina_alcool_entrada_dados/telasProjetoYoutube/Biblioteca.dart';
import 'package:gasolina_alcool_entrada_dados/telasProjetoYoutube/EmAlta.dart';
import 'package:gasolina_alcool_entrada_dados/telasProjetoYoutube/Inicio.dart';
import 'package:gasolina_alcool_entrada_dados/telasProjetoYoutube/Inscricoes.dart';


import 'model/MinhaPesquisaSearchDelegate.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        backgroundColor: Colors.white,
        title: Image.asset(
          'images/youtube.png',
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String? resposta = await showSearch(
                context: context,
                delegate: new MinhaPesquisaSearchDelegate(),
              );
              setState(() {
                _resultado = resposta!;
              });

              //print("Veio da tela de busca: " + resposta!);
            },
          )
          /*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              print("Videocam pressionado");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("Account circle pressionado");
            },
          )
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("Search pressionado");
            },
          )*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            print("indice " + indice.toString());
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        // pode ser shifting também
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange,
            label: "Início",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.red,
            label: "Em alta",
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.blue,
            label: "Inscrições",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.green,
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
