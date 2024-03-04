import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/notif.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/floating_chatroom.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/selected_image.dart';
import 'package:provider/provider.dart';
import '../../models/departement.dart';
import '../../models/task.dart';
import 'widget/appbar/appbar_dashboard.dart';
import 'widget/fab_widget.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard>
    with TickerProviderStateMixin {
  final user = Get.put(CUser());
  final OverlayPortalController createTaskPortal = OverlayPortalController();

  @override
  void initState() {
    // FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {
      Notif().showForgroundNotification(context, message);
    });
    Provider.of<MainDashboardController>(context, listen: false)
        .getProfileData();
    Provider.of<MainDashboardController>(context, listen: false).generalData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var requestData = Provider.of<List<TaskModel>>(context);
    // var mainCtrl = context.watch<MainDashboardController>();
    var dashboarCtrl = Provider.of<DashboardController>(context, listen: false);
    var chatCtrl = context.watch<ChatroomControlller>();
    if (requestData.isNotEmpty) {
      requestData.sort((a, b) => b.time!.compareTo(a.time!));
    }
    var data = Provider.of<List<Departement>>(context);
    var activeDepartement =
        data.where((element) => element.isActive == true).toList();
    return Consumer2<MainDashboardController, DashboardController>(
        builder: (context, value, value2, child) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () => dashboarCtrl.hideChatroom(),
            child: Scaffold(
                backgroundColor: const Color(0xffE8EEF8),
                floatingActionButton: const FABWidget(),
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(size.height * 0.09),
                    child: appbarDashboard(context)),
                body: value.pagesSelected(
                    context,
                    value2.statusSelected == 1
                        ? value2.historyTask
                        : requestData,
                    activeDepartement)),
          ),
          dashboarCtrl.isChatroomOpen == true && dashboarCtrl.taskModel != null
              ? FloatingChatroom(taskModel: dashboarCtrl.taskModel!)
              : const SizedBox(),
          chatCtrl.imageList.isNotEmpty
              ? Column(
                  children: [
                    const Expanded(child: SizedBox()),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 50.w),
                          child: selectedImage(context),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    )
                  ],
                )
              : const SizedBox(),
        ],
      );
    });
  }
}
