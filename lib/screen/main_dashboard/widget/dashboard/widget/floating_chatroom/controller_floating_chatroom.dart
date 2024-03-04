// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:post_web/const.dart';
import 'package:post_web/controller/c_user.dart';
import 'package:post_web/firebase/firebase_action_task.dart';
import 'package:post_web/reusable_widget/show_dialog.dart';

import '../../../../../../models/task.dart';

class ChatroomControlller with ChangeNotifier {
  var db = FirebaseActionTask();
  final user = Get.put(CUser());

  String currentStatus = "";
  newStatus(String newStatus) {
    currentStatus = newStatus;
    notifyListeners();
  }

  //[PICK IMAGE]
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

    print(selectedImages.first);
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

  //[ACCEPTTASK] function
  //firstly, check how many total request that this user have accept
  //So when this user click on accept button the total will increase
  int? _newTotalAccepted;
  int? get newTotalAccepted => _newTotalAccepted;
  addNewAcceptedTotal(BuildContext context, int addOne) {
    if (_newTotalAccepted == null) {
      _newTotalAccepted = user.data.acceptRequest! + addOne;
      db.addNewAcceptedTotal(_newTotalAccepted!);
      notifyListeners();
    } else {
      _newTotalAccepted = (newTotalAccepted! + addOne);
      db.addNewAcceptedTotal(_newTotalAccepted!);
      notifyListeners();
    }
  }

  bool isAcceptProgress = false;
  accepTask(BuildContext context, String idTask) async {
    try {
      isAcceptProgress = true;
      notifyListeners();
      await db.acceptTask(context, idTask);
      // ignore: use_build_context_synchronously
      addNewAcceptedTotal(context, 1);
      newStatus("Accepted");
      isAcceptProgress = false;
      notifyListeners();
    } catch (e) {
      isAcceptProgress = false;
      notifyListeners();
      print(e);
    }
  }
  //----------------------------------------------------------------

  //[CLOSETASK] function
  //firstly, check how many total request that this user have close
  //So when this user click on close button the total will increase
  int? newTotalClose;
  addNewCLoseTotal(BuildContext context, int addOne) {
    try {
      if (newTotalClose == null) {
        newTotalClose = user.data.closeRequest! + addOne;
        db.addNewCLoseTotal(newTotalClose!);
        notifyListeners();
      } else {
        newTotalClose = (newTotalClose! + addOne);
        db.addNewAcceptedTotal(newTotalAccepted!);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  String finishingTime(TaskModel task) {
    var timeCreate = task.time;
    var diffTime = DateTime.now().difference(timeCreate!);
    if (diffTime.inHours > 24) {
      return "${diffTime.inDays} day";
    } else if (diffTime.inDays > 1) {
      return "${diffTime.inDays} days";
    } else if (diffTime.inMinutes > 60) {
      int sisaMenit = diffTime.inMinutes % 60;
      return "${diffTime.inHours} hour $sisaMenit m";
    } else if (diffTime.inHours > 1) {
      int sisaMenit = diffTime.inMinutes % 60;
      return "${diffTime.inHours} hours $sisaMenit m";
    }
    return "${diffTime.inMinutes} mnt";
  }

  bool isCloseProgress = false;
  closeTask(BuildContext context, TaskModel task,
      TextEditingController commentBody) async {
    try {
      isCloseProgress = true;
      await db.closeTask(context, task.id!, commentBody, finishingTime(task));
      // ignore: use_build_context_synchronously
      addNewCLoseTotal(context, 1);
      newStatus("Close");
      isCloseProgress = false;
      notifyListeners();
    } catch (e) {
      isCloseProgress = false;
      print(e);
    }
  }
  //----------------------------------------------------------------

  //[HOLDTASK] function
  bool isHoldProgress = false;
  holdTask(BuildContext context, String idTask) async {
    try {
      isHoldProgress = true;
      notifyListeners();
      await db.holdTask(context, idTask);
      newStatus("Hold");
      isHoldProgress = false;
      notifyListeners();
    } catch (e) {
      isHoldProgress = false;
      notifyListeners();
      print(e);
    }
  }
//--------------------------------------------------------------------

  //[RESUMETASK] function
  bool isResumeProgress = false;
  resumeTask(BuildContext context, String idTask) async {
    try {
      isHoldProgress = true;
      notifyListeners();
      await db.resumeTask(context, idTask);
      newStatus("Resume");
      isResumeProgress = false;
      notifyListeners();
    } catch (e) {
      isResumeProgress = false;
      notifyListeners();
      print(e);
    }
  }
//--------------------------------------------------------------------

//[REOPENTASK] function
  bool isReopenProgress = false;
  reopenTask(BuildContext context, String idTask) async {
    try {
      isAssignProgress = true;
      notifyListeners();
      await db.reopenTask(context, idTask);
      newStatus("Reopen");
      isAssignProgress = false;
      notifyListeners();
    } catch (e) {
      isAssignProgress = false;
      notifyListeners();
      print(e);
    }
  }
//---------------------------------------------------------------------

  //send comment function
  bool loadingImages = false;
  void loadimage(bool newValue) {
    loadingImages = newValue;
    notifyListeners();
  }

  //check if user start typing or not
  String textToSend = "";
  typingTextToSend(String newText) {
    textToSend = newText;
    notifyListeners();
  }

  bool isSendCommentProgress = false;
  sendComment(BuildContext context, String idTask,
      TextEditingController commentBody) async {
    imageUrl.clear();
    notifyListeners();
    try {
      if (imageList.isNotEmpty) {
        isSendCommentProgress = true;
        notifyListeners();
        imageList.forEach((imageToUpload) async {
          String imageExtension = imageName.split('.').last;
          loadimage(true);

          firebase_storage.Reference ref =
              FirebaseStorage.instanceFor(bucket: bucketStorage).ref(
                  "${user.data.hotelid}/${user.data.uid} + ${DateTime.now().toString()}.$imageExtension");
          final metadata =
              firebase_storage.SettableMetadata(contentType: "image/jpeg");
          firebase_storage.UploadTask uploadImages =
              ref.putData(imageToUpload, metadata);
          await uploadImages.whenComplete(() => null);
          await ref.getDownloadURL().then((value) async {
            imageUrl.add(value);
            notifyListeners();

            // print("ini image list sebelum di upload ${imageList.length}");
            // print(
            //     "ini image list stelah di upload di upload ${imageUrl.length}");

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
        isSendCommentProgress = false;
        notifyListeners();
      } else {
        isSendCommentProgress = true;
        notifyListeners();
        await db.sendComment(
            context: context,
            idTask: idTask,
            commentBody: commentBody.text,
            imageUrl: []);
        isSendCommentProgress = false;
        notifyListeners();
      }

      commentBody.clear();
      textToSend = "";
      notifyListeners();
    } catch (e) {
      // ignore: use_build_context_synchronously
      ShowDialog().errorDialog(context, "Something went wong!");
      isSendCommentProgress = false;
      notifyListeners();
      print(e);
    }
  }
  //--------------------------------------------------------------

  //function to select person or group to assign the request
  String searchText = "";
  searchingOnAssignDialog(String searchingTex) {
    searchText = searchingTex;
    notifyListeners();
  }

  List<String> assignTo = [];
  inputAssignTask(String selectedPersonOrDepartement) {
    assignTo.add(selectedPersonOrDepartement);
    notifyListeners();
  }

  removeAssignTask(String unSelectedPersonOrDepartement) {
    assignTo.remove(unSelectedPersonOrDepartement);
    notifyListeners();
  }

  cleaList() {
    assignTo.clear();
    searchText = "";
    notifyListeners();
  }

  bool isAssignProgress = false;
  assignTask(
      BuildContext context, String idTask, TextEditingController search) async {
    try {
      isAssignProgress = true;
      notifyListeners();
      await db.assignTask(context, idTask, assignTo);
      newStatus("Assigned");
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      cleaList();
      search.clear();
      searchText = "";
      isAssignProgress = false;
      notifyListeners();
    } catch (e) {
      isAssignProgress = false;
      notifyListeners();
      print(e);
    }
  }

//method that user for display status of download
  bool isDownloading = false;
  OverlayState? overlay;
  OverlayEntry? entry;
  showDownLoadResult({required BuildContext context, String? resultText}) {
    if (entry == null) {
      overlay = Overlay.of(context);
      entry = OverlayEntry(
          builder: (context) => AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: isDownloading ? 1.0 : 0.0,
                child: Container(
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black54),
                  child: Text(
                    resultText!,
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ),
              ));
      overlay?.insert(entry!);
      notifyListeners();
    }
  }

  //[download image function, called in image preview page]
  void saveNetworkImage(BuildContext context) async {
    isDownloading = true;
    notifyListeners();
    print("----------------------");
    print("save network image");
    final temDir = await getTemporaryDirectory();
    final path = '${temDir.path}/myfile.jpg';
    // await Dio().download(url, path);
    final respon = await http.get(Uri.parse(currentImage));
    final bytes = respon.bodyBytes;
    File(path).writeAsBytesSync(bytes);
    var result = await GallerySaver.saveImage(path, albumName: "POST");
    isDownloading = false;
    notifyListeners();
    print("Hasil: $result");
    if (result == true) {
      // ignore: use_build_context_synchronously
      showDownLoadResult(context: context, resultText: "Image saved success!");
    }
  }

  String currentImage = "";
  getCurrentImageUrl(String image) {
    currentImage = image;
    print(currentImage);
    // notifyListeners();
  }

  Future<void> downloadImage() async {
    if (currentImage != "") {
      await WebImageDownloader.downloadImageFromWeb(currentImage);
    }
  }
}
