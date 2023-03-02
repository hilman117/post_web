import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../style.dart';

class ListItemTitle extends StatelessWidget {
  const ListItemTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 800.w,
              child: Text(
                title,
                style: style18Normal,
              ),
            ),
            const Spacer(),
            Material(
              color: Colors.transparent,
              child: IconButton(
                  splashColor: Colors.grey,
                  splashRadius: 15,
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_outlined,
                    size: 25.sp,
                    color: Colors.grey,
                  )),
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
