import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/const.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/floating_chatroom.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/selected_image.dart';
import 'package:provider/provider.dart';
import 'widget/appbar/appbar_dashboard.dart';
import 'widget/dashboard/widget/create_task_dialog/create_task_dialog.dart';

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
    //this is tabcontroller for craete task page
    TabController _tabController = TabController(length: 2, vsync: this);
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: AnimatedSwitcher(
            switchInCurve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 500),
            child: FloatingActionButton(
              backgroundColor: mainColor2,
              onPressed: () => createDialog(context, _tabController),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
          // drawer: Drawer(
          //   width: size.width * 0.17,
          //   child: const CustomDrawerDashboard(),
          // ),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(size.height * 0.09),
              child: const AppbarDashboard()),
          body: Consumer<MainDashboardController>(
              builder: (context, value, child) =>
                  value.pages[value.menuSelected]),
        ),
        Consumer<DashboardController>(
            builder: (context, value, child) =>
                value.isChatroomOpen == true && value.taskModel != null
                    ? FloatingChatroom(taskModel: value.taskModel!)
                    : const SizedBox()),
        Consumer<ChatroomControlller>(
            builder: (context, value, child) => value.imageList.isNotEmpty
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
                : const SizedBox())
      ],
    );
  }
}
