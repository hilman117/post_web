import 'package:flutter/material.dart';
import 'package:post_web/screen/landing_page/controller/home_section_controller.dart';
import 'package:post_web/screen/landing_page/widget/phone/phone_home_section/widget/feature_phone/feature_phone.dart';
import 'package:post_web/screen/landing_page/widget/phone/phone_home_section/widget/home_section_tablet/tab_home_section.dart';
import 'package:post_web/screen/landing_page/widget/phone/phone_home_section/widget/phone_benefit_to_hotel/phone_benefit_to_hotel.dart';
import 'package:provider/provider.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  late ScrollController scrollController;
  double pixels = 0.0;
  List<int> scrollExperience = [];

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      setState(() {
        pixels = scrollController.position.pixels;
        scrollExperience.addAll([pixels.toInt()]);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(pixels.toInt());
    final controller =
        Provider.of<HomeSectionController>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Consumer<HomeSectionController>(
      builder: (context, value, child) => ListView(
        controller: scrollController,
        children: [
          const PhoneHomeSection(),
          PhoneFeatures(pixels: pixels.toInt()),
          PhoneBenefitToHotel(pixels: pixels.toInt())
        ],
      ),
    );
  }
}
