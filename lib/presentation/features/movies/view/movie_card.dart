import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tmdb_test/utils/dimes.dart';

class MainCard extends StatelessWidget {
  final int id;
  final bool isFirst;
  final bool isLast;
  final String url;
  final String title;

  const MainCard({
    Key? key,
    required this.id,
    required this.isFirst,
    required this.isLast,
    required this.url,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimens.spacing8,
        left: isFirst ? Dimens.spacing16 : Dimens.spacing8,
        right: isLast ? Dimens.spacing16 : Dimens.spacing8,
      ),
      width: 100.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimens.radius8),
            child: CachedNetworkImage(
              imageUrl: url,
              height: 130.0,
              width: 100.0,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
            ),
          ),
          const SizedBox(height: Dimens.spacing8),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
