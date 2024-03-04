import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:post_web/const.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/row_title/widget/loading_widget.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/controller_settings.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/adding_dialog.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/confirm_dialog.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/dialog_create_department.dart';
import 'package:post_web/screen/main_dashboard/widget/setting/widget/dialog_create_user.dart';
import 'package:provider/provider.dart';
import '../../../../models/departement.dart';
import '../../../../models/user.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  static TextEditingController titleController = TextEditingController();
  static TextEditingController userController = TextEditingController();
  static TextEditingController locationController = TextEditingController();
  static TextEditingController newTitle = TextEditingController();
  static TextEditingController newLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var dataDepartement = Provider.of<List<Departement>>(context);
    var dataUser = Provider.of<List<UserDetails>>(context);
    final user = Get.put(CUser());
    final theme = Theme.of(context);
    final controller = Provider.of<SettingsController>(context, listen: false);
    return Consumer2<SettingsController, MainDashboardController>(
        builder: (context, value, value2, child) {
      // controller.changeDeptForLfStorage(value2.data!.deptToStoreLF!);
      return Stack(
        children: [
          Container(
            color: theme.scaffoldBackgroundColor,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 50.sp),
              children: [
                Text(
                  "Admin",
                  style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: theme.canvasColor),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ExpansionPanelList(
                  expandedHeaderPadding: const EdgeInsets.all(0),
                  expandIconColor: Colors.transparent,
                  expansionCallback: null,
                  elevation: 0,
                  dividerColor: Colors.transparent,
                  children: [
                    ExpansionPanel(
                        backgroundColor: Colors.transparent,
                        isExpanded: value.isPanelExpand,
                        headerBuilder: (context, isExpanded) {
                          return Wrap(
                              runSpacing: 15.sp,
                              spacing: 10.sp,
                              children: List.generate(dataDepartement.length,
                                  (index) {
                                Departement e = dataDepartement[index];
                                int colorDept = int.parse(e.color!);
                                return SizedBox(
                                  width: index == dataDepartement.length - 1
                                      ? 350.w
                                      : 270.w,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () => controller.expandPanel(e),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.r)),
                                          child: Container(
                                            padding: EdgeInsets.all(16.sp),
                                            width: 250.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                                color: Color(colorDept)
                                                    .withOpacity(0.5)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      e.departementIcon!,
                                                      height: 30.sp,
                                                      width: 30.sp,
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        e.departement!,
                                                        style: TextStyle(
                                                            fontSize: 20.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Title",
                                                      style: TextStyle(
                                                          fontSize: 20.sp,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                    Text(e.title!.length
                                                        .toString())
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Can receive a task?",
                                                      style: TextStyle(
                                                          fontSize: 20.sp,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                    Text(e.isActive.toString())
                                                  ],
                                                ),
                                                Builder(builder: (context) {
                                                  List<UserDetails> users = dataUser
                                                      .where((element) =>
                                                          element.department! ==
                                                              e.departement! &&
                                                          element.hotel ==
                                                              user.data.hotel &&
                                                          element.isActive ==
                                                              true)
                                                      .toList();
                                                  return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Icon(Icons.group,
                                                          size: 30.sp,
                                                          color: mainColor),
                                                      Text(users.length
                                                          .toString())
                                                    ],
                                                  );
                                                }),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (index == dataDepartement.length - 1)
                                        Tooltip(
                                          message: "Add Departement",
                                          child: IconButton(
                                              onPressed: () =>
                                                  createDepartmentDialog(
                                                      context),
                                              icon: const Icon(
                                                  CupertinoIcons.add)),
                                        )
                                    ],
                                  ),
                                );
                              }));
                        },
                        body: value.isPanelExpand
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    value.selectedDept!.departement == null
                                        ? ""
                                        : value.selectedDept!.departement!,
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Active to receive tasks?",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(
                                        width: 10.sp,
                                      ),
                                      Transform(
                                        transform: Matrix4.diagonal3Values(
                                            0.5, 0.5, 0.025),
                                        child: Switch(
                                          activeColor: Colors.green,
                                          value: value.isActive,
                                          onChanged: (newValue) =>
                                              controller.activateSwitch(
                                                  context, newValue),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.sp),
                                    child: Card(
                                      color: theme.cardColor,
                                      child: Padding(
                                        padding: EdgeInsets.all(15.sp),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15.sp),
                                              height: 500.h,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Title",
                                                        style: TextStyle(
                                                            fontSize: 25.sp),
                                                      ),
                                                      InkWell(
                                                        onTap: () => addingDialog(
                                                            context,
                                                            "New title...",
                                                            newTitle,
                                                            () => controller
                                                                .addNewTitle(
                                                                    context,
                                                                    newTitle),
                                                            value
                                                                .isLoadingLoadTitle),
                                                        child: Icon(
                                                          CupertinoIcons.add,
                                                          size: 30.sp,
                                                          color: mainColor,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  CupertinoSearchTextField(
                                                    style: TextStyle(
                                                        fontSize: 20.sp),
                                                    controller: titleController,
                                                    onChanged: (value) =>
                                                        controller
                                                            .searchingTitle(
                                                                value),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                    itemSize: 15.sp,
                                                    padding:
                                                        EdgeInsets.all(5.sp),
                                                    placeholderStyle: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey),
                                                  ),
                                                  Expanded(
                                                    child: ListView.builder(
                                                      itemCount: value
                                                          .selectedDept!
                                                          .title!
                                                          .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        String title = value
                                                            .selectedDept!
                                                            .title![index];
                                                        if (value.searchTitle
                                                                .isEmpty ||
                                                            title
                                                                .toString()
                                                                .toLowerCase()
                                                                .contains(value
                                                                    .searchTitle
                                                                    .toString()
                                                                    .toLowerCase())) {
                                                          return ListTile(
                                                            trailing: InkWell(
                                                              onTap: () =>
                                                                  confirmDialog(
                                                                context:
                                                                    context,
                                                                confirmText:
                                                                    'Are you sure want to delete "$title" from title?',
                                                                index: index,
                                                                onPressed: () =>
                                                                    controller
                                                                        .removeTitle(
                                                                  context:
                                                                      context,
                                                                  currentList: value
                                                                      .selectedDept!
                                                                      .title!,
                                                                  indexToRemove:
                                                                      index,
                                                                ),
                                                                isLoading: value
                                                                    .isLoadingLoadTitle,
                                                              ),
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .delete,
                                                                size: 30.sp,
                                                              ),
                                                            ),
                                                            dense: true,
                                                            minVerticalPadding:
                                                                0,
                                                            title: Text(
                                                              title,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      20.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                            ),
                                                          );
                                                        }
                                                        return const SizedBox();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                            Container(
                                              width: 1.sp,
                                              color: Colors.grey,
                                              height: 500.h,
                                            ),
                                            Expanded(
                                                child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15.sp),
                                              height: 500.h,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Users",
                                                        style: TextStyle(
                                                            fontSize: 25.sp),
                                                      ),
                                                      InkWell(
                                                        onTap: () =>
                                                            craeteUser(context),
                                                        child: Icon(
                                                          CupertinoIcons.add,
                                                          size: 30.sp,
                                                          color: mainColor,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  CupertinoSearchTextField(
                                                    style: TextStyle(
                                                        fontSize: 20.sp),
                                                    controller: userController,
                                                    onChanged: (value) =>
                                                        controller
                                                            .searchingUser(
                                                                value),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                    itemSize: 15.sp,
                                                    padding:
                                                        EdgeInsets.all(5.sp),
                                                    placeholderStyle: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey),
                                                  ),
                                                  Builder(builder: (context) {
                                                    List<UserDetails> userData = dataUser
                                                        .where((element) =>
                                                            element.hotel ==
                                                                user.data
                                                                    .hotel &&
                                                            element.department ==
                                                                value
                                                                    .selectedDept!
                                                                    .departement &&
                                                            element.isActive ==
                                                                true)
                                                        .toList();
                                                    return Expanded(
                                                      child: ListView.builder(
                                                        itemCount:
                                                            userData.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          UserDetails
                                                              userDetails =
                                                              userData[index];
                                                          if (value.searchUser
                                                                  .isEmpty ||
                                                              userDetails.name
                                                                  .toString()
                                                                  .toLowerCase()
                                                                  .contains(value
                                                                      .searchUser
                                                                      .toString()
                                                                      .toLowerCase())) {
                                                            return ListTile(
                                                              trailing: InkWell(
                                                                onTap: () =>
                                                                    confirmDialog(
                                                                  context:
                                                                      context,
                                                                  confirmText:
                                                                      'Are you sure want to remove ${userDetails.name} from the team?',
                                                                  index: index,
                                                                  isLoading: value
                                                                      .isLoadingLoadTitle,
                                                                  onPressed: () =>
                                                                      controller.deleteAccount(
                                                                          context,
                                                                          userDetails),
                                                                ),
                                                                child: Icon(
                                                                  CupertinoIcons
                                                                      .delete,
                                                                  size: 30.sp,
                                                                ),
                                                              ),
                                                              dense: true,
                                                              minVerticalPadding:
                                                                  0,
                                                              title: Text(
                                                                userDetails
                                                                    .name!,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                              ),
                                                            );
                                                          }
                                                          return const SizedBox();
                                                        },
                                                      ),
                                                    );
                                                  }),
                                                ],
                                              ),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox()),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.sp),
                  child: Card(
                    color: theme.cardColor,
                    child: Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.sp),
                            height: 500.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Location",
                                      style: TextStyle(fontSize: 25.sp),
                                    ),
                                    InkWell(
                                      onTap: () => addingDialog(
                                          context,
                                          "Add location...",
                                          newLocation,
                                          () => controller.addNewLocation(
                                              context, newLocation),
                                          value.isLoadingLoadLocation),
                                      child: Icon(
                                        CupertinoIcons.add,
                                        size: 30.sp,
                                        color: mainColor,
                                      ),
                                    )
                                  ],
                                ),
                                CupertinoSearchTextField(
                                  style: TextStyle(fontSize: 20.sp),
                                  controller: locationController,
                                  onChanged: (value) =>
                                      controller.searchingLocation(value),
                                  borderRadius: BorderRadius.circular(8.r),
                                  itemSize: 15.sp,
                                  padding: EdgeInsets.all(5.sp),
                                  placeholderStyle: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: value2.data!.location!.length,
                                    itemBuilder: (context, index) {
                                      String location =
                                          value2.data!.location![index];
                                      if (value.searchLocation.isEmpty ||
                                          location
                                              .toString()
                                              .toLowerCase()
                                              .contains(value.searchLocation
                                                  .toString()
                                                  .toLowerCase())) {
                                        return ListTile(
                                          trailing: InkWell(
                                            onTap: () => confirmDialog(
                                              context: context,
                                              confirmText:
                                                  'Are you sure want to delee "$location" from location?',
                                              index: index,
                                              isLoading: value.loadingLocation,
                                              onPressed: () =>
                                                  controller.removeLocation(
                                                      context: context,
                                                      currentList: value2
                                                          .data!.location!,
                                                      indexToRemove: index),
                                            ),
                                            child: Icon(
                                              CupertinoIcons.delete,
                                              size: 30.sp,
                                            ),
                                          ),
                                          dense: true,
                                          minVerticalPadding: 0,
                                          title: Text(
                                            location,
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Container(
                            width: 1.sp,
                            color: Colors.grey,
                            height: 500.h,
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.sp),
                            height: 500.h,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text("Lost and found storage"),
                                    SizedBox(
                                      width: 30.w,
                                    ),
                                    Builder(builder: (context) {
                                      List<Departement> activeDepartements =
                                          dataDepartement
                                              .where((element) =>
                                                  element.isActive == true)
                                              .toList();
                                      List<String> departementsString =
                                          activeDepartements
                                              .map((e) => e.departement!)
                                              .toList();
                                      return Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          width: 200.w,
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                            dropdownColor: theme.cardColor,
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.normal),
                                            focusColor: Colors.transparent,
                                            elevation: 1,
                                            value: value.deptForLf,
                                            items: departementsString
                                                .map((e) =>
                                                    DropdownMenuItem<String>(
                                                        value: e,
                                                        child: Text(
                                                          e,
                                                          style: TextStyle(
                                                              color: theme
                                                                  .canvasColor),
                                                        )))
                                                .toList(),
                                            onChanged: (dept) => controller
                                                .changeDeptForLfStorage(dept!),
                                          ),
                                        ),
                                      );
                                    }),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    AnimatedSwitcher(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        child: SizedBox(
                                          height: 40.h,
                                          width: 100.w,
                                          child: value.deptForLf !=
                                                  value2.data!.deptToStoreLF
                                              ? CupertinoButton(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  padding: EdgeInsets.all(2.sp),
                                                  color: mainColor,
                                                  onPressed: value.isSaved
                                                      ? null
                                                      : () => controller
                                                          .saveDeptForLf(
                                                              context),
                                                  child: value.isSaved
                                                      ? const Icon(
                                                          Icons.check,
                                                          color: Colors.green,
                                                        )
                                                      : Text(
                                                          "Save",
                                                          style: TextStyle(
                                                              fontSize: 20.sp,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                )
                                              : const SizedBox(),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: MouseRegion(
                                    onEnter: (event) =>
                                        controller.enteringImageBox(true),
                                    onExit: (event) =>
                                        controller.enteringImageBox(false),
                                    child: value2.data!.hotelImage!.isEmpty
                                        ? Container(
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            child: Stack(
                                              children: [
                                                const Text(
                                                    "Set image hotel / logo"),
                                                value.insEnterImageBox
                                                    ? InkWell(
                                                        onTap: () => controller
                                                            .selectHotelImage(
                                                                context),
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          color: Colors.black26,
                                                          child: Image.asset(
                                                            "images/image-editing.png",
                                                            height: 100.h,
                                                            width: 100.w,
                                                          ),
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                              ],
                                            ),
                                          )
                                        : Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(value2
                                                        .data!.hotelImage!))),
                                            child: value.insEnterImageBox
                                                ? InkWell(
                                                    onTap: () => controller
                                                        .selectHotelImage(
                                                            context),
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      color: Colors.black26,
                                                      child: Image.asset(
                                                        "images/image-editing.png",
                                                        height: 100.h,
                                                        width: 100.w,
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ),
                                  ),
                                ),
                                Text(
                                  "This image will be displayed on mobile app",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 40.w),
                //   height: 1200.h,
                //   child: StaggeredGrid.count(
                //     crossAxisCount: 4,
                //     mainAxisSpacing: 20.h,
                //     crossAxisSpacing: 20.w,
                //     children: [
                //       const StaggeredGridTile.count(
                //         crossAxisCellCount: 2,
                //         mainAxisCellCount: 1.3,
                //         child: AllDepartmentRegistered(),
                //       ),
                //       const StaggeredGridTile.count(
                //         crossAxisCellCount: 2,
                //         mainAxisCellCount: 1.3,
                //         child: EmployeeAccountList(),
                //       ),
                //       StaggeredGridTile.count(
                //         crossAxisCellCount: 2,
                //         mainAxisCellCount: 1.3,
                //         child: titleSettings(context),
                //       ),
                //       StaggeredGridTile.count(
                //         crossAxisCellCount: 2,
                //         mainAxisCellCount: 1.3,
                //         child: locationSection(context),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 70.h,
                ),
              ],
            ),
          ),
          if (dataUser.isEmpty && dataDepartement.isEmpty) loadingWidget()
        ],
      );
    });
  }
}
