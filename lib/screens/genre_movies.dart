import 'package:flutter/material.dart';

import '../api/api.dart';
import '../models/models.dart';
import '../widgets/particular_genre_movies.dart';

class GenreMovies extends StatelessWidget {
  final ThemeData themeData;
  final Genres genre;
  final List<Genres> genres;

  const GenreMovies(
      {Key? key, required this.themeData, required this.genre, required this.genres}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.primaryColor,
        title: Text(
          genre.name!,
          style: themeData.textTheme.headlineSmall,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: themeData.colorScheme.secondary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ParticularGenreMovies(
        themeData: themeData,
        api: Endpoints.getMoviesForGenre(genre.id!, 1),
        genres: genres,
      ),
    );
  }
}
