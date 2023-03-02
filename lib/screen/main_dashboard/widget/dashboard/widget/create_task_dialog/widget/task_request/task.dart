import 'package:flutter/material.dart';
import 'package:post_web/other.dart';
import 'package:post_web/reusable_widget/no_button.dart';
import 'package:post_web/reusable_widget/yes_button.dart';
import 'package:provider/provider.dart';

import '../../controller/controller_create_task.dart';

class Task extends StatelessWidget {
  const Task({
    Key? key,
    required this.p1,
  }) : super(key: key);
  final BoxConstraints p1;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateController>(
        builder: (context, value, child) => Container(
            margin: EdgeInsets.only(top: p1.maxWidth * 0.05),
            width: p1.maxWidth,
            child: LayoutBuilder(
              builder: (p0, p2) => Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: p2.maxWidth * 0.005),
                            margin: EdgeInsets.symmetric(
                                horizontal: p2.maxWidth * 0.01,
                                vertical: p2.maxHeight * 0.01),
                            height: p2.maxHeight * 0.07,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5, color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade100,
                                    blurRadius: 0.5,
                                    spreadRadius: 0.5,
                                    offset: const Offset(0.5, 0.5))
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Choose Department",
                                  style:
                                      TextStyle(fontSize: p2.maxWidth * 0.015),
                                ),
                                Icon(
                                  Icons.assignment_outlined,
                                  color: mainColor,
                                  size: p2.maxWidth * 0.020,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: p2.maxWidth * 0.005),
                            margin: EdgeInsets.symmetric(
                                horizontal: p2.maxWidth * 0.01,
                                vertical: p2.maxHeight * 0.01),
                            height: p2.maxHeight * 0.07,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5, color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade100,
                                    blurRadius: 0.5,
                                    spreadRadius: 0.5,
                                    offset: const Offset(0.5, 0.5))
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Title",
                                  style:
                                      TextStyle(fontSize: p2.maxWidth * 0.015),
                                ),
                                Icon(
                                  Icons.title_outlined,
                                  color: mainColor,
                                  size: p2.maxWidth * 0.020,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: p2.maxWidth * 0.005),
                            margin: EdgeInsets.symmetric(
                                horizontal: p2.maxWidth * 0.01,
                                vertical: p2.maxHeight * 0.01),
                            height: p2.maxHeight * 0.07,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5, color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade100,
                                    blurRadius: 0.5,
                                    spreadRadius: 0.5,
                                    offset: const Offset(0.5, 0.5))
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Location",
                                  style:
                                      TextStyle(fontSize: p2.maxWidth * 0.015),
                                ),
                                Icon(
                                  Icons.pin_drop_outlined,
                                  color: mainColor,
                                  size: p2.maxWidth * 0.020,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          // height: p2.maxHeight * 0.07,
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: p2.maxWidth * 0.005),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: p2.maxWidth * 0.01,
                                        vertical: p2.maxHeight * 0.01),
                                    height: p2.maxHeight * 0.07,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade100,
                                            blurRadius: 0.5,
                                            spreadRadius: 0.5,
                                            offset: const Offset(0.5, 0.5))
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Set Date",
                                          style: TextStyle(
                                              fontSize: p2.maxWidth * 0.015),
                                        ),
                                        Icon(
                                          Icons.date_range_outlined,
                                          color: mainColor,
                                          size: p2.maxWidth * 0.020,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: p2.maxWidth * 0.005),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: p2.maxWidth * 0.01,
                                        vertical: p2.maxHeight * 0.01),
                                    height: p2.maxHeight * 0.07,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade100,
                                            blurRadius: 0.5,
                                            spreadRadius: 0.5,
                                            offset: const Offset(0.5, 0.5))
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Set Time",
                                          style: TextStyle(
                                              fontSize: p2.maxWidth * 0.015),
                                        ),
                                        Icon(
                                          Icons.schedule_outlined,
                                          color: mainColor,
                                          size: p2.maxWidth * 0.020,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: p2.maxHeight * 0.35,
                          margin: EdgeInsets.symmetric(
                              horizontal: p2.maxWidth * 0.01,
                              vertical: p2.maxHeight * 0.01),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5, color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade100,
                                  blurRadius: 0.5,
                                  spreadRadius: 0.5,
                                  offset: const Offset(0.5, 0.5))
                            ],
                          ),
                          child: TextFormField(
                            minLines: 1,
                            maxLines: null,
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            cursorColor: mainColor,
                            cursorHeight: p2.maxWidth * 0.015,
                            style: TextStyle(fontSize: p2.maxWidth * 0.015),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Description...",
                                contentPadding: EdgeInsets.only(
                                    top: 0, left: p2.maxWidth * 0.015)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: p2.maxWidth,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: p2.maxWidth * 0.005),
                        margin: EdgeInsets.symmetric(
                            horizontal: p2.maxWidth * 0.01,
                            vertical: p2.maxHeight * 0.01),
                        height: p2.maxHeight * 0.07,
                        width: p2.maxWidth * 0.13,
                        decoration: BoxDecoration(
                          color: mainColor,
                          border: Border.all(width: 0.5, color: mainColor),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius: 0.5,
                                spreadRadius: 0.5,
                                offset: const Offset(0.5, 0.5))
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Photo",
                              style: TextStyle(
                                  fontSize: p2.maxWidth * 0.015,
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: p2.maxWidth * 0.020,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NoButton(
                        icon: Icons.close,
                        p2: p2,
                        callback: () => Navigator.of(context).pop(),
                      ),
                      YesButton(
                        icon: Icons.send_outlined,
                        callback: () {},
                        nameButton: 'Send',
                        p2: p2,
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
