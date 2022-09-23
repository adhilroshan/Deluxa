// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../api/api.dart';
// import 'package:provider/provider.dart';
// import '../data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/deluxa_app_bar.dart';
import '../cubits/cubits.dart';
// import '../theme/theme_state.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';
import 'movie_detail.dart';
import 'search_view.dart';
import 'settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Genres> _genres = [];

  @override
  void initState() {
    super.initState();
    fetchGenres().then((value) {
      _genres = value.genres ?? [];
    });
    _scrollController = ScrollController()
      ..addListener(() {
        context.read<AppBarCubit>().setOffset(_scrollController.offset);
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final state = Provider.of<ThemeState>(context);
    final ThemeData theme = Theme.of(context);
    // final screenSize = MediaQuery.of(context).size;
    // print("Trending Movies $_trendingResults");
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
          backgroundColor: theme.floatingActionButtonTheme.backgroundColor,
          child:  Icon(Icons.search,color: theme.floatingActionButtonTheme.foregroundColor),
          onPressed: () async {
            final Movie? result = await showSearch<Movie?>(

                context: context,
                delegate: MovieSearch(themeData: theme, genres: _genres));
            if (result != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(
                    movie: result,
                    themeData: theme,
                    genres: _genres,
                    heroId: '${result.id}search',
                  ),
                ),
              );
            }
          }),
      // appBar: PreferredSize(
      //   preferredSize: Size(screenSize.width, 50.0),
      //   child: BlocBuilder<AppBarCubit, double>(
      //     builder: (context, scrollOffset) {
      //       return CustomAppBar(
      //         scrollOffset: scrollOffset,
      //         genres: _genres,
      //       );
      //     },
      //   ),
      // ),
      drawer: const Drawer(
        child: SettingsPage(),
      ),
      body: CustomScrollView(
        // controller: _scrollController,
        slivers: [
          DeluxaAppBar(
            api: Endpoints.getTrendingUrl(),
            themeData: theme,
          ),
          // Responsive.isDesktop(context) ?const SliverToBoxAdapter(
          //   child: ContentHeader(),
          // ) : const SizedBox(),
          // SliverPadding(
          //   padding: const EdgeInsets.only(top: 20.0),
          //   sliver: SliverToBoxAdapter(
          //     child: Previews(
          //       key: const PageStorageKey('previews'),
          //       title: 'Previews',
          //     ),
          //   ),
          // ),

          // SliverToBoxAdapter(
          //   child: ContentList(
          //     key: const PageStorageKey('Originals'),
          //     title: 'Netflix Originals',
          //     isOriginals: true,
          //     genres: _genres,
          //     api: Endpoints.orginals(213),
          //     themeData: state.themeData,
          //   ),
          // ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 40.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: const PageStorageKey('nowplaying'),
                title: 'Now Playing',
                genres: _genres,
                themeData: theme,
                api: Endpoints.nowPlayingMoviesUrl(1),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: const PageStorageKey('top'),
              title: 'Upcoming Movies',
              api: Endpoints.upcomingMoviesUrl(1),
              themeData: theme,
              genres: _genres,
            ),
          ),
          // SliverToBoxAdapter(
          //   child: ContentList(
          //     key: const PageStorageKey('top'),
          //     title: 'Trending Movies',
          //     api: Endpoints.getTrendingUrl(),
          //     themeData: theme,
          //     genres: _genres,
          //   ),
          // ),
          SliverToBoxAdapter(
            child: ContentList(
              key: const PageStorageKey('top'),
              title: 'Top Rated',
              themeData: theme,
              api: Endpoints.topRatedUrl(1),
              genres: _genres,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: const PageStorageKey('popularmovies'),
              title: 'Popular Movies',
              themeData: theme,
              api: Endpoints.popularMoviesUrl(1),
              genres: _genres,
            ),
          ),
        ],
      ),
    );
  }
}
