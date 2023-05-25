import 'package:cyberbracy_mpt_original_front/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/widget/app_bar_custom.dart';
import 'package:cyberbracy_mpt_original_front/widget/chat_text_field.dart';
import 'package:cyberbracy_mpt_original_front/widget/message_tile.dart';
import 'package:cyberbracy_mpt_original_front/widget/send_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  late ScrollController _scrollController;
  late TextEditingController _textEditingController;

  List<Map<String, dynamic>> messages = [
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'bot'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'bot'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'bot'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'bot'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'bot'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'bot'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'bot'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'bot'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'bot'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'bot'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'bot'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'bot'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'bot'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
    {
      'message': 'asdasdasdsadsadsadasdasdsadsa\nadasdsadsadsadasdsadasdas',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'bot'
    },
    {
      'message': 'last',
      'time': DateTime.now().millisecondsSinceEpoch,
      'sender': 'ripls'
    },
  ];

  ///Скролл в конец после после отправки
  void animateToEnd() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    });
  }

  String formateDate(int timestamp) {
    return DateFormat.Hm()
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp));
  }

  void sendMessage(Map<String, dynamic> message) {
    setState(() {
      messages.add(message);
      _textEditingController.text = '';
      animateToEnd();
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _textEditingController = TextEditingController();
    animateToEnd();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentUser = 'ripls';
    return Scaffold(
      appBar: const AppBarCustom(
        isChatBot: true,
        title: 'Бот-надзор',
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                interactive: false,
                controller: _scrollController,
                child: ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: messages.length,
                  itemBuilder: (context, index) => MessageTile(
                    messages[index]['message'],
                    time: formateDate(messages[index]['time']),
                    sender: messages[index]['sender'],
                    sentByMe: messages[index]['sender'] == currentUser,
                    // imageUrl: ImagesUrl.chat_bot,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: ChatTextField(controller: _textEditingController),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    flex: 0,
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorTheme.red),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    Icons.send,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SendButton(
                            onTap: () {
                              if (_textEditingController.text.isNotEmpty) {
                                sendMessage(
                                  {
                                    'message': _textEditingController.text,
                                    'time':
                                        DateTime.now().millisecondsSinceEpoch,
                                    'sender': 'ripls'
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
