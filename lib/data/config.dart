class DataConfig {

  static const String latestMovies = "now_playing";
  static const String popularMovies = "popular";
  static const String topRatedMovies = "top_rated";
  static const String upComingMovies = "upcoming";



  static String movies(
          {int pageNum = 1, required String path, required String key}) =>
      "3/movie/$path?api_key=$key&page=$pageNum";

  static String movieDetail({required num movieId, required String key}) =>
      "3/movie/$movieId?api_key=$key";
}
