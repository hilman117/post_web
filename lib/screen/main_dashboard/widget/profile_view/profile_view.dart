import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:post_web/const.dart';
import 'package:post_web/reusable_widget/photo_profile_file.dart';
import 'package:post_web/screen/main_dashboard/controller_main_dashboard.dart';

import 'package:post_web/reusable_widget/photo_profile_network.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key, required this.p1}) : super(key: key);
  final BoxConstraints p1;

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<MainDashboardController>();
    final function =
        Provider.of<MainDashboardController>(context, listen: false);
    return Material(
      borderRadius: BorderRadius.circular(10),
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          height: p1.maxHeight * 8,
          width: p1.maxWidth * 0.2,
          child: LayoutBuilder(
            builder: (p0, p2) => Padding(
              padding: EdgeInsets.symmetric(
                  vertical: p2.maxWidth * 0.1, horizontal: p2.maxWidth * 0.04),
              child: ctrl.isProfileViewOpen
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: p2.maxWidth,
                          child: Column(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(bottom: p2.maxWidth * 0.05),
                                child: Stack(children: [
                                  InkWell(
                                    onTap: () => function.selectImage(),
                                    child: ctrl.imageToUpload != null
                                        ? PhotoProfileFile(
                                            lebar: p2.maxWidth * 0.2,
                                            tinggi: p2.maxWidth * 0.2,
                                            radius: p2.maxWidth * 0.2,
                                            fileImage: ctrl.imageToUpload!)
                                        : PhotoProfileNetWork(
                                            lebar: p2.maxWidth * 0.2,
                                            tinggi: p2.maxWidth * 0.2,
                                            radius: p2.maxWidth * 0.2,
                                            urlImage: ctrl
                                                .userDetails!.profileImage!),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: p2.maxWidth * 0.020,
                                    child: ctrl.selectedImages != null
                                        ? Tooltip(
                                            message: "Save",
                                            child: InkWell(
                                              onTap: () async {
                                                await function.uploadImage();
                                                function.updateSettingProfile();
                                              },
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: p2.maxWidth * 0.04,
                                                child: Icon(
                                                  Icons.save_alt_outlined,
                                                  color: mainColor,
                                                  size: p2.maxWidth * 0.04,
                                                ),
                                              ),
                                            ),
                                          )
                                        : CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: p2.maxWidth * 0.04,
                                            child: Icon(
                                              Icons.camera_alt_outlined,
                                              color: mainColor,
                                              size: p2.maxWidth * 0.04,
                                            ),
                                          ),
                                  ),
                                ]),
                              ),
                              Text(
                                ctrl.userDetails!.name!,
                                style: TextStyle(
                                    fontSize: p2.maxWidth * 0.05,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ctrl.userDetails!.position!,
                                style: TextStyle(fontSize: p2.maxWidth * 0.045),
                              ),
                              Text(
                                ctrl.userDetails!.email!,
                                style: TextStyle(fontSize: p2.maxWidth * 0.04),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: p2.maxHeight * 0.02,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: p2.maxWidth * 0.02),
                          width: p2.maxWidth,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.symmetric(
                                    vertical: p2.maxWidth * 0.007),
                                width: p2.maxWidth * 0.7,
                                child: Text(
                                  "On duty?",
                                  style:
                                      TextStyle(fontSize: p2.maxWidth * 0.04),
                                ),
                              ),
                              SizedBox(
                                // padding: EdgeInsets.all(p2.maxWidth * 0.02),
                                width: p2.maxWidth * 0.20,
                                // height: ,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Transform.scale(
                                    scale: 0.8,
                                    child: Switch.adaptive(
                                      value: ctrl.userDetails!.isOnDuty!,
                                      onChanged: (value) => function
                                          .updateSettingProfile(onDuty: value),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: p2.maxWidth * 0.02),
                          width: p2.maxWidth,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.symmetric(
                                    vertical: p2.maxWidth * 0.007),
                                width: p2.maxWidth * 0.7,
                                child: Text(
                                  "Do you want to accept notification when your request are accepted?",
                                  style:
                                      TextStyle(fontSize: p2.maxWidth * 0.04),
                                ),
                              ),
                              SizedBox(
                                // padding: EdgeInsets.all(p2.maxWidth * 0.02),
                                width: p2.maxWidth * 0.20,
                                // height: ,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Transform.scale(
                                    scale: 0.8,
                                    child: Switch.adaptive(
                                      value: ctrl.userDetails!
                                          .receiveNotifWhenAccepted!,
                                      onChanged: (value) =>
                                          function.updateSettingProfile(
                                              notifReceived: value),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: p2.maxWidth * 0.02),
                          width: p2.maxWidth,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.symmetric(
                                    vertical: p2.maxWidth * 0.007),
                                width: p2.maxWidth * 0.7,
                                child: Text(
                                  "Do you want to accept notification when your request are close?",
                                  style:
                                      TextStyle(fontSize: p2.maxWidth * 0.04),
                                ),
                              ),
                              SizedBox(
                                // padding: EdgeInsets.all(p2.maxWidth * 0.02),
                                width: p2.maxWidth * 0.20,
                                // height: ,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Transform.scale(
                                    scale: 0.8,
                                    child: Switch.adaptive(
                                      value: ctrl
                                          .userDetails!.receiveNotifWhenClose!,
                                      onChanged: (value) =>
                                          function.updateSettingProfile(
                                              notifClose: value),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: p2.maxWidth * 0.02),
                          width: p2.maxWidth,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.symmetric(
                                    vertical: p2.maxWidth * 0.007),
                                width: p2.maxWidth * 0.7,
                                child: Text(
                                  "Do you want to send notification when you update a chat?",
                                  style:
                                      TextStyle(fontSize: p2.maxWidth * 0.04),
                                ),
                              ),
                              SizedBox(
                                // padding: EdgeInsets.all(p2.maxWidth * 0.02),
                                width: p2.maxWidth * 0.20,
                                // height: ,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Transform.scale(
                                    scale: 0.8,
                                    child: Switch.adaptive(
                                      value: ctrl.userDetails!.sendChatNotif!,
                                      onChanged: (value) =>
                                          function.updateSettingProfile(
                                              sendChatNotif: value),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: p2.maxWidth * 0.02),
                            width: p2.maxWidth * 0.85,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.symmetric(
                                      vertical: p2.maxWidth * 0.007),
                                  width: p2.maxWidth * 0.7,
                                  child: Text(
                                    "Change password",
                                    style:
                                        TextStyle(fontSize: p2.maxWidth * 0.04),
                                  ),
                                ),
                                SizedBox(
                                  width: p2.maxWidth * 0.065,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: mainColor,
                                    size: p2.maxWidth * 0.08,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: p2.maxWidth * 0.02),
                            width: p2.maxWidth * 0.85,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.symmetric(
                                      vertical: p2.maxWidth * 0.007),
                                  width: p2.maxWidth * 0.7,
                                  child: Text(
                                    "Language",
                                    style: TextStyle(
                                        fontSize: p2.maxWidth * 0.035),
                                  ),
                                ),
                                Flag.fromString(
                                  "id",
                                  width: p2.maxWidth * 0.05,
                                  height: p2.maxHeight * 0.03,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      width: p2.maxWidth * 0.5,
                      child: const LinearProgressIndicator()),
            ),
          )),
    );
  }
}
