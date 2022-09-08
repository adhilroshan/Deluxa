import '../auth/auth.dart';

class Endpoints {
  static String discoverMoviesUrl(int page) {
    return '$baseURL'
        '/discover/movie?api_key='
        '$myApiKey'
        '&language=en-US&sort_by=popularity'
        '.desc&include_adult=false&include_video=false&page'
        '=$page';
  }

  static String getTrendingUrl() {
    return '$baseURL'
        '/trending/all/day?api_key='
        '$myApiKey';
  }

  static String nowPlayingMoviesUrl(int page) {
    return '$baseURL'
        '/movie/now_playing?api_key='
        '$myApiKey'
        '&include_adult=false&page=$page';
  }

  static String getCreditsUrl(int id) {
    return '$baseURL/movie/$id/credits?api_key=$myApiKey';
  }

  static String topRatedUrl(int page) {
    return '$baseURL'
        '/movie/top_rated?api_key='
        '$myApiKey'
        '&include_adult=false&page=$page';
  }

  static String popularMoviesUrl(int page) {
    return '$baseURL'
        '/movie/popular?api_key='
        '$myApiKey'
        '&include_adult=false&page=$page';
  }

  static String upcomingMoviesUrl(int page) {
    return '$baseURL'
        '/movie/upcoming?api_key='
        '$myApiKey'
        '&include_adult=false&page=$page';
  }

  static String movieDetailsUrl(int movieId) {
    return '$baseURL/movie/$movieId?api_key=$myApiKey&append_to_response=credits,'
        'images';
  }

  static String genresUrl() {
    return '$baseURL/genre/movie/list?api_key=$myApiKey&language=en-US';
  }

  static String orginals(int page) {
    return '$baseURL/discover/tv?api_key=$myApiKey&with_networks=$page';
  }

  static String getMoviesForGenre(int genreId, int page) {
    return '$baseURL/discover/movie?api_key=$myApiKey'
        '&language=en-US'
        '&sort_by=popularity.desc'
        '&include_adult=false'
        '&include_video=false'
        '&page=$page'
        '&with_genres=$genreId';
  }

  static String movieReviewsUrl(int movieId, int page) {
    return '$baseURL/movie/$movieId/reviews?api_key=$myApiKey'
        '&language=en-US&page=$page';
  }

  static String movieSearchUrl(String query) {
    return "$baseURL/search/movie?query=$query&api_key=$myApiKey";
  }

  static String personSearchUrl(String query) {
    return "$baseURL/search/person?query=$query&api_key=$myApiKey";
  }

  static getPerson(int personId) {
    return "$baseURL/person/$personId?api_key=$myApiKey&append_to_response=movie_credits";
  }

  static getTrailer(int id) {
    return "$baseURL/movie/$id/videos?api_key=$myApiKey&language=en-US";
  }
}
