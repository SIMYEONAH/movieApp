class ComingModel {
  final String backdroppath;
  final String title;

  ComingModel.fromJson(Map<String, dynamic> json)
      : backdroppath = json['backdrop_path'],
        title = json['title'];
}
