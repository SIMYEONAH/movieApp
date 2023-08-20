import 'package:flutter/material.dart';
import 'package:movieapp/screens/detail.screen.dart';

class Movie extends StatelessWidget {
  final String backdropPath;
  final int id;
  final String posterPath;

  const Movie({
    super.key,
    required this.backdropPath,
    required this.id,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetaileScreen(
              backdropPath: backdropPath,
              id: id,
              posterPath: posterPath,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: backdropPath,
            child: Container(
              width: 150,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.3),
                  )
                ],
              ),
              child:
                  Image.network("https://image.tmdb.org/t/p/w500$posterPath"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
