import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/utils/app_assets.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => Image.asset(Assets.assetsLoadingIndicator),
      errorWidget: (context, url, error) {
        return Image.asset(
          Assets.assetsPlaceHolder,
          fit: BoxFit.cover,
          height: 200,
        );
      },
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}
