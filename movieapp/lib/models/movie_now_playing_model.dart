class PlayingModel {
  final String backdroppath;
  final String title;

  PlayingModel.fromJson(Map<String, dynamic> json)
      : backdroppath = json['backdrop_path'],
        title = json['title'];
}
