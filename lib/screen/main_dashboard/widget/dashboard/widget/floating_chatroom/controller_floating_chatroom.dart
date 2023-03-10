import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/firebase/firebase_action_task.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';

class ChatroomControlller with ChangeNotifier {
  var db = FirebaseActionTask();
  final user = Get.put(CUser());
  //funtion pick image
  String imageName = '';
  final ImagePicker _picker = ImagePicker();
  List<Uint8List> imageList = [];
  List<String> imageUrl = [];
  Future<void> selectImage() async {
    List<XFile?> selectedImages =
        await _picker.pickMultiImage(imageQuality: 30);
    if (selectedImages.isNotEmpty) {
      for (var element in selectedImages) {
        imageList.add(await XFile(element!.path).readAsBytes());
        notifyListeners();
      }
    }
    // ignore: avoid_print
    print(imageList.length);
  }

  void removeSingleImage(int index) {
    imageList.removeAt(index);
    imageName = '';
    notifyListeners();
  }

  void clearImage() {
    imageList.clear();
    notifyListeners();
  }
  //-----------------------------------------------------------------

  //send comment function
  bool loadingImages = false;
  void loadimage(bool newValue) {
    loadingImages = newValue;
    notifyListeners();
  }

  String currentStatus = "";
  newStatus(String newStatus) {
    currentStatus = newStatus;
    notifyListeners();
  }

  sendComment(BuildContext context, ScrollController scrollController,
      String idTask, TextEditingController commentBody) async {
    imageUrl.clear();
    notifyListeners();
    try {
      if (imageList.isNotEmpty) {
        imageList.forEach((imageToUpload) async {
          String imageExtension = imageName.split('.').last;
          loadimage(true);
          final ref = FirebaseStorage.instance.ref(
              "${user.data.hotelid}/${user.data.uid} + ${DateTime.now().toString()}.$imageExtension");
          await ref.putString(imageToUpload.toString());
          await ref.getDownloadURL().then((value) async {
            imageUrl.add(value);
            notifyListeners();
            // ignore: avoid_print
            // print("ini image list sebelum di upload ${imageList.length}");
            // print(
            //     "ini image list stelah di upload di upload ${imageUrl.length}");
            // ignore: avoid_print
            print("$imageUrl");
            if (imageUrl.length == imageList.length) {
              imageList.clear();
              await db.sendComment(
                  context: context,
                  idTask: idTask,
                  commentBody: commentBody.text,
                  imageUrl: imageUrl);
            }
          });
        });
      } else {
        await db.sendComment(
            context: context,
            idTask: idTask,
            commentBody: commentBody.text,
            imageUrl: []);
      }

      // commentBody.clear();
    } catch (e) {
      ShowDialog().errorDialog(context, "Something went wong!");
      // ignore: avoid_print
      print(e);
    }
  }

  closeTask() {}
}
