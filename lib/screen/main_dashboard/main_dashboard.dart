import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/floating_chatroom.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/row_title/widget/loading_widget.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/selected_image.dart';
import 'package:provider/provider.dart';
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
  @override
  void initState() {
    Provider.of<MainDashboardController>(context, listen: false)
        .getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var requestData = Provider.of<List<TaskModel>>(context, listen: false);
    var mainCtrl = context.watch<MainDashboardController>();
    var dashboarCtrl = context.watch<DashboardController>();
    var chatCtrl = context.watch<ChatroomControlller>();
    return Stack(
      children: [
        Scaffold(
            backgroundColor: Colors.white,
            floatingActionButton: const FABWidget(),
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(size.height * 0.09),
                child: const AppbarDashboard()),
            body: mainCtrl.pages[mainCtrl.menuSelected]),
        dashboarCtrl.isChatroomOpen == true && dashboarCtrl.taskModel != null
            ? FloatingChatroom(taskModel: dashboarCtrl.taskModel!)
            : const SizedBox(),
        chatCtrl.imageList.isNotEmpty
            ? Column(
                children: [
                  const Expanded(child: SizedBox()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SelectedImage(),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  )
                ],
              )
            : const SizedBox(),
        if (requestData.isEmpty && mainCtrl.userDetails == null)
          const LoadingWidget()
      ],
    );
  }
}
