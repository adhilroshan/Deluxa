import 'package:flutter/material.dart';
import 'package:netflix_flutter/assets.dart';
import 'package:netflix_flutter/auth/auth.dart';

import '../models/models.dart';
import '../screens/movie_detail.dart';

class ParticularGenreMovies extends StatefulWidget {
  final ThemeData themeData;
  final String api;
  final List<Genres> genres;
  const ParticularGenreMovies(
      {Key? key, required this.themeData, required this.api, required this.genres}) : super(key: key);
  @override
  _ParticularGenreMoviesState createState() => _ParticularGenreMoviesState();
}

class _ParticularGenreMoviesState extends State<ParticularGenreMovies> {
  List<Movie>? moviesList;
  @override
  void initState() {
    super.initState();
    fetchMovies(widget.api).then((value) {
      setState(() {
        moviesList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.themeData.primaryColor.withOpacity(0.8),
      child: moviesList == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: moviesList!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailPage(
                                  movie: moviesList![index],
                                  themeData: widget.themeData,
                                  genres: widget.genres,
                                  heroId: '${moviesList![index].id}')));
                    },
                    child: SizedBox(
                      height: 150,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: widget.themeData.primaryColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      width: 1,
                                      color: widget.themeData.colorScheme.secondary)),
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 118.0, top: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      moviesList![index].title!,
                                      style:
                                          widget.themeData.textTheme.bodyMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            moviesList![index].voteAverage!,
                                            style: widget
                                                .themeData.textTheme.bodyLarge,
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: Colors.green,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 8,
                            child: Hero(
                              tag: '${moviesList![index].id}',
                              child: SizedBox(
                                width: 100,
                                height: 125,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: FadeInImage(
                                    image: NetworkImage('${baseImageURL}w500/${moviesList![index].posterPath!}'),
                                    fit: BoxFit.cover,
                                    placeholder:
                                        const AssetImage(Assets.loading),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
