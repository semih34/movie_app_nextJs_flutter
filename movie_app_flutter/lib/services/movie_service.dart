import 'package:dio/dio.dart';

import '../constants/network/network_manager.dart';
import '../models/genre_list_model.dart';
import '../models/movie_list_model.dart';

class MovieService {
  late NetworkManager _networkManager;
  MovieService() {
    _networkManager = NetworkManager.instance;
  }

  Future<MovieListModel> getTopRatedMovies() async {
    Response r = await _networkManager.network.get("movie/top_rated");
    MovieListModel list = MovieListModel.fromJson(r.data);
    return list;
  }

  Future<MovieListModel> getPopularMovies() async {
    Response response = await _networkManager.network.get("movie/popular");
    MovieListModel list = MovieListModel.fromJson(response.data);
    return list;
  }

  Future<GenreListModel> getGenres() async {
    Response response = await _networkManager.network.get('genre/movie/list');
    GenreListModel list = GenreListModel.fromJson(response.data);
    return list;
  }
}
