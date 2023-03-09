import 'package:flutter/material.dart';

class PhotoProfile extends StatelessWidget {
  final String urlImage;
  final double lebar;
  final double tinggi;
  final double radius;
  const PhotoProfile(
      {Key? key,
      required this.lebar,
      required this.tinggi,
      required this.radius,
      required this.urlImage})
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
              child: urlImage != ''
                  ? LayoutBuilder(
                      builder: (p0, p1) => Image.network(
                            urlImage,
                            fit: BoxFit.cover,
                            width: p1.maxWidth * 1,
                            height: p1.maxHeight * 1,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress != null) {
                                return Container(
                                  width: p1.maxWidth * 1,
                                  height: p1.maxHeight * 1,
                                  color: Colors.grey,
                                  child: Image.asset("image/profile-user.png",
                                      width: p1.maxWidth * 1),
                                );
                              } else {
                                return child;
                              }
                            },
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
