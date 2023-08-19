class MovieModel {
  final String backdropPath;
  final int id;

  MovieModel.fromJson(Map<String, dynamic> json)
      : backdropPath = json["backdrop_path"],
        id = json['id'];
}
