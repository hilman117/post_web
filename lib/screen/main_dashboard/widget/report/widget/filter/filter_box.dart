import 'package:flutter/material.dart';
import 'package:post_web/other.dart';
import 'package:post_web/screen/main_dashboard/widget/report/controller_report.dart';
import 'package:provider/provider.dart';

class FilterBox extends StatelessWidget {
  const FilterBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Provider.of<ReportController>(context, listen: false);
    return Consumer<ReportController>(
        builder: (context, value, child) => CompositedTransformTarget(
              link: value.layerlink,
              child: Container(
                  height: size.height * 0.05,
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1.5)),
                  child: LayoutBuilder(
                    builder: (p0, p1) => Row(
                      children: [
                        Expanded(
                          child: Container(
                            // alignment: Alignment.centerLeft,
                            height: p1.maxHeight * 1,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Colors.grey.shade100,
                                        width: 1.5))),
                            child: TextFormField(
                              cursorWidth: 1,
                              cursorColor: mainColor,
                              cursorHeight: p1.maxWidth * 0.06,
                              style: TextStyle(fontSize: p1.maxWidth * 0.05),
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontStyle: FontStyle.italic,
                                      fontSize: p1.maxWidth * 0.05),
                                  focusColor: Colors.grey.shade300,
                                  border: InputBorder.none,
                                  prefixIconConstraints: const BoxConstraints(
                                      maxWidth: 20, minWidth: 20),
                                  prefixIcon: Icon(
                                    Icons.search_outlined,
                                    size: p1.maxWidth * 0.06,
                                  ),
                                  prefixIconColor: mainColor),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              controller.clickButton();
                              Future.delayed(
                                  const Duration(milliseconds: 100),
                                  () => controller.showFitlerOvrelay(
                                        context,
                                        true,
                                      ));
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              height: p1.maxHeight,
                              decoration: BoxDecoration(
                                boxShadow: value.isClick
                                    ? []
                                    : const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0.5, 0.5),
                                            blurRadius: 0.5,
                                            spreadRadius: 1),
                                        BoxShadow(
                                            color: Colors.white,
                                            offset: Offset(-1.0, -1.0),
                                            blurRadius: 0.5,
                                            spreadRadius: 1),
                                      ],
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.grey.shade200,
                                      Colors.grey.shade300,
                                    ]),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Filter",
                                    style: TextStyle(
                                        fontSize: p1.maxWidth * 0.05,
                                        color: Colors.grey),
                                  ),
                                  Opacity(
                                      opacity: 0.3,
                                      child: SizedBox(
                                          width: p1.maxWidth * 0.06,
                                          child:
                                              Image.asset("image/filter.png")))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ));
  }
}
