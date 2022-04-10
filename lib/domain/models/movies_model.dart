class MoviesModel {
  int? page;
  int? totalPages;
  int? totalResults;
  MoviesDatesModel? dates;
  List<MoviesResultModel>? results;

  MoviesModel({
    this.page,
    this.totalPages,
    this.totalResults,
    this.dates,
    this.results,
  });

  MoviesModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    dates = json['dates'] != null ? MoviesDatesModel.fromJson(json['dates']) : null;
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = <MoviesResultModel>[];
      json['results'].forEach((v) {
        results!.add(MoviesResultModel.fromJson(v));
      });
    }
  }
}

class MoviesDatesModel {
  String? maximum;
  String? minimum;

  MoviesDatesModel({
    this.maximum,
    this.minimum,
  });

  MoviesDatesModel.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
}

class MoviesResultModel {
  int? id;
  int? voteCount;
  num? voteAverage;
  bool? adult;
  bool? video;
  num? popularity;
  String? title;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? backdropPath;
  String? originalTitle;
  String? originalLanguage;
  List<int>? genreIds;

  MoviesResultModel({
    this.id,
    this.voteCount,
    this.voteAverage,
    this.adult,
    this.video,
    this.popularity,
    this.title,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.backdropPath,
    this.originalTitle,
    this.originalLanguage,
    this.genreIds,
  });

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voteCount = json['vote_count'];
    voteAverage = json['vote_average'];
    adult = json['adult'];
    video = json['video'];
    popularity = json['popularity'];
    title = json['title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    backdropPath = json['backdrop_path'];
    originalTitle = json['original_title'];
    originalLanguage = json['original_language'];
    genreIds = json['genre_ids'].cast<int>();
  }
}
