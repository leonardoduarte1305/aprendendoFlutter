import 'package:flutter/material.dart';
import 'package:gasolina_alcool_entrada_dados/model/Video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

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
  void initState() {
    print("1 - initState");
    /*
      O initState é o primeiro método a ser chamado quando a nossa Widget é
      carregada
     */
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("2 - didChangeDependencies");
    /*
       O didChangeDependencies é o segundo método chamado quando a nossa Widget
       é carregada
     */
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant Inicio oldWidget) {
    print("2 - didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("4 - dispose");
    /*
       O dispose é o método chamado quando aqueremos descartar este Widget.
       é usado para parar a execução de uma música, de um carregamento, ou de um
       download e etc
     */
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("3 - build");
    /*
       O build é o terceiro método chamado quando a nossa Widget é carregada
     */

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
                          FlutterYoutube.playYoutubeVideoById(
                              apiKey: CHAVE_YOUTUBE_API,
                              videoId: video.id,
                              autoPlay: true,
                              fullScreen: true);

                          //
                          /* ESTE MODO, FIZ UTILIZANDO A DOCUMENTAÇÂODO SITE
                          MAS NÂO CONSEGUI FAZER FUNCIONAR

                          YoutubePlayerController _controller =
                              YoutubePlayerController(
                            initialVideoId: video.id,
                            flags: YoutubePlayerFlags(
                              autoPlay: true,
                              mute: false,
                            ),
                          );
                          YoutubePlayer(
                            controller: _controller,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.amber,
                            progressColors: ProgressBarColors(
                                playedColor: Colors.amber,
                                handleColor: Colors.amber),
                            onReady: () {
                              _controller.addListener(() {});
                            },
                          );
                          _controller.play();
                          */
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
