import 'package:flutter/material.dart';
import '../constants/extensions/string_extensions.dart';
import '../models/movie_model.dart';
import 'movie_box.dart';

class HorizontalMovieList extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;
  const HorizontalMovieList(
      {super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                MovieModel movie = movies[index];
                return MovieBox(
                  url: movie.posterPath!.toImageUrl(),
                );
              },
              itemCount: movies.length,
            ),
          ),
        ],
      ),
    );
  }
}
