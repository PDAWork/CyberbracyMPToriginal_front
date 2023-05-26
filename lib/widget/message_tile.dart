import 'package:cyberbracy_mpt_original_front/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/const/images_url.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final bool sentByMe;
  final String message;
  final String sender;
  final String time;
  final String? imageUrl;
  MessageTile(
    this.message, {
    super.key,
    required this.sentByMe,
    this.imageUrl,
    required this.sender,
    required this.time,
  }) {
    if (!sentByMe && imageUrl != null) {
      throw FlutterError(
          '''To set a picture the sender must be the current user!

      MessageTile(
        sentByMe: true,
        imageUrl: 'image path',
      ),
      ''');
    }
  }

  @override
  Widget build(BuildContext context) {
    var timeTextStyle = TextStyle(color: ColorTheme.grey, fontSize: 12);

    var messageTextStyle =
        TextStyle(color: sentByMe ? Colors.black : Colors.white);

    return Column(
      crossAxisAlignment:
          sentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              sentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!sentByMe)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  ImagesUrl.chatBot,
                  height: 20,
                ),
              ),
            Flexible(
              child: Container(
                margin: sentByMe
                    ? const EdgeInsets.only(
                        left: 80,
                      )
                    : const EdgeInsets.only(
                        right: 80,
                      ),
                decoration: BoxDecoration(
                  color: sentByMe ? Colors.transparent : ColorTheme.red,
                  border: sentByMe
                      ? Border.all(color: ColorTheme.red)
                      : const Border(),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  message,
                  softWrap: true,
                  style: messageTextStyle,
                ),
              ),
            ),
            if (sentByMe)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: imageUrl != null
                    ? Image.asset(
                        imageUrl!,
                        height: 20,
                        width: 20,
                      )
                    : const Icon(
                        Icons.person,
                        size: 20,
                      ),
              ),
          ],
        ),
        Container(
          margin: sentByMe
              ? const EdgeInsets.only(right: 35, top: 8)
              : const EdgeInsets.only(left: 35, top: 8),
          child: Text(
            time,
            style: timeTextStyle,
          ),
        ),
      ],
    );
  }
}
