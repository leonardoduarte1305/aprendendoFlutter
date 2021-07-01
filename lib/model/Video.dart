class Video {
  String id = "";
  String titulo = "";
  String urlImagem = "";
  String canal = "";
  String descricao = "";

  Video(this.id, this.titulo, this.urlImagem, this.canal, this.descricao);

  /*
  static converterJson(Map<String, dynamic> json) {
    return Video(
        json["id"]["videoId"],
        json["snippet"]["title"],
        json["snippet"]["thumbnails"]["high"]["url"],
        json["snippet"]["channelId"]
    );
  }
 */
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        json["id"]["videoId"],
        json["snippet"]["title"],
        json["snippet"]["thumbnails"]["high"]["url"],
        json["snippet"]["channelTitle"],
        json["snippet"]["description"]);
  }
}
