import 'package:get/get.dart';

class CAccepted extends GetxController {
  final RxString _data = "".obs;
  String get data => _data.value;
  void setData(String n) => _data.value = n;
  final RxString _sender = "".obs;
  String get sender => _sender.value;
  void setSender(String n) => _sender.value = n;
  final RxString _schedule = "".obs;
  String get schedule => _schedule.value;
  void setSchedule(String n) => _schedule.value = n;
}
