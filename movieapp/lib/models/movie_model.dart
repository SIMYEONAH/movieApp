class MovieModel {
  final String backdropPath;

  MovieModel.fromJson(Map<String, dynamic> json)
      : backdropPath = json["backdrop_path"];
}
