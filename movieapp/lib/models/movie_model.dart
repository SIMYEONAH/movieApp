class MovieModel {
  final String title, overview, voteAverage, id, posterPath;

  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        overview = json['overview'],
        voteAverage = json['voteAverage'],
        id = json['id'],
        posterPath = json['posterPath'];
}
