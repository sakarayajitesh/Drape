import 'dart:io';

import 'package:flutter/material.dart';

import '../helpers.dart';

class ImageTile extends StatelessWidget {
  final String image;
  final double elevation;

  const ImageTile({Key? key, required this.image, this.elevation = 1.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: image,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(myCardCorner),
        ),
        elevation: elevation,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: Image.file(
          File(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
