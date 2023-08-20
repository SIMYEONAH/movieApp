import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_detail_model.dart';
import 'package:movieapp/services/api_service.dart';

class DetaileScreen extends StatefulWidget {
  final String backdropPath;
  final int id;
  final String posterPath;

  const DetaileScreen({
    super.key,
    required this.backdropPath,
    required this.id,
    required this.posterPath,
  });

  @override
  State<DetaileScreen> createState() => _DetaileScreenState();
}

class _DetaileScreenState extends State<DetaileScreen> {
  late Future<MovieDetailModel> movieDetail;

  @override
  void initState() {
    super.initState();
    movieDetail = ApiService.getDetailById(widget.id);
    // print("https://image.tmdb.org/t/p/w500${widget.backdropPath}");
  }

  String _extractGenres(List<Map<String, dynamic>> genres) {
    return genres.map((genre) => genre['name']).join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://image.tmdb.org/t/p/w500${widget.posterPath}"),
          opacity: 0.4,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          title: const Text(
            "Back to list",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 25,
            ),
            FutureBuilder(
              future: movieDetail,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.title,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        snapshot.data!.overview,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${_extractGenres(snapshot.data!.genres)} / ${snapshot.data!.voteAverage}',
                        style: const TextStyle(fontSize: 22),
                      ),
                    ],
                  );
                } else {
                  return const Text("no data");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
