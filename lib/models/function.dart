import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_flutter/models/trailer.dart';
import 'package:netflix_flutter/models/trending.dart';
import '../api/api.dart';
import 'credits.dart';
import 'genres.dart';
import 'movie.dart';

Future<List<Movie>> fetchMovies(String api) async {
  MovieList movieList;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);
  movieList = MovieList.fromJson(decodeRes);
  return movieList.movies ?? [];
}

Future<List<Result>> fetchTrailers(String api) async {
  Trailer trailerList;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);
  trailerList = Trailer.fromJson(decodeRes);
  return trailerList.results ?? [];
}

Future<List<TrendingResults>> fetchTrending(String api) async {
  Trending trendingList;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);
  trendingList = Trending.fromJson(decodeRes);
  return trendingList.results;
}

Future<Credits> fetchCredits(String api) async {
  Credits credits;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);
  credits = Credits.fromJson(decodeRes);
  return credits;
}

Future<GenresList> fetchGenres() async {
  GenresList genresList;
  var res = await http.get(Uri.parse(Endpoints.genresUrl()));
  var decodeRes = jsonDecode(res.body);
  genresList = GenresList.fromJson(decodeRes);
  return genresList;
}
