import 'package:flutter/material.dart';
import 'package:movie_app/ui/movie_detail/movie_detail_screen.dart';
import 'package:movie_app/ui/movie_main/movie_view_model.dart';
import 'package:movie_app/ui/movie_search/debouncer.dart';
import 'package:provider/provider.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final _controller = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 300);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MovieViewModel>();

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: TextField(
            style: const TextStyle(color: Colors.white),
            controller: _controller,
            cursorColor: Colors.white,
            onChanged: (value) {
              _debouncer.run(
                () => viewModel.getSearchList(_controller.text),
              );
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: '검색어를 입력하세요',
              hintStyle: TextStyle(color: Colors.white54, fontSize: 15),
            ),
          ),
        ),
        body: _controller.text.isEmpty
            ? Container(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 150,
                                  childAspectRatio: 3 / 4,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 10),
                          itemCount: viewModel.movieList.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () {
                                final movie = viewModel.movieList[index];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MovieDetailScreen(movie),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Image.network(
                                            viewModel
                                                .movieList[index].posterPath,
                                            fit: BoxFit.cover,
                                          )))
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: viewModel.movieSearchList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              final movie = viewModel.movieSearchList[index];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailScreen(movie)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Hero(
                                      tag: 'fly',
                                      child: Image.network(
                                        viewModel
                                            .movieSearchList[index].backdropPath,
                                        width: 160,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Text(
                                      viewModel.movieSearchList[index].title,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ));
  }
}
