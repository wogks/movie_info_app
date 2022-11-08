import 'package:flutter/material.dart';
import 'package:movie_app/ui/components/movie_list.dart';
import 'package:movie_app/ui/liked_movie/like_movie_screen.dart';
import 'package:movie_app/ui/movie_main/movie_view_model.dart';
import 'package:provider/provider.dart';

import '../movie_search/movie_search_screen.dart';

class MovieMainScreen extends StatefulWidget {
  const MovieMainScreen({super.key});

  @override
  State<MovieMainScreen> createState() => _MovieMainScreenState();
}

class _MovieMainScreenState extends State<MovieMainScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MovieViewModel>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.star,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LikedMovieScreen(),),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MovieSearchScreen()),
              );
            },
          )
        ],
      ),
      body: viewModel.movieList.isEmpty ||
              viewModel.sortedMovieListByTitle.isEmpty ||
              viewModel.sortedMovieListByVoteAverage.isEmpty ||
              viewModel.sortedMovieByReleaseDate.isEmpty
          ? Container(
              color: Colors.black,
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            )
          : Container(
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MovieList(
                        movieList: viewModel.movieList,
                        filterTitle: '상영 중인 영화'),
                    MovieList(
                        movieList: viewModel.sortedMovieListByVoteAverage,
                        filterTitle: '평점순'),
                    MovieList(
                        movieList: viewModel.sortedMovieListByTitle,
                        filterTitle: '이름순'),
                    MovieList(
                        movieList: viewModel.sortedMovieByReleaseDate,
                        filterTitle: '최신순'),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          '라이센스',
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
