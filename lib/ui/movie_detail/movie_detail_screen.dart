import 'package:flutter/material.dart';

import '../../domain/model/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailScreen(this.movie, {super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.movie.title),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'fly',
              child: Image.network(
                widget.movie.backdropPath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 5, right: 5),
              child: Row(
                children: [
                  Text(
                    '개봉일 : ${widget.movie.releaseDate}',
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
              child: Row(
                children: [
                  Text(
                    '평점 : ${widget.movie.voteAverage.toString()}',
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
              child: Row(
                children: const [
                  Text(
                    '줄거리 :',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
                left: 5,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.movie.overview.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 40.0, bottom: 20, left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          Text(
                            '재생',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white24),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.file_download_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            '저장',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 10,),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const Text(
                      '보관함에 추가',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(width: 30,),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    const Text(
                      '공유',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
