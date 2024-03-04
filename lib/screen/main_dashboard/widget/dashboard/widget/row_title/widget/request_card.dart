// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:post_web/models/task.dart';
import 'package:post_web/const.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/close_task_dialog.dart';
import 'package:post_web/reusable_widget/reopen_button.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final theme = Theme.of(context);
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
                ? theme.hoverColor
                : theme.cardColor,
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
                        child: Text(widget.taskModel.sender!,
                            style: theme.textTheme.bodySmall),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 70.w,
                        child: Image.asset(
                          widget.taskModel.iconDepartement!,
                          width: 35.w,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 200.w,
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                          widget.taskModel.location!,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 200.w,
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(widget.taskModel.title!,
                            style: theme.textTheme.bodySmall),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 200.w,
                        // padding: EdgeInsets.only(right: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                widget.taskModel.description == ''
                                    ? "-"
                                    : widget.taskModel.description!,
                                style: theme.textTheme.bodySmall),
                            widget.taskModel.image!.isNotEmpty
                                ? Icon(
                                    Icons.image,
                                    size: 20.sp,
                                    color: Colors.grey,
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 150.w,
                        child: statusWidget(
                            context: context, status: widget.taskModel.status!),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 230.w,
                        padding: EdgeInsets.only(right: 3.w),
                        child: Text(
                            widget.taskModel.receiver != ""
                                ? widget.taskModel.receiver!
                                : "-",
                            style: theme.textTheme.bodySmall),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          width: 300.w,
                          child: widget.taskModel.status == "Close"
                              ? ReopenButton(idTask: widget.taskModel.id!)
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ActionButton(
                                        callback: () =>
                                            functionChatCtrl.accepTask(
                                                context, widget.taskModel.id!),
                                        color: Colors.green,
                                        widget: "Accept"),
                                    ActionButton(
                                        callback: () async {
                                          await functionChatCtrl.cleaList();
                                          if (dataTeam.isEmpty ||
                                              dataGroup.isEmpty) {
                                            return ShowDialog()
                                                .loadingDialog(context);
                                          } else {
                                            return assignTaskDialog(
                                                context, widget.taskModel);
                                          }
                                        },
                                        color: Colors.blue,
                                        widget: "Assign"),
                                    ActionButton(
                                        callback: () => closeTaskDialog(
                                            context, widget.taskModel),
                                        color: Colors.grey,
                                        widget: "Close"),
                                  ],
                                )),
                      Container(
                        alignment: Alignment.center,
                        width: 150.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            (widget.taskModel.setTime != "" ||
                                    widget.taskModel.setDate != "")
                                ? Text(
                                    widget.taskModel.setDate != ""
                                        ? "Due to ${widget.taskModel.setDate!} \n${widget.taskModel.setTime!}"
                                        : "Due to ${widget.taskModel.setTime!}",
                                    style: GoogleFonts.sarabun(
                                        fontSize: 15.w,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.red),
                                    overflow: TextOverflow.fade,
                                    textAlign: TextAlign.left,
                                  )
                                : Text(
                                    countryCode == const Locale("en")
                                        ? DateFormat("dd-MM-yy, hh:mm a")
                                            .format(widget.taskModel.time!
                                                .toLocal())
                                        : DateFormat("dd-MM-yy, HH:mm").format(
                                            widget.taskModel.time!.toLocal()),
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
  final String widget;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // alignment: Alignment.center,
        // width: 80.w,
        height: 40.h,
        child: TextButton(
            onPressed: callback,
            child: Text(
              widget,
              style: TextStyle(fontSize: 18.sp),
            )));
  }
}
