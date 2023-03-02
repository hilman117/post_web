import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/reusable_widget/item_list.dart';
import 'package:post_web/reusable_widget/pop_up_mac.dart';
import 'package:post_web/models/departement.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/controller_dashboard.dart';
import 'package:provider/provider.dart';

showDepartementOption(BuildContext context) {
  var data = Provider.of<List<Departement>>(context, listen: false);
  final controller = Provider.of<DashboardController>(context, listen: false);
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) => AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Consumer<DashboardController>(
        builder: (context, value, child) => PopUpMac(
            maxHeight: 300.h,
            listItem: List.generate(data.length, (index) {
              Departement departement = data[index];
              if (departement.isActive == true) {
                return InkWell(
                  onTap: () => controller.selectdepartement(
                      departement.departement!, index),
                  child: ItemList(
                      selectedIndex: value.selectedDepartement,
                      onEnterHover: (event) {
                        controller.selectIndex(hoverIndex: index);
                        controller.hoveringList(true);
                      },
                      onExitHover: (event) => controller.hoveringList(false),
                      valueController: value,
                      index: index,
                      items: departement.departement!),
                );
              }
              return const SizedBox();
            })),
      ),
    ),
  );
}
