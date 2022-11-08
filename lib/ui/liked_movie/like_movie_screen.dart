import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:movie_app/domain/fire_model/fire_model.dart';

class LikedMovieScreen extends StatelessWidget {
  const LikedMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('즐겨찾기'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FirestoreListView(
                query: _query(),
                itemBuilder: (context, snapshot) {
                  final likedMovie = snapshot.data();
                  return ListTile(
                    title: Image.network(
                      likedMovie.backdropPath,
                      fit: BoxFit.cover,
                    ),
                    subtitle: Text(likedMovie.title, style: const TextStyle(color: Colors.white),),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Query<FireModel> _query() {
    return FirebaseFirestore.instance
        .collection('likedMovie')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid ?? '')
        .withConverter<FireModel>(
          fromFirestore: (snapshot, _) => FireModel.fromJson(snapshot.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        );
  }
}
