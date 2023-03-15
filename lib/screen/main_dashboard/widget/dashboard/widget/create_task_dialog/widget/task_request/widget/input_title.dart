import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../reusable_widget/example_auto_complete.dart';
import '../../../../../../../../../reusable_widget/texfield.dart';
import '../../../../../../../controller_main_dashboard.dart';
import '../../../controller/controller_create_task.dart';

class InputTitle extends StatelessWidget {
  const InputTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final valueMain = context.watch<MainDashboardController>();
    final createCtrl = context.watch<CreateController>();
    return Autocomplete<String>(
      optionsViewBuilder: (context, onSelected, options) => AutocompleteOptions(
          displayStringForOption: (option) => option.toString(),
          onSelected: onSelected,
          options: options,
          maxOptionsHeight: 300.h),
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        return TexfieldWidget(
          hintText: "Search title...",
          fontHeight: 18.h,
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          bgCOlor: Colors.white,
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return valueMain.deptDetail!.title!.where((String option) {
          return option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        createCtrl.selectingLocationAndTitle(title: selection);
        // print(selection);
      },
    );
  }
}
