// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/services/api_service.dart';
import 'package:movieapp/widgets/movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<MovieModel>> movies = ApiService.getPopularMovides();
  Future<List<MovieModel>> playing = ApiService.getNowPlayingMovides();
  Future<List<MovieModel>> coming = ApiService.getComingMovides();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: movies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Popular Movies",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(child: makeList(snapshot))
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Movie(
            backdropPath: movie.backdropPath,
            id: movie.id,
            posterPath: movie.posterPath);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 40),
    );
  }
}
