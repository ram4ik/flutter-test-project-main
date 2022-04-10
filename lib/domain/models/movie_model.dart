class MovieModel {
  int? id;
  int? budget;
  int? revenue;
  int? runtime;
  int? voteCount;
  num? voteAverage;
  bool? adult;
  bool? video;
  String? title;
  String? imdbId;
  String? status;
  String? tagline;
  String? homepage;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? backdropPath;
  String? originalTitle;
  String? originalLanguage;
  BelongsToCollectionModel? belongsToCollection;
  List<GenresModel>? genres;
  List<SpokenLanguagesModel>? spokenLanguages;
  List<ProductionCountriesModel>? productionCountries;
  List<ProductionCompaniesModel>? productionCompanies;

  MovieModel({
    this.id,
    this.budget,
    this.revenue,
    this.runtime,
    this.voteCount,
    this.voteAverage,
    this.adult,
    this.video,
    this.title,
    this.imdbId,
    this.status,
    this.tagline,
    this.homepage,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.backdropPath,
    this.originalTitle,
    this.originalLanguage,
    this.belongsToCollection,
    this.genres,
    this.spokenLanguages,
    this.productionCountries,
    this.productionCompanies,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    budget = json['budget'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    voteCount = json['vote_count'];
    voteAverage = json['vote_average'];
    adult = json['adult'];
    video = json['video'];
    title = json['title'];
    imdbId = json['imdb_id'];
    status = json['status'];
    tagline = json['tagline'];
    homepage = json['homepage'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    backdropPath = json['backdrop_path'];
    originalTitle = json['original_title'];
    originalLanguage = json['original_language'];
    belongsToCollection =
        json['belongs_to_collection'] != null ? BelongsToCollectionModel.fromJson(json['belongs_to_collection']) : null;
    if (json['genres'] != null) {
      genres = <GenresModel>[];
      json['genres'].forEach((v) {
        genres!.add(GenresModel.fromJson(v));
      });
    }
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguagesModel>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(SpokenLanguagesModel.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountriesModel>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(ProductionCountriesModel.fromJson(v));
      });
    }
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompaniesModel>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(ProductionCompaniesModel.fromJson(v));
      });
    }
  }
}

class BelongsToCollectionModel {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollectionModel({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  BelongsToCollectionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }
}

class GenresModel {
  int? id;
  String? name;

  GenresModel({
    this.id,
    this.name,
  });

  GenresModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class ProductionCompaniesModel {
  int? id;
  String? name;
  String? logoPath;
  String? originCountry;

  ProductionCompaniesModel({
    this.id,
    this.name,
    this.logoPath,
    this.originCountry,
  });

  ProductionCompaniesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logoPath = json['logo_path'];
    originCountry = json['origin_country'];
  }
}

class ProductionCountriesModel {
  String? name;
  String? iso31661;

  ProductionCountriesModel({
    this.name,
    this.iso31661,
  });

  ProductionCountriesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iso31661 = json['iso_3166_1'];
  }
}

class SpokenLanguagesModel {
  String? name;
  String? iso6391;
  String? englishName;

  SpokenLanguagesModel({
    this.name,
    this.iso6391,
    this.englishName,
  });

  SpokenLanguagesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iso6391 = json['iso_639_1'];
    englishName = json['english_name'];
  }
}
