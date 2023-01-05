
import 'package:get/get.dart';
import 'package:post_web/models/user.dart';

class CUser extends GetxController {
  final Rx<UserDetails> _data = UserDetails().obs;
  UserDetails get data => _data.value;
  void setData(UserDetails n) => _data.value = n;
}

