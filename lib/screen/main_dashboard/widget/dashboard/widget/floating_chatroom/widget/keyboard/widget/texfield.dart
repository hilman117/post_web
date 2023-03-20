// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:post_web/const.dart';
// import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
// import 'package:provider/provider.dart';

// import '../../../../../../../../../reusable_widget/texfield.dart';

// class TextFieldArea extends StatelessWidget {
//   const TextFieldArea({
//     Key? key,
//     required this.commentText,
//     required this.onChanged,
//   }) : super(key: key);

//   final TextEditingController commentText;
//   final void Function(String) onChanged;

//   @override
//   Widget build(BuildContext context) {
//     final ctrl = Provider.of<ChatroomControlller>(context, listen: false);
//     return Expanded(
//       child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: mainColor.withOpacity(0.1)),
//           height: 40.h,
//           child: TexfieldWidget(
//             bgCOlor: Colors.white,
//             fontHeight: 18.h,
//             controller: commentText,
//             searchFunction: (value) => ctrl.typingTextToSend(value),
//           )
//           // TextFormField(
//           //   controller: commentText,
//           //   onChanged: onChanged,
//           //   cursorColor: mainColor,
//           //   cursorWidth: 1,
//           //   textAlignVertical: TextAlignVertical.center,
//           //   cursorHeight: 20.h,
//           //   autofocus: true,
//           //   keyboardType: TextInputType.multiline,
//           //   textInputAction: TextInputAction.newline,
//           //   minLines: 1,
//           //   maxLines: 5,
//           //   style: TextStyle(fontSize: 20.sp, overflow: TextOverflow.clip),
//           //   decoration: InputDecoration(
//           //     border: OutlineInputBorder(
//           //         borderRadius: BorderRadius.circular(4),
//           //         borderSide:
//           //             const BorderSide(color: Colors.transparent, width: 0)),
//           //     focusedBorder: OutlineInputBorder(
//           //         borderRadius: BorderRadius.circular(4),
//           //         borderSide: const BorderSide(color: Colors.transparent)),
//           //     enabledBorder: OutlineInputBorder(
//           //         borderRadius: BorderRadius.circular(4),
//           //         borderSide: const BorderSide(color: Colors.transparent)),
//           //     isDense: true,
//           //     hintText: "Type here...",
//           //     hintStyle: TextStyle(fontSize: 20.sp),
//           //     contentPadding: const EdgeInsets.symmetric(vertical: 0),
//           //     prefixIcon: IconButton(
//           //       onPressed: () => ctrl.selectImage(),
//           //       icon: const Icon(
//           //         Icons.camera_alt_rounded,
//           //         color: mainColor2,
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           ),
//     );
//   }
// }
