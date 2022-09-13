import '../../domain/model/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getResult();
  Future<List<Movie>> getSearchResult(String query);
  Future<List<Movie>> getSortedRusultByTitle();
  Future<List<Movie>> getSortedResultByVoteAverage();
  Future<List<Movie>> getSortedResultByReleaseDate();
}