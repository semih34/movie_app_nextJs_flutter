class MovieModel {
  int id;
  String originalTitle;
  bool? adult;
  String? backdroPpath;
  List<int>? genreIds;
  String? originalLanguage;
  String? overview;
  double? popularity;
  String? posterPath;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieModel({
    required this.id,
    required this.originalTitle,
    this.adult,
    this.backdroPpath,
    this.genreIds,
    this.originalLanguage,
    this.overview,
    this.popularity,
    this.posterPath,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        originalTitle: json['original_title'],
        adult: json["adult"],
        backdroPpath: json["backdrop_path"],
        genreIds: List<int>.from((json["genre_ids"] ?? []).map((x) => x)),
        originalLanguage: json["original_language"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "original_title": originalTitle,
        "adult": adult,
        "backdrop_path": backdroPpath,
        "genre_ids": genreIds,
        "original_language": originalLanguage,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
