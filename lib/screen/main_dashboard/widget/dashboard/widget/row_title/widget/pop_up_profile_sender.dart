import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

class PopUpProfileSender extends StatefulWidget {
  const PopUpProfileSender({Key? key, required this.taskModel})
      : super(key: key);
  final TaskModel taskModel;

  @override
  State<PopUpProfileSender> createState() => _PopUpProfileSenderState();
}

class _PopUpProfileSenderState extends State<PopUpProfileSender>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeOut);
    controller!.repeat(reverse: true);
    controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<DashboardController>(context, listen: false);
    return ScaleTransition(
      scale: animation!,
      alignment: const Alignment(-5.0, 1.0),
      child: Material(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 2, offset: Offset(0.5, 0.5))
          ]),
          height: 450.h,
          width: 400.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 400.w,
                    height: 250.h,
                    child: widget.taskModel.profileImageSender == ""
                        ? Image.asset(
                            'image/profile-user.png',
                            height: 250.h,
                          )
                        : Image.network(
                            widget.taskModel.profileImageSender!,
                            height: 250.h,
                          ),
                  ),
                  Positioned(
                      right: 0,
                      top: 0,
                      child: CloseButton(
                        onPressed: () async {
                          controller!.reverse();
                          await event.hideProfileSender();
                        },
                        color: Colors.grey,
                      ))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                widget.taskModel.sender!,
                style: style22Bold,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                widget.taskModel.positionSender!,
                style: style20Normal,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.black54, width: 0.5),
                            right:
                                BorderSide(color: Colors.black54, width: 0.5))),
                    height: 100.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "117",
                          style: style22Bold,
                        ),
                        Text(
                          "request executed",
                          style: style18Normal,
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            top:
                                BorderSide(color: Colors.black54, width: 0.5))),
                    height: 100.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "289",
                          style: style22Bold,
                        ),
                        Text(
                          "request created",
                          style: style18Normal,
                        )
                      ],
                    ),
                  )),
                ],
              )
              // Text(
              //   "249 request created",
              //   style: style20Normal,
              // ),
              // SizedBox(
              //   height: 5.h,
              // ),
              // Text(
              //   "110 request executed",
              //   style: style20Normal,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
