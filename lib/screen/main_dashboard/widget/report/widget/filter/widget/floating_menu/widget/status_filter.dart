import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controller_report.dart';

class FilterStatus extends StatelessWidget {
  const FilterStatus({
    Key? key,
    required this.p1,
  }) : super(key: key);
  final BoxConstraints p1;

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportController>(
      builder: (context, value, child) => SizedBox(
        // height: p1.maxHeight * 0.,
        width: p1.maxWidth,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: p1.maxWidth * 0.03,
                      top: p1.maxWidth * 0.025,
                      right: p1.maxWidth * 0.05),
                  child: Text(
                    "Status",
                    style: TextStyle(
                        fontSize: p1.maxWidth * 0.03, color: Colors.black54),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: p1.maxWidth * 0.75,
                  height: p1.maxHeight * 0.4,
                  child: Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      children: List.generate(
                          value.status.length,
                          (index) => SizedBox(
                                width: p1.maxWidth * 0.25,
                                child: Row(
                                  children: [
                                    Transform.scale(
                                      scale: 0.7,
                                      child: Checkbox(
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text(
                                        value.status[index],
                                        style: TextStyle(
                                            fontSize: p1.maxWidth * 0.03),
                                      ),
                                    ),
                                  ],
                                ),
                              ))),
                )
              ],
            ),
            const Divider(
              endIndent: 15,
            ),
          ],
        ),
      ),
    );
  }
}
