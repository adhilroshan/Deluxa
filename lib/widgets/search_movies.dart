import 'package:flutter/material.dart';
import '../auth/auth.dart';

import '../api/api.dart';
import '../models/models.dart';

class SearchMovieWidget extends StatefulWidget {
  final ThemeData? themeData;
  final String? query;
  final List<Genres>? genres;
  final Function(Movie)? onTap;
  const SearchMovieWidget(
      {Key? key, this.themeData, this.query, this.genres, this.onTap})
      : super(key: key);
  @override
  _SearchMovieWidgetState createState() => _SearchMovieWidgetState();
}

class _SearchMovieWidgetState extends State<SearchMovieWidget> {
  List<Movie>? moviesList;
  @override
  void initState() {
    super.initState();
    fetchMovies(Endpoints.movieSearchUrl(widget.query!)).then((value) {
      setState(() {
        moviesList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.themeData!.primaryColor,
      child: moviesList == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : moviesList!.isEmpty
              ? Center(
                  child: Text(
                    "Oops! couldn't find the movie",
                    style: widget.themeData!.textTheme.bodyLarge,
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: moviesList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          widget.onTap!(moviesList![index]);
                        },
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 70,
                                  height: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: moviesList![index].posterPath == null
                                        ? Image.asset(
                                            'assets/images/na.jpg',
                                            fit: BoxFit.cover,
                                          )
                                        : FadeInImage(
                                            image: NetworkImage('${baseImageURL}w500/${moviesList![index].posterPath!}'),
                                            fit: BoxFit.cover,
                                            placeholder: const AssetImage(
                                                'assets/images/loading.gif'),
                                          ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          moviesList![index].title!,
                                          style: widget
                                              .themeData!.textTheme.bodyMedium,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              moviesList![index].voteAverage!,
                                              style: widget.themeData!.textTheme
                                                  .bodyLarge,
                                            ),
                                            const Icon(Icons.star,
                                                color: Colors.green)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Divider(
                                color: widget.themeData!.colorScheme.onSecondary,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
