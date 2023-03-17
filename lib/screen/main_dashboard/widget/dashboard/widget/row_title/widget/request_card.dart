import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/const.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/close_task_dialog.dart';
import 'package:post_web/reusable_widget/reopen_button.dart';
import 'package:post_web/style.dart';
import 'package:post_web/reusable_widget/photo_profile_network.dart';
import 'package:provider/provider.dart';
import '../../../../../../../models/departement.dart';
import '../../../../../../../models/user.dart';
import '../../../controller_dashboard.dart';
import '../../floating_chatroom/controller_floating_chatroom.dart';
import '../../floating_chatroom/widget/assign_task/assign_task.dart';
import 'status_widget.dart';
import 'timer.dart';

class RequestCard extends StatefulWidget {
  final int index;
  final TaskModel taskModel;

  const RequestCard({
    Key? key,
    required this.index,
    required this.taskModel,
  }) : super(key: key);

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard>
    with TickerProviderStateMixin {
  //fade transition animation
  late final AnimationController notTrue = AnimationController(
    value: 1,
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    notTrue.dispose();
    _controller.dispose();
    super.dispose();
  }

  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final functionChatCtrl =
        Provider.of<ChatroomControlller>(context, listen: false);

    final dashboardCtrl = context.watch<DashboardController>();
    // final local = AppLocalizations.of(context)!;
    var dataGroup = Provider.of<List<Departement>>(context, listen: false);
    var dataTeam = Provider.of<List<UserDetails>>(context);
    final controller = Provider.of<DashboardController>(context, listen: false);
    Locale countryCode = Localizations.localeOf(context);
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: Container(
        color: (dashboardCtrl.selectedCardRequest == widget.index)
            ? mainColor2.withOpacity(0.2)
            : (isHover)
                ? Colors.grey.shade200
                : Colors.white,
        child: FadeTransition(
          opacity: widget.taskModel.isFading == true ? _animation : notTrue,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5.h),
            onTap: () {
              functionChatCtrl.newStatus(widget.taskModel.status!);
              controller.selectingCardRequest(widget.index);
              // controller.overlayChatroom(context, true,
              //     FloatingChatroom(taskModel: widget.taskModel));
              controller.openChatRoom(true, widget.taskModel);
            },
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 280.w,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: InkWell(
                                onTap: () {},
                                child: PhotoProfileNetWork(
                                    lebar: 25.w,
                                    tinggi: 25.h,
                                    radius: 25.sp,
                                    urlImage:
                                        widget.taskModel.profileImageSender!),
                              ),
                            ),
                            Flexible(
                              child: Text(widget.taskModel.sender!,
                                  style: style18Normal),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 70.w,
                        child: Image.asset(
                          "image/${widget.taskModel.sendTo}.png",
                          width: 35.w,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 200.w,
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                          widget.taskModel.location!,
                          style: style18Bold,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 200.w,
                        padding: EdgeInsets.only(right: 10.w),
                        child:
                            Text(widget.taskModel.title!, style: style18Normal),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 200.w,
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                            widget.taskModel.description == ''
                                ? "-"
                                : widget.taskModel.description!,
                            style: style18Normal),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 200.w,
                        child: StatusWidget(status: widget.taskModel.status!),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 230.w,
                        padding: EdgeInsets.only(right: 3.w),
                        child: Text(
                            widget.taskModel.receiver != ""
                                ? widget.taskModel.receiver!
                                : "-",
                            style: style18Normal),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          width: 200.w,
                          child: widget.taskModel.status == "Close"
                              ? ReopenButton(idTask: widget.taskModel.id!)
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Tooltip(
                                      message: 'Accept',
                                      child: ActionButton(
                                        callback: () =>
                                            functionChatCtrl.accepTask(
                                                context, widget.taskModel.id!),
                                        color: Colors.green,
                                        widget: Icon(
                                          Icons.check,
                                          size: 20.sp,
                                        ),
                                      ),
                                    ),
                                    Tooltip(
                                      message: "Assign",
                                      child: ActionButton(
                                        callback: () async {
                                          await functionChatCtrl.cleaList();
                                          if (dataTeam.isEmpty ||
                                              dataGroup.isEmpty) {
                                            return ShowDialog()
                                                .loadingDialog(context);
                                          } else {
                                            return assignTaskDialog(
                                                context,
                                                widget.taskModel.id!,
                                                widget.taskModel.title!,
                                                widget.taskModel.location!);
                                          }
                                        },
                                        color: Colors.blue,
                                        widget: Icon(
                                          Icons.assignment,
                                          size: 20.sp,
                                        ),
                                      ),
                                    ),
                                    Tooltip(
                                      message: "Close",
                                      child: ActionButton(
                                        callback: () => closeTaskDialog(
                                            context, widget.taskModel.id!),
                                        color: Colors.grey,
                                        widget: Icon(
                                          Icons.close,
                                          size: 20.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                      Container(
                        alignment: Alignment.center,
                        width: 200.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              countryCode == const Locale("en")
                                  ? DateFormat("dd-MM-yy, hh:mm a")
                                      .format(widget.taskModel.time!.toLocal())
                                  : DateFormat("dd-MM-yy, HH:mm")
                                      .format(widget.taskModel.time!.toLocal()),
                              style: GoogleFonts.sarabun(
                                  fontSize: 15.w,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blue),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              remainingDateTime(
                                  context, widget.taskModel.time!),
                              style: GoogleFonts.sarabun(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.callback,
    required this.widget,
    required this.color,
  }) : super(key: key);

  final VoidCallback callback;
  final Widget widget;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 65.w,
      height: 30.h,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(foregroundColor: color),
          onPressed: callback,
          child: widget),
    );
  }
}
