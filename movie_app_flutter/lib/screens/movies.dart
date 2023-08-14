import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constants/extensions/string_extensions.dart';
import 'package:provider/provider.dart';

import '../models/movie_model.dart';
import '../providers/movie_provider.dart';
import '../widgets/horizontal_movie_list.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return context.watch<MovieProvider>().isLoading
        ? ListView(
            shrinkWrap: true,
            children: [
              topMovieWidget(context.read<MovieProvider>().topMovie),
              HorizontalMovieList(
                title: "POPULAR FILMS",
                movies: context.read<MovieProvider>().popularMovies,
              ),
              HorizontalMovieList(
                title: "YOUR FAVORITES",
                movies: context.read<MovieProvider>().topRateMovies,
              ),
            ],
          )
        : const Center(
            //The indicator will change to skeleton
            child: CircularProgressIndicator(),
          );
  }

  Widget topMovieWidget(MovieModel? model) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: CachedNetworkImageProvider(
              model!.posterPath!.toImageUrl(),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 5,
            left: 5,
            child: Column(
              children: [
                Container(
                  color: Colors.black45,
                  child: Text(
                    model.genreIds!
                        .map((e) {
                          return context
                              .read<MovieProvider>()
                              .genres!
                              .firstWhere((g) => g.id == e)
                              .name;
                        })
                        .toList()
                        .join(" • "),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => print(""),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_arrow,
                            ),
                            Text(
                              "Play",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => print(""),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.plus_one),
                            Text(
                              "Listem",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
