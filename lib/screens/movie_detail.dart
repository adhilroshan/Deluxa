import 'dart:io';
import 'package:flutter/material.dart';
import '../assets.dart';
import '../auth/auth.dart';
import '../models/trailer.dart';

import '../api/api.dart';
import '../models/models.dart';
import '../widgets/genre_list.dart';
import '../widgets/scrolling_artist.dart';
import '../widgets/video_slider.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;
  final String heroId;
  final List<Genres> genres;
  final ThemeData themeData;

  const MovieDetailPage(
      {Key? key,
      required this.movie,
      required this.heroId,
      required this.genres,
      required this.themeData})
      : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  List<Result>? trailerList;

  @override
  void initState() {
    super.initState();
    fetchTrailers(Endpoints.getTrailer(widget.movie.id!)).then((value) {
      setState(() {
        trailerList = value;
      });
    });
  }

  List<String> getTrailerPlaylist() {
    List<String> trailerPlaylist = [];
    for (var i = 1; i < trailerList!.length; i++) {
      trailerPlaylist.add(trailerList![i].key);
    }
    return trailerPlaylist;
  }

  @override
  Widget build(BuildContext context) {
    // List<String> trailerPlaylist = getTrailerPlaylist();
    ThemeData theme = widget.themeData;
    // print(trailerPlaylist);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    widget.movie.backdropPath == null
                        ? Image.asset(
                            Assets.na,
                            fit: BoxFit.cover,
                          )
                        : FadeInImage(
                            width: double.infinity,
                            height: double.infinity,
                            image: NetworkImage(
                                '${baseImageURL}original/${widget.movie.backdropPath!}'),
                            fit: BoxFit.cover,
                            placeholder: const AssetImage(Assets.loading),
                          ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                              begin: FractionalOffset.bottomCenter,
                              end: FractionalOffset.topCenter,
                              colors: [
                                Theme.of(context).colorScheme.secondary,
                                Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.3),
                                Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.2),
                                Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.1),
                              ],
                              stops: const [
                                0.0,
                                0.25,
                                0.5,
                                0.75
                              ])),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: theme.colorScheme.secondary,
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    // color: theme.primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 75, 16, 16),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            color: widget.themeData.primaryColor,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 120.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          widget.movie.title ??
                                              widget.movie.name!,
                                          style: widget.themeData.textTheme
                                              .headlineSmall,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                widget.movie.voteAverage!,
                                                style: widget.themeData
                                                    .textTheme.bodyLarge,
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
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(
                                      children: <Widget>[
                                        widget.genres.isEmpty
                                            ? Container()
                                            : GenreList(
                                                themeData: widget.themeData,
                                                genres:
                                                    widget.movie.genreIds ?? [],
                                                totalGenres: widget.genres,
                                              ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                'Overview',
                                                style: widget.themeData
                                                    .textTheme.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            widget.movie.overview!,
                                            style: widget
                                                .themeData.textTheme.bodySmall,
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, bottom: 4.0),
                                              child: Text(
                                                'Release date : ${widget.movie.releaseDate}',
                                                style: widget.themeData
                                                    .textTheme.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Platform.isWindows
                                            ? const Text("")
                                            : Text(
                                                "Trailers",
                                                style: widget.themeData
                                                    .textTheme.bodyMedium,
                                              ),
                                        Platform.isWindows? const SizedBox() :
                                        SizedBox(
                                          child: trailerList == null
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )
                                              : VideoSlider(
                                                  list: getTrailerPlaylist()),
                                        ),
                                        ScrollingArtists(
                                          api: Endpoints.getCreditsUrl(
                                              widget.movie.id!),
                                          title: 'Cast',
                                          tapButtonText: 'See full cast & crew',
                                          themeData: widget.themeData,
                                          onTap: (Cast cast) {
                                            modalBottomSheetMenu(cast);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 40,
                        child: Hero(
                          tag: widget.heroId,
                          child: SizedBox(
                            width: 100,
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: widget.movie.posterPath == null
                                  ? Image.asset(
                                      'assets/images/na.jpg',
                                      fit: BoxFit.cover,
                                    )
                                  : FadeInImage(
                                      image: NetworkImage(
                                          '${baseImageURL}w500/${widget.movie.posterPath!}'),
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
              )
            ],
          )
        ],
      ),
    );
  }

  void modalBottomSheetMenu(Cast cast) {
    // double height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            // height: height / 2,
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                      padding: const EdgeInsets.only(top: 54),
                      decoration: BoxDecoration(
                          color: widget.themeData.primaryColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0))),
                      child: Center(
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    '${cast.name}',
                                    style:
                                        widget.themeData.textTheme.bodyMedium,
                                  ),
                                  Text(
                                    'as',
                                    style:
                                        widget.themeData.textTheme.bodyMedium,
                                  ),
                                  Text(
                                    '${cast.character}',
                                    style:
                                        widget.themeData.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Container(
                        decoration: BoxDecoration(
                            color: widget.themeData.primaryColor,
                            border: Border.all(
                                color: widget.themeData.colorScheme.secondary,
                                width: 3),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: (cast.profilePath == null
                                        ? const AssetImage(Assets.na)
                                        : NetworkImage(
                                            '${baseImageURL}w500/${cast.profilePath!}'))
                                    as ImageProvider<Object>),
                            shape: BoxShape.circle),
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
