import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedNetworkImageCustom extends StatelessWidget {
  String imageUrl;

  CachedNetworkImageCustom({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Center(
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const SizedBox(height: 80),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
