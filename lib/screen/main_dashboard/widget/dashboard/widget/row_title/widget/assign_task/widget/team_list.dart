import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../models/user.dart';

class TeamLIst extends StatelessWidget {
  const TeamLIst({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataTeam = Provider.of<List<UserDetails>>(context, listen: false);
    return Expanded(
        child: SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "User",
            style: style20Bold,
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(dataTeam.length, (index) {
                    UserDetails item = dataTeam[index];
                    return Padding(
                      padding: EdgeInsets.all(3.0.sp),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 0.6,
                            child: Checkbox(
                              side: const BorderSide(width: 0.7),
                              value: false,
                              onChanged: (value) {},
                            ),
                          ),
                          SizedBox(
                            width: 200.w,
                            child: Text(
                              item.name!,
                              style: style18Normal,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
