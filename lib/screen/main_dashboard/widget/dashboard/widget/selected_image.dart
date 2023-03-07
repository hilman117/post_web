import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:provider/provider.dart';

class SelectedImage extends StatelessWidget {
  const SelectedImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<ChatroomControlller>(context, listen: false);
    return Consumer<ChatroomControlller>(
        builder: (context, value, child) => Material(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 200.h,
                width: 800.w,
                alignment: Alignment.center,
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                        // color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade200)),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          value.imageList.length,
                          (index) => Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5.sp),
                                height: 190.h,
                                width: 190.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.memory(
                                  value.imageList[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () => ctrl.removeSingleImage(index),
                                  child: Icon(
                                    Icons.cancel,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ));
  }
}
