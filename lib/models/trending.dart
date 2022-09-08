class Trending {
  Trending({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<TrendingResults> results;
  late final int totalPages;
  late final int totalResults;

  Trending.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    results = List.from(json['results'])
        .map((e) => TrendingResults.fromJson(e))
        .toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    data['results'] = results.map((e) => e.toJson()).toList();
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class TrendingResults {
  TrendingResults({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.title,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
  });
  late final bool adult;
  late final String backdropPath;
  late final int id;
  late final String? name;
  late final String? title;
  late final String originalLanguage;
  late final String? originalName;
  late final String overview;
  late final String posterPath;
  late final String mediaType;
  late final List<int> genreIds;
  late final double popularity;
  late final String? firstAirDate;
  late final double? voteAverage;
  late final int? voteCount;
  late final List<dynamic>? originCountry;

  TrendingResults.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    name = json['name'];
    title = json['title'];
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    popularity = json['popularity'];
    firstAirDate = json['first_air_date'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['name'] = name;
    data['title'] = title;
    data['original_language'] = originalLanguage;
    data['original_name'] = originalName;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['first_air_date'] = firstAirDate;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['origin_country'] = originCountry;
    return data;
  }
}
