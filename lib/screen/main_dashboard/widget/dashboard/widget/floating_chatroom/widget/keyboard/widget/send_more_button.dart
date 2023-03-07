import 'package:flutter/material.dart';
import 'package:post_web/screen/main_dashboard/widget/dashboard/widget/floating_chatroom/controller_floating_chatroom.dart';
import 'package:provider/provider.dart';

class SendAndMoreButton extends StatelessWidget {
  const SendAndMoreButton({
    Key? key,
    required this.p1,
    required this.idTask,
    required this.commentText,
    required this.scrollController,
  }) : super(key: key);
  final BoxConstraints p1;
  final String idTask;
  final TextEditingController commentText;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<ChatroomControlller>(context, listen: false);
    return AnimatedSwitcher(
        duration: Duration.zero,
        switchOutCurve: Curves.easeOutSine,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: p1.maxWidth * 0.02),
            height: p1.maxWidth * 0.06,
            width: p1.maxWidth * 0.06,
            decoration: const BoxDecoration(),
            child: GestureDetector(
              onTap: () => ctrl.sendComment(
                  context, scrollController, idTask, commentText),
              child: Image.asset(
                'image/send1.png',
                width: p1.maxWidth * 0.06,
              ),
            )));
  }
}
