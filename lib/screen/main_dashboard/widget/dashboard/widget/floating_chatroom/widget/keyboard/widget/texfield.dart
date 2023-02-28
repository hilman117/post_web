import 'package:flutter/material.dart';
import 'package:post_web/other.dart';

class TextFieldArea extends StatelessWidget {
  const TextFieldArea({
    Key? key,
    required this.p1,
  }) : super(key: key);
  final BoxConstraints p1;

  @override
  Widget build(BuildContext context) {
    final text = TextEditingController();
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: mainColor.withOpacity(0.1)),
        height: p1.maxWidth * 0.1,
        child: TextFormField(
          controller: text,
          cursorColor: mainColor,
          cursorWidth: 1,
          textAlignVertical: TextAlignVertical.center,
          cursorHeight: p1.maxWidth * 0.035,
          onChanged: (value) {},
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          minLines: 1,
          maxLines: 5,
          style: TextStyle(
              fontSize: p1.maxWidth * 0.035, overflow: TextOverflow.clip),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.transparent)),
            isDense: true,
            hintText: "Type here...",
            hintStyle: TextStyle(fontSize: p1.maxWidth * 0.035),
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_alt_rounded,
                color: mainColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
