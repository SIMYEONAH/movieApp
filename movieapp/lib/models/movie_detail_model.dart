class MovieDetailModel {
  final String title, popularity, posterPath, overview, id, genres;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['original_title'],
        popularity = json['popularity'],
        posterPath = json['poster_path'],
        overview = json['overview'],
        id = json['id'],
        genres = json['genres'];
}
