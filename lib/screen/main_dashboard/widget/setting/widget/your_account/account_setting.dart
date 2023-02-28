import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/style.dart';

import 'widget/your_details.dart';

class YourAccount extends StatelessWidget {
  const YourAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Profile", style: style22Bold),
            Text("Your account type is admin", style: style20Normal),
            SizedBox(
              height: 70.h,
            ),
            const YourAccountDetail()
          ],
        ));
  }
}
