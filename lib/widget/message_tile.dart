import 'package:cyberbracy_mpt_original_front/core/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/core/const/images_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageTile extends StatelessWidget {
  final bool sentByMe;
  final String message;
  final String sender;
  final String time;
  final String? imageUrl;
  final bool isCanceled;
  final bool isButton;
  final bool hasTable;

  MessageTile(
    this.message, {
    super.key,
    required this.sentByMe,
    this.imageUrl,
    required this.sender,
    required this.time,
    this.isCanceled = false,
    this.isButton = false,
    this.hasTable = false,
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
    var headlineTextStyle = TextStyle(
      color: sentByMe ? Colors.black : Colors.white,
    );

    const borderRadius = BorderRadius.all(Radius.circular(10));

    final botColor = [const Color(0xFFE13925), const Color(0xFFFF7D60)];

    final userColor = [Colors.transparent, Colors.transparent];
    // final List<(String?, SpawnedWidgetElement)> listWidgets = [];

    // // if (!sentByMe) {
    // //   listWidgets.addAll(HtmlMessageParse.parseMessage(message));
    // // }

    return Column(
      crossAxisAlignment:
          sentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
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
            if (sentByMe && isCanceled)
              Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Icon(
                      Icons.close,
                      size: 15,
                      color: ColorTheme.darkRed,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                ],
              ),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width *
                      (hasTable ? 0.85 : 0.6),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: sentByMe ? Colors.transparent : ColorTheme.red,
                    gradient: LinearGradient(
                      colors: sentByMe ? userColor : botColor,
                    ),
                    border: sentByMe
                        ? Border.all(color: ColorTheme.red)
                        : const Border(),
                    borderRadius: borderRadius,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: MarkdownBody(
                    onTapLink: (text, href, title) {
                      if (href != null) {
                        launchUrl(
                          Uri.parse(text),
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                    styleSheet: MarkdownStyleSheet(
                      horizontalRuleDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: borderRadius,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      a: TextStyle(
                        background: Paint()
                          ..color = ColorTheme.lightRed.withOpacity(.95),
                        color: ColorTheme.darkRed,
                      ),
                      p: messageTextStyle,
                      h1: headlineTextStyle,
                      h2: headlineTextStyle,
                      h3: headlineTextStyle,
                      h4: headlineTextStyle,
                      h5: headlineTextStyle,
                      h6: headlineTextStyle,
                      tableBody: const TextStyle(
                        color: Colors.white,
                      ),
                      tableBorder: TableBorder.all(
                        color: ColorTheme.lightRed,
                      ),
                    ),
                    shrinkWrap: true,
                    data: message,
                  ),
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
        if (!sentByMe && isButton)
          Container(
            margin: const EdgeInsets.only(left: 35, top: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 36,
                          width: 218,
                          decoration: BoxDecoration(
                            color: ColorTheme.darkRed,
                            borderRadius: borderRadius,
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Записаться на консультацию',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 36,
                        width: 218,
                        child: Material(
                          clipBehavior: Clip.hardEdge,
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.red.shade300.withOpacity(.3),
                            borderRadius: borderRadius,
                            onTap: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
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
