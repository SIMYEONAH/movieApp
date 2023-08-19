import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/models/movie_detail_model.dart';
import 'package:movieapp/models/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";
  static const String moviee = "movie";
  static const String idd = "id";

  static Future<List<MovieModel>> getPopularMovides() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body);
      for (var movie in movies["results"]) {
        final instance = MovieModel.fromJson(movie);
        movieInstances.add(instance);
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMovieById(String id) async {
    final url = Uri.parse("$baseUrl/$moviee?$idd=$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
