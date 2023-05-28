import 'package:cyberbracy_mpt_original_front/core/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/core/const/types.dart';
import 'package:cyberbracy_mpt_original_front/service_locator.dart';
import 'package:cyberbracy_mpt_original_front/widget/app_bar_custom.dart';
import 'package:cyberbracy_mpt_original_front/widget/chat_text_field.dart';
import 'package:cyberbracy_mpt_original_front/widget/message_tile.dart';
import 'package:cyberbracy_mpt_original_front/widget/send_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

import '../../../domain/entity/message.dart';
import 'cubit/chat_cubit.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  late ScrollController _scrollController;
  late TextEditingController _textEditingController;

  List<Message> messages = [];
  int page = 1;
  int maxPage = 0;
  double delta = 0;
  double buttonDelta = 0;
  int millis = 0;
  double scrollOffset = 0;
  double scrollPosition = 0;
  late final UserId userId;
  final isFloatButtonVisible = ValueNotifier<bool>(false);

  ///Скролл в конец после после отправки
  void animateToEnd() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  String formateDate(int timestamp) {
    return DateFormat.Hm()
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp));
  }

  void _scrollListener() {
    if (buttonDelta < _scrollController.position.extentAfter) {
      isFloatButtonVisible.value = true;
    } else {
      isFloatButtonVisible.value = false;
    }
    buttonDelta = _scrollController.position.extentAfter;
    if (_scrollController.position.extentBefore ==
            _scrollController.position.maxScrollExtent &&
        delta > _scrollController.position.extentAfter &&
        (DateTime.now().millisecondsSinceEpoch - millis) > 400 &&
        page <= maxPage) {
      scrollOffset = _scrollController.offset;
      millis = DateTime.now().millisecondsSinceEpoch;

      scrollPosition = _scrollController.position.extentBefore;
      context.read<ChatCubit>().getUserChat(userId, page).then((value) {
        page++;
        // Future.delayed(const Duration(milliseconds: 400), () => scrollToPos());
      });
    }
    delta = _scrollController.position.extentBefore;
  }

  // void scrollToPos() {
  //   var max = _scrollController.position.maxScrollExtent;
  //   _scrollController.animateTo(max - scrollPosition,
  //       duration: const Duration(milliseconds: 200),
  //       curve: Curves.fastEaseInToSlowEaseOut);
  // }

  @override
  void initState() {
    userId = sl.get<UserId>();
    _scrollController = ScrollController();
    _textEditingController = TextEditingController();
    _scrollController.addListener(() => _scrollListener());
    var cubit = context.read<ChatCubit>();
    cubit.getMaxPages(userId).then(
      (value) {
        cubit.messages = [];
        maxPage = cubit.maxPages;
        cubit.getUserChat(userId, page);
        page++;
        // if (_scrollController.hasClients) {
        //   Future.delayed(
        //       const Duration(milliseconds: 700),
        //       () => _scrollController
        //           .jumpTo(_scrollController.position.maxScrollExtent));
        // }
      },
    );
    super.initState();
  }

  bool isHasNextPage(int curPage) {
    var pageSize = 20;
    return curPage * pageSize / 20 == 0;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (MediaQuery.of(context).viewInsets.bottom != 0) {
                        FocusScope.of(context).unfocus();
                        animateToEnd();
                      }
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
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.separated(
                            reverse: true,
                            cacheExtent: 99999999999999,
                            controller: _scrollController,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredList(
                                delay: Duration.zero,
                                position: index,
                                child: FadeInAnimation(
                                  child: MessageTile(
                                    messages[index].message,
                                    time:
                                        formateDate(messages[index].timestamp),
                                    sender: 'none',
                                    sentByMe: !messages[index].isBot,
                                    isCanceled: messages[index].isCanceled,
                                    isButton: messages[index].isButton,
                                    hasTable: messages[index].hasTable,
                                    // imageUrl: ImagesUrl.chat_bot,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  DownButton(
                    value: isFloatButtonVisible,
                    onTap: () {
                      animateToEnd();
                      Future.delayed(const Duration(milliseconds: 800),
                          () => isFloatButtonVisible.value = false);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 56,
                      child: ChatTextField(
                        controller: _textEditingController,
                        onTap: () {
                          animateToEnd();
                        },
                      ),
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
                                    userId, _textEditingController.text);
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

class DownButton extends StatefulWidget {
  final ValueNotifier<bool> value;
  final VoidCallback onTap;
  const DownButton({
    super.key,
    required this.value,
    required this.onTap,
  });

  @override
  State<DownButton> createState() => _DownButtonState();
}

class _DownButtonState extends State<DownButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ValueListenableBuilder(
          valueListenable: widget.value,
          builder: (context, value, child) {
            if (value) {
              animationController.forward();
              return FadeTransition(
                opacity: animationController,
                child: FloatingActionButton(
                  backgroundColor: ColorTheme.darkRed,
                  onPressed: widget.onTap,
                  child: const Icon(
                    Icons.arrow_downward,
                  ),
                ),
              );
            } else {
              animationController.reverse();
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
