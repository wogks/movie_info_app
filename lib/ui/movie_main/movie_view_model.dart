import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/data_source/movie_api_impl.dart';
import 'package:movie_app/data/repository/movie_repository_impl.dart';
import 'package:movie_app/domain/fire_model/fire_model.dart';
import 'package:movie_app/domain/model/movie_dto.dart';

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

  final moviessRef =
      FirebaseFirestore.instance.collection('likedMovie').withConverter<FireModel>(
            fromFirestore: (snapshot, _) => FireModel.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson(),
          );
  Future<void> addMovie(String title, String backdropPath) async {
    await moviessRef.add(
      FireModel(
        uid: FirebaseAuth.instance.currentUser?.uid ?? '',
        title: title,
        backdropPath: backdropPath,
      ),
    );
  }
}
