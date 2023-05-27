import 'package:cyberbracy_mpt_original_front/chat_bot/domain/entity/message.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/presentation/cubit/chat_cubit.dart';
import 'package:cyberbracy_mpt_original_front/core/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/widget/app_bar_custom.dart';
import 'package:cyberbracy_mpt_original_front/widget/chat_text_field.dart';
import 'package:cyberbracy_mpt_original_front/widget/message_tile.dart';
import 'package:cyberbracy_mpt_original_front/widget/send_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  late ScrollController _scrollController;
  late TextEditingController _textEditingController;

  List<Message> messages = [];

  ///Скролл в конец после после отправки
  void animateToEnd() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    }
  }

  String formateDate(int timestamp) {
    return DateFormat.Hm()
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp));
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _textEditingController = TextEditingController();
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) => animateToEnd());
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
    messages = context.select((ChatCubit value) => value.messages);

    return Scaffold(
      appBar: const AppBarCustom(
        isChatBot: true,
        title: 'Бот-надзор',
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    animateToEnd();
                  },
                  child: Scrollbar(
                    interactive: false,
                    controller: _scrollController,
                    child: BlocConsumer<ChatCubit, ChatState>(
                      listener: (context, state) {
                        if (state is ChatError) {
                          // SnackBarService.showErrorMessage(
                          //   title: state.errorMessage,
                          // );
                        }
                        if (state is ChatLoaded) {
                          _textEditingController.text = '';
                          Future.delayed(const Duration(milliseconds: 200),
                              () => animateToEnd());
                        }
                      },
                      builder: (context, state) {
                        if (messages.isEmpty) {
                          return const SizedBox.shrink();
                        }
                        return ListView.separated(
                          controller: _scrollController,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          itemCount: messages.length,
                          itemBuilder: (context, index) =>
                              AnimationConfiguration.staggeredList(
                            delay: Duration.zero,
                            position: index,
                            child: FadeInAnimation(
                              child: MessageTile(
                                messages[index].message,
                                time: formateDate(messages[index].timestamp),
                                sender: 'none',
                                sentByMe: !messages[index].isBot,
                                isCanceled: messages[index].isCanceled,
                                // imageUrl: ImagesUrl.chat_bot,
                              ),
                            ),
                          ),
                        );
                      },
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
                      child: ChatTextField(
                        controller: _textEditingController,
                        onTap: () {
                          animateToEnd();
                        },
                      ),
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
                                  context.read<ChatCubit>().sendMessage(
                                      1, _textEditingController.text);
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
      ),
    );
  }
}
