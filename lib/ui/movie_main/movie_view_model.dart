import 'package:flutter/material.dart';
import 'package:movie_app/data/data_source/movie_api_impl.dart';
import 'package:movie_app/data/repository/movie_repository_impl.dart';

import '../../domain/model/movie.dart';

class MovieViewModel extends ChangeNotifier {
  final _movieRepository = MovieRepositoryImpl(MovieApiImpl());
  List<Movie> movieList = [];
  List<Movie> movieSearchList = [];
  List<Movie> sortedMovieListByTitle = [];
  List<Movie> sortedMovieListByVoteAverage = [];
  List<Movie> sortedMovieByReleaseDate = [];

  MovieViewModel() {
    getList();
    getSortedListByTitle();
    getSortedListByVoteAverage();
    getSortedListByReleaseDate();
    notifyListeners();
  }

  Future getList() async {
    movieList = await _movieRepository.getResult();
    notifyListeners();
  }

  Future getSearchList(String query) async {
    movieSearchList = await _movieRepository.getSearchResult(query);
    notifyListeners();
  }

  Future getSortedListByTitle() async {
    sortedMovieListByTitle = await _movieRepository.getSortedResultByTitle();
    notifyListeners();
  }

  Future getSortedListByVoteAverage() async {
    sortedMovieListByVoteAverage =
        await _movieRepository.getSortedResultByVoteAverage();
    notifyListeners();
  }

  Future getSortedListByReleaseDate() async {
    sortedMovieByReleaseDate =
        await _movieRepository.getSortedResultByReleaseDate();
    notifyListeners();
  }
}
