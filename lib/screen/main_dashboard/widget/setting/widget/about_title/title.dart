import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

import 'widget/pop_up_departement.dart';
import 'widget/title_list.dart';

class TitleSettings extends StatelessWidget {
  const TitleSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => showDepartementOption(context),
          child: Container(
            // width: 150.w,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey.shade200)),
            child: Row(
              children: [
                Consumer<DashboardController>(
                  builder: (context, value, child) => Text(
                    value.selecteddepartement != ""
                        ? value.selecteddepartement
                        : "Choose Departement",
                    style: style18Normal,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Colors.black87,
                  size: 25.sp,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        const TitleList()
      ],
    );
  }
}
