import 'package:flutter/material.dart';
import '../assets.dart';
import '../auth/auth.dart';
import '../models/function.dart';
import '../models/genres.dart';
import '../models/movie.dart';
import '../screens/movie_detail.dart';

class ContentList extends StatefulWidget {
  final String title;
  // final List<Content> contentList;
  final String? api;
  final ThemeData themeData;
  final List<Genres> genres;
  const ContentList({
    Key? key,
    required this.title,
    // required this.contentList,
    this.api,
    required this.genres,
    required this.themeData,
  }) : super(key: key);

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  List<Movie>? moviesList;

  @override
  void initState() {
    super.initState();
    fetchMovies(widget.api!).then((value) {
      setState(() {
        moviesList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              widget.title,
              style: Theme.of(context).primaryTextTheme.headlineSmall,
            ),
          ),
          SizedBox(
            height: 220.0,
            child: moviesList == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    itemCount: moviesList!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailPage(
                                movie: moviesList![index],
                                themeData: widget.themeData,
                                genres: widget.genres,
                                heroId:
                                    '${moviesList![index].id}${widget.title}',
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: '${moviesList![index].id}${widget.title}',
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            height: 200.0,
                            width: 130.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: FadeInImage(
                                image: NetworkImage(
                                  '${baseImageURL}w500/${moviesList![index].posterPath!}',
                                ),
                                fit: BoxFit.cover,
                                placeholder: const AssetImage(Assets.loading),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}
