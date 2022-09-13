import 'package:movie_app/domain/model/movie_dto.dart';

abstract class MovieApi {
  Future<MovieDto> getMovieList();
  Future<MovieDto> getSearchMovieList(String query);
}
