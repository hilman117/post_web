import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../models/departement.dart';
import '../../../../../../../../../style.dart';

class GroupList extends StatelessWidget {
  const GroupList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataGroup = Provider.of<List<Departement>>(context, listen: false);
    return Expanded(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Group",
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
                    children: List.generate(dataGroup.length, (index) {
                      Departement item = dataGroup[index];
                      if (item.isActive == true) {
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
                              Text(
                                item.departement!,
                                style: style18Normal,
                              ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox();
                    }),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
