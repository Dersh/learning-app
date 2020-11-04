import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageGrid extends StatelessWidget {
  final List<String> imageLinks;
  ImageGrid({@required this.imageLinks});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      key: ValueKey("loaded_images_parent"),
      crossAxisCount: 3,
      crossAxisSpacing: 11,
      mainAxisSpacing: 10,
      children: imageLinks
          .map((link) => ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: CachedNetworkImage(
                  key: ValueKey("loaded_image"),
                  fit: BoxFit.cover,
                  imageUrl: link,
                  width: 106,
                  height: 106,
                ),
              ))
          .toList(),
    );
  }
}
