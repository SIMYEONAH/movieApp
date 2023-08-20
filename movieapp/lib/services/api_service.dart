import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/models/movie_model.dart';

import '../models/movie_detail_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev/";
  static const String popular = "popular";
  static const String detail = 'movie?id=';

  static Future<List<MovieModel>> getPopularMovides() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl$popular');
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

  static Future<MovieDetailModel> getDetailById(int id) async {
    var url = Uri.parse('$baseUrl$detail$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowPlayingMovides() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl$popular');
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

  static Future<List<MovieModel>> getComingMovides() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl$popular');
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
}
