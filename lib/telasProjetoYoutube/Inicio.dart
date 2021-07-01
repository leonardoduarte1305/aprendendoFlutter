import 'package:flutter/material.dart';
import 'package:gasolina_alcool_entrada_dados/model/Video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'Api.dart';

class Inicio extends StatefulWidget {
  String pesquisa = "";
  Map<int, VoidCallback> _listeners = {};

  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String pesquisa) {
    Api api = new Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Video>>(
        future: _listarVideos(widget.pesquisa),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      List<Video>? videos = snapshot.data;
                      Video video = videos![index];

                      return GestureDetector(
                        onTap: () {
                          YoutubePlayerController _controller =
                              YoutubePlayerController(
                            initialVideoId: video.id,
                            flags: YoutubePlayerFlags(
                              autoPlay: true,
                              mute: false,
                            ),
                          );

                          YoutubePlayerBuilder(
                            player: YoutubePlayer(
                              controller: _controller,
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.red,
                              progressColors: ProgressBarColors(
                                playedColor: Colors.red,
                                handleColor: Colors.yellow,
                              ),
                              onReady: () {
                                _controller.addListener(() {
                                  widget._listeners;
                                });
                              },
                            ),
                            builder: (context, player) {
                              return Column(
                                children: [
                                  player,
                                ],
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(video.urlImagem),
                                ))),
                            ListTile(
                              title: Text(video.titulo),
                              subtitle: Text(video.canal),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                    itemCount: snapshot.data!.length);
              } else {
                return Center(
                  child: Text("Nenhum dado para ser exibido."),
                );
              }
          }
        },
      ),
    );
  }
}
