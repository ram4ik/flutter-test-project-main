import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tmdb_test/utils/dimes.dart';

class HeaderImageView extends StatelessWidget {
  final String imageUrl;

  const HeaderImageView({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.radius16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.radius16),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: 200.0,
            width: 200.0,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
          ),
        ),
      ),
    );
  }
}
