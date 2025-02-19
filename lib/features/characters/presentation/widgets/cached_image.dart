import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/utils/app_assets.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key, required this.image, required this.height});

  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => Image.asset(Assets.assetsLoadingIndicator),
      errorWidget: (context, url, error) {
        return Image.asset(
          Assets.assetsPlaceHolder,
          fit: BoxFit.cover,
          height: height,
        );
      },
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}
