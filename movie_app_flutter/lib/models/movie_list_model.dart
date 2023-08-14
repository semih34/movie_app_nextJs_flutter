import 'movie_model.dart';

class MovieListModel {
  int page;
  List<MovieModel> results = [];

  MovieListModel({
    required this.page,
    required this.results,
  });

  factory MovieListModel.fromJson(Map<String, dynamic> json) => MovieListModel(
        page: json["page"],
        results: List<MovieModel>.from(
          (json["results"] ?? []).map((x) => MovieModel.fromJson(x)),
        ),
      );
}
