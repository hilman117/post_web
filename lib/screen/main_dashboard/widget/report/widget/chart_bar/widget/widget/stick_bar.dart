import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../../../../models/departement.dart';
import 'box_bar_widget.dart';

Widget stickBar({required List<Departement> data}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: List.generate(data.length, (index) {
      var totalRequest = (1 + Random().nextInt(100));
      int color = int.parse(data[index].color!);
      return boxBarWidget(
        index: index,
        colors: Color(color),
        deptName: data[index].departement!,
        totalRequest: totalRequest,
        value: totalRequest,
      );
    }),
  );
}
