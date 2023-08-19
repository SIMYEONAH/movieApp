class MovieDetailModel {
  num id;
  double voteAverage;
  String title, overview;
  List<Map<String, dynamic>> genres;

  MovieDetailModel(
      {required this.id,
      required this.voteAverage,
      required this.title,
      required this.genres,
      required this.overview});

  MovieDetailModel.fromJson(Map<String, dynamic> jsonData)
      : genres = jsonData['genres'].cast<Map<String, dynamic>>(),
        id = jsonData['id'],
        overview = jsonData['overview'],
        title = jsonData['title'],
        voteAverage = jsonData['vote_average'].toDouble();
}
