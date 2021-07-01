import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinhaPesquisaSearchDelegate extends SearchDelegate<String> {
  @override //Define as ações por ex: daquele X do canto direito do campo busca, adiciona novos icones ali e etc.
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
      /*IconButton(
        icon: Icon(Icons.done),
        onPressed: () {},
      )*/
    ];
  }

  @override //Define a ou as ações da flochinha de voltar que fica no canto esquerdo do campo busca
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override // Constrói os resultados daquilo que foi pesquisado pelo usuário
  Widget buildResults(BuildContext context) {
    //print("Resultado da pesquisa: Pesquisada"); // linha para conferência e aprendizado
    close(context, query);
    return Container();
  }

  @override // Define sugestões de termos de pesquisa para o usuario
  //Este método é chamado cada vez q o usuario insere ou exclui uma letra no campo de busca
  Widget buildSuggestions(BuildContext context) {
    //print("Resultado da pesquisa: " + query); // linha para conferência e aprendizado

    List<String> lista = [];

    if (query.isNotEmpty) {
      lista = ["Android", "Android navegação", "IOS", "Jogos"]
          .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
          .toList();

      return ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(lista[index]),
            onTap: () {
              close(context, lista[index]);
            },
          );
        },
        itemCount: lista.length,
      );
    } else {
      return Center(
        child: Text("Sem resultados para esta pesquisa."),
      );
    }
  }
}
