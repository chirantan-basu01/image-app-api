class ImagesModel {
  dynamic id;
  dynamic author;
  dynamic url;
  dynamic downloadUrl;

  ImagesModel(
      {required this.id,
      required this.author,
      required this.url,
      required this.downloadUrl});

  factory ImagesModel.fromJson(Map<dynamic, dynamic> json) {
    return ImagesModel(
      id: json['id'],
      author: json['author'],
      url: json['url'],
      downloadUrl: json['download_url'],
    );
  }
}
