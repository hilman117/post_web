import 'dart:typed_data';

import 'package:flutter/material.dart';

class PhotoProfileFile extends StatelessWidget {
  final Uint8List? fileImage;
  final double lebar;
  final double tinggi;
  final double radius;
  const PhotoProfileFile(
      {Key? key,
      required this.lebar,
      required this.tinggi,
      required this.radius,
      required this.fileImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.grey,
        radius: radius,
        child: Stack(
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(50),
              child: LayoutBuilder(builder: (p0, p1) {
                return Image.asset(
                  'image/profile-user.png',
                  fit: BoxFit.cover,
                  width: p1.maxWidth * 1,
                  height: p1.maxHeight * 1,
                );
              }),
            ),
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(50),
              child: fileImage != null
                  ? LayoutBuilder(
                      builder: (p0, p1) => Image.memory(
                            fileImage!,
                            fit: BoxFit.cover,
                            width: p1.maxWidth * 1,
                            height: p1.maxHeight * 1,
                            errorBuilder: (context, error, stackTrace) {
                              // print("ini error nya $error");
                              return Image.asset(
                                'image/profile-user.png',
                                fit: BoxFit.cover,
                                // width: width * 0.2,
                              );
                            },
                          ))
                  : LayoutBuilder(builder: (p0, p1) {
                      return Image.asset(
                        'image/profile-user.png',
                        fit: BoxFit.cover,
                        width: p1.maxWidth * 1,
                        height: p1.maxHeight * 1,
                      );
                    }),
            ),
          ],
        ));
  }
}
