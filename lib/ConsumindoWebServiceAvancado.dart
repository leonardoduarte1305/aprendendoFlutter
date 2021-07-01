import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsumindoWebServiceAvancado extends StatefulWidget {
  const ConsumindoWebServiceAvancado({Key? key}) : super(key: key);

  @override
  _ConsumindoWebServiceAvancadoState createState() =>
      _ConsumindoWebServiceAvancadoState();
}

class _ConsumindoWebServiceAvancadoState
    extends State<ConsumindoWebServiceAvancado> {
  /*Future<Map> _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);

    return json.decode(response.body);
  }*/

  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _getListaPostagens() async {
    List<Post> postagens = [];
    Uri uri = Uri.parse(_urlBase + "/posts");
    http.Response response = await http.get(uri);
    var dadosJson = json.decode(response.body);

    for (var post in dadosJson) {
      Post p =
          new Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }

    return postagens;
  }

  _post() async {
    var corpoDaRequisicao = json.encode({
      "userId": 120,
      "id": null,
      "title": "Título do post",
      "body": "Um corpo qualquer"
    });

    Uri uri = Uri.parse(_urlBase + "/posts");
    http.Response response = await http.post(
      uri,
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpoDaRequisicao,
    );

    print("Statuscode: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  _put() async {
    var corpoDaRequisicao = json.encode({
      "userId": 17,
      "id": null,
      "title": "Título do put",
      "body":
          "Com o put posso enviar todos os campos e eles serão sobrescritos lá no DB"
    });

    Uri uri = Uri.parse(_urlBase + "/posts/2");
    http.Response response = await http.put(
      uri,
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpoDaRequisicao,
    );

    print("Statuscode: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  _patch() async {
    var corpoDaRequisicao = json.encode({
      "userId": 17,
      "body":
          "No patch envio apenas os campos que quero atualizar, e a resposta vem com os dados que já estavam no banco"
    });

    Uri uri = Uri.parse(_urlBase + "/posts/3");
    http.Response response = await http.patch(
      uri,
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpoDaRequisicao,
    );

    print("Statuscode: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  _delete() async {
    Uri uri = Uri.parse(_urlBase + "/posts/5");
    http.Response response = await http.delete(
      uri,
    );

    if (response.statusCode == 200) {
      print("Excluído com sucesso");
    } else {
      print("Excluído com sucesso");
    }

    print("Statuscode: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo avançado de serviço"),
      ),
      body: Container(
        padding: EdgeInsetsDirectional.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text("Post"),
                  onPressed: _post,
                ),
                ElevatedButton(
                  child: Text("Put"),
                  onPressed: _put,
                ),
                ElevatedButton(
                  child: Text("Pach"),
                  onPressed: _patch,
                ),
                ElevatedButton(
                  child: Text("Delete"),
                  onPressed: _delete,
                )
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: _getListaPostagens(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        print("Erro ao carregar a lista de postagens.");
                        throw ''; // O componente builder deve retornar alguma coisa,
                        //// para parar de reclamar joguei esse throw aqui
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              List<Post>? lista = snapshot.data;
                              Post post = lista![index];
                              return ListTile(
                                title: Text(post.title),
                                subtitle: Text(post._id.toString()),
                              );
                            });
                      }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Post {
  late int _userId;
  late int _id;
  late String _title;
  late String _body;

  Post(this._userId, this._id, this._title, this._body);

  String get body => _body;

  set body(String value) {
    _body = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }
}
