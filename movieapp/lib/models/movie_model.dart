class MovieModel {
  final String backdropPath;
  final int id;
  final String posterPath;

  MovieModel.fromJson(Map<String, dynamic> json)
      : backdropPath = json["backdrop_path"],
        id = json['id'],
        posterPath = json['poster_path'];
}
