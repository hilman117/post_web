// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'photo_grid.dart';

class MultiplePhoto extends StatelessWidget {
  final List<dynamic> images;
  final double moreThan4;
  final double isEqualorLessThan1;
  const MultiplePhoto(
      {Key? key,
      required this.images,
      required this.moreThan4,
      required this.isEqualorLessThan1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PhotoGrid(
        imageUrls: images,
        onImageClicked: (i) => print('Image $i was clicked!'),
        onExpandClicked: () => print('Expand Image was clicked'),
        maxImages: 4,
        key: null,
      ),
    );
  }
}
