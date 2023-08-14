import 'genre_model.dart';

class GenreListModel {
  List<GenreModel>? genres;

  GenreListModel({
    this.genres,
  });

  factory GenreListModel.fromJson(Map<String, dynamic> json) => GenreListModel(
        genres: List<GenreModel>.from(
          (json["genres"] ?? []).map(
            (x) => GenreModel.fromJson(x),
          ),
        ),
      );
}
