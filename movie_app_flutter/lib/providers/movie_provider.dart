import 'package:flutter/material.dart';
import '../models/genre_list_model.dart';
import '../models/genre_model.dart';
import '../models/movie_list_model.dart';
import '../models/movie_model.dart';
import '../services/movie_service.dart';

class MovieProvider extends ChangeNotifier {
  late MovieService _movieService;

  MovieListModel? _topRateMovies;
  MovieListModel? _popularMovies;
  GenreListModel? _genreListModel;

  MovieProvider() {
    _movieService = MovieService();
    multiRequest();
  }

  bool get isLoading =>
      _topRateMovies != null &&
      _popularMovies != null &&
      _genreListModel != null;

  MovieModel? get topMovie => _topRateMovies!.results[0];

  List<GenreModel>? get genres => _genreListModel?.genres;

  List<MovieModel> get topRateMovies =>
      _topRateMovies == null ? [] : _topRateMovies!.results;

  List<MovieModel> get popularMovies =>
      _popularMovies == null ? [] : _popularMovies!.results;

  Future<void> multiRequest() async {
    List<MovieListModel> result = await Future.wait<MovieListModel>(
      [
        _movieService.getPopularMovies(),
        _movieService.getTopRatedMovies(),
      ],
    );
    _popularMovies = result[0];
    _topRateMovies = result[1];
    _genreListModel = await _movieService.getGenres();
    notifyListeners();
  }
}
