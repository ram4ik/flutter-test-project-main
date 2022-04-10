import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tmdb_test/presentation/features/movies/view/header_image.dart';

class MainPage {

  static final latest = find.byKey(const Key("latest"));
  static final popular = find.byKey(const Key("popular"));
  static final top = find.byKey(const Key("top"));
  static final upcoming = find.byKey(const Key("upcoming"));

  static final latestText = find.text('Latest movies');
  static final popularText = find.text('Popular movies');
  static final topText = find.text('Top Rated movies');
  static final upcomingText = find.text('Upcoming movies');

}