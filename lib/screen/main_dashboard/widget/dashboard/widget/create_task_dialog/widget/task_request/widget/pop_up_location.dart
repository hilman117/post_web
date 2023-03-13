import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/firebase/firebase_location.dart';
import 'package:post_web/models/general_data.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/create_task_dialog/controller/controller_create_task.dart';
import 'package:post_web/style.dart';
import 'package:provider/provider.dart';

class PopUpLocation extends StatelessWidget {
  const PopUpLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final valueCreate = context.watch<CreateController>();
    return Material(
      child: LimitedBox(
        maxHeight: 300.h,
        child: Container(
          width: 320.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 0.5,
                  spreadRadius: 0.5,
                  offset: const Offset(0.5, 0.5))
            ],
          ),
          child: valueCreate.isPopUpLocation
              ? FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseLocation().getLocation(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text("No data found"),
                      );
                    }

                    GeneralData data =
                        GeneralData.fromJson(snapshot.data!.data()!);
                    data.location!.sort(
                      (a, b) {
                        return a.compareTo(b);
                      },
                    );
                    if (data.location!.isEmpty) {
                      return const Center(
                        child: Text("No data found"),
                      );
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount: data.location!.length,
                        itemBuilder: (context, index) {
                          var location = data.location![index];
                          if (valueCreate.searchingText == "") {
                            return ItemLocation(location: location);
                          }
                          if (location.toString().toLowerCase().contains(
                              valueCreate.searchingText.toLowerCase())) {
                            return ItemLocation(location: location);
                          }
                          return const SizedBox();
                        });
                  },
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}

class ItemLocation extends StatefulWidget {
  const ItemLocation({
    Key? key,
    required this.location,
  }) : super(key: key);

  final String location;

  @override
  State<ItemLocation> createState() => _ItemLocationState();
}

class _ItemLocationState extends State<ItemLocation> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
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
        height: 35.h,
        decoration: BoxDecoration(
            color: isHover ? Colors.grey.shade200 : Colors.transparent,
            border:
                Border(bottom: BorderSide(width: 0.5.w, color: Colors.grey))),
        padding: EdgeInsets.all(5.sp),
        child: Text(
          widget.location,
          style: style18Normal,
        ),
      ),
    );
  }
}
