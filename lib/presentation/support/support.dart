import 'package:cyberbracy_mpt_original_front/domain/entity/control_organ_entity.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/requirements_entity.dart';
import 'package:cyberbracy_mpt_original_front/presentation/support/cubit/support_cubit.dart';
import 'package:cyberbracy_mpt_original_front/widget/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/const/colors_theme.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  ControlOrganEntity? controlOrganEntity;

  // ControlOrganHeadEntity controlOrganHeadEntity =
  //     ControlOrganHeadEntity.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.background,
      appBar: const AppBarCustom(
        isVisibilityChat: true,
        title: 'Записаться на консультирование',
        isChatBot: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const Text('Орган контроля'),
              const SizedBox(
                height: 5,
              ),
              BlocBuilder<SupportCubit, SupportState>(
                builder: (context, state) {
                  if (state is SupportSeccuse) {
                    return OrganDropDownButton(
                      choosenEntity: controlOrganEntity,
                      items: state.controlOrganList,
                      onChanged: (value) {
                        controlOrganEntity = value;
                        context
                            .read<SupportCubit>()
                            .getRequirments(value.lowName);
                      },
                    );
                  }
                  if (state is SupportRequirmentsLoaded) {
                    return OrganDropDownButton(
                      items: state.controlOrganList,
                      choosenEntity: controlOrganEntity,
                      onChanged: (value) {
                        controlOrganEntity = value;
                        context
                            .read<SupportCubit>()
                            .getRequirments(value.lowName);
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Требования'),
              BlocBuilder<SupportCubit, SupportState>(
                builder: (context, state) {
                  if (state is SupportRequirmentsLoaded) {
                    return RequireDropDownButton(
                      items: state.requirments,
                      onChanged: (value) {},
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const Text('Дата консультрования'),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const Text('Время консультирования'),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const Text('Вопрос'),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    Text('Записаться на консультирование'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OrganDropDownButton extends StatefulWidget {
  final List<ControlOrganEntity> items;
  final ControlOrganEntity? choosenEntity;
  final Function(ControlOrganEntity value) onChanged;
  const OrganDropDownButton({
    super.key,
    required this.items,
    required this.onChanged,
    this.choosenEntity,
  });

  @override
  State<OrganDropDownButton> createState() => _OrganDropDownButtonState();
}

class _OrganDropDownButtonState extends State<OrganDropDownButton>
    with SingleTickerProviderStateMixin {
  late ValueNotifier<ControlOrganEntity> choosenEntity;
  late ValueNotifier<List<ControlOrganEntity>> itemList;
  late AnimationController controller;
  late Animation<double> animation;
  late TextEditingController textEditingController;
  late ScrollController scrollController;
  bool isOpen = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    choosenEntity = ValueNotifier(widget.choosenEntity ?? widget.items.first);
    textEditingController = TextEditingController(
      text: choosenEntity.value.lowName,
    );

    scrollController = ScrollController();

    itemList = ValueNotifier(widget.items);
    textEditingController.addListener(
      () {
        Future.delayed(
          const Duration(microseconds: 1),
          () {
            var findList = widget.items
                .where(
                  (element) =>
                      element.lowName
                          .toLowerCase()
                          .contains(textEditingController.text.toLowerCase()) ||
                      textEditingController.text
                          .toLowerCase()
                          .contains(element.lowName.toLowerCase()),
                )
                .toList();
            var list = widget.items.toList();
            for (var i = 0; i < findList.length; i++) {
              list.remove(findList[i]);
            }
            findList.addAll(list);
            itemList.value = findList;
          },
        );
      },
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    choosenEntity.dispose();

    super.dispose();
  }

  void iconAnimation() {
    isOpen ? controller.forward() : controller.reverse();
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutCirc,
    );
  }

  void onTap() {
    setState(
      () {
        isOpen = isKeyboardOpen();
        if (!isKeyboardOpen() && !isOpen) {
          isOpen = true;
        }
        iconAnimation();
      },
    );
  }

  void onIconTap() {
    setState(
      () {
        isOpen = !isOpen;
        iconAnimation();
        FocusScope.of(context).unfocus();
      },
    );
  }

  void onItemTap(ControlOrganEntity entity) {
    setState(
      () {
        choosenEntity.value = entity;

        isOpen = false;
        widget.onChanged(entity);
        iconAnimation();
        FocusScope.of(context).unfocus();
      },
    );
  }

  bool isKeyboardOpen() => View.of(context).viewInsets.bottom != 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade400,
            ),
          ),
          padding: const EdgeInsets.all(8),
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onTap,
                  child: ValueListenableBuilder(
                    valueListenable: choosenEntity,
                    builder: (context, value, child) {
                      textEditingController.text = value.lowName;
                      textEditingController.selection =
                          TextSelection.fromPosition(
                        TextPosition(offset: textEditingController.text.length),
                      );
                      return SizedBox(
                        width: size.width * 0.8,
                        height: 28,
                        child: TextField(
                          maxLines: 1,
                          onTap: onTap,
                          controller: textEditingController,
                          cursorColor: ColorTheme.darkRed,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: onIconTap,
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    size: 18,
                    progress: animation,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: Colors.white,
          ),
          curve: Curves.fastEaseInToSlowEaseOut,
          duration: const Duration(milliseconds: 300),
          constraints: BoxConstraints(
            minHeight: isOpen ? 120 : 0,
            maxHeight: isOpen ? 150 : 0,
          ),
          child: AnimatedOpacity(
            opacity: isOpen ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Scrollbar(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                child: ValueListenableBuilder(
                  valueListenable: itemList,
                  builder: (context, value, child) => ListView.builder(
                    itemCount: value.length,
                    controller: scrollController,
                    itemBuilder: (context, index) => Material(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: InkWell(
                        onTap: () => onItemTap(value[index]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 8.0,
                          ),
                          child: index == 0
                              ? Text(
                                  value[index].lowName,
                                  overflow: TextOverflow.fade,
                                )
                              : Text(
                                  value[index].lowName,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                  overflow: TextOverflow.fade,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RequireDropDownButton extends StatefulWidget {
  final List<RequirementsEntity> items;
  final Function(RequirementsEntity value) onChanged;
  const RequireDropDownButton({
    super.key,
    required this.items,
    required this.onChanged,
  });

  @override
  State<RequireDropDownButton> createState() => _RequireDropDownButtonState();
}

class _RequireDropDownButtonState extends State<RequireDropDownButton>
    with SingleTickerProviderStateMixin {
  late ValueNotifier<RequirementsEntity> choosenEntity;
  late ValueNotifier<List<RequirementsEntity>> itemList;
  late AnimationController controller;
  late Animation<double> animation;
  late TextEditingController textEditingController;
  late ScrollController scrollController;
  bool isOpen = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    choosenEntity = ValueNotifier(widget.items.first);
    textEditingController = TextEditingController(
      text: choosenEntity.value.name,
    );

    scrollController = ScrollController();

    itemList = ValueNotifier(widget.items);
    textEditingController.addListener(
      () {
        Future.delayed(
          const Duration(microseconds: 1),
          () {
            var findList = widget.items
                .where(
                  (element) =>
                      element.name
                          .toLowerCase()
                          .contains(textEditingController.text.toLowerCase()) ||
                      textEditingController.text
                          .toLowerCase()
                          .contains(element.name.toLowerCase()),
                )
                .toList();
            var list = widget.items.toList();
            for (var i = 0; i < findList.length; i++) {
              list.remove(findList[i]);
            }
            findList.addAll(list);
            itemList.value = findList;
          },
        );
      },
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    choosenEntity.dispose();
    super.dispose();
  }

  void iconAnimation() {
    isOpen ? controller.forward() : controller.reverse();
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutCirc,
    );
  }

  void onTap() {
    setState(
      () {
        isOpen = isKeyboardOpen();
        if (!isKeyboardOpen() && !isOpen) {
          isOpen = true;
        }
        iconAnimation();
      },
    );
  }

  void onIconTap() {
    setState(
      () {
        isOpen = !isOpen;
        iconAnimation();
        FocusScope.of(context).unfocus();
      },
    );
  }

  void onItemTap(RequirementsEntity entity) {
    setState(
      () {
        choosenEntity.value = entity;
        isOpen = false;
        widget.onChanged(entity);
        iconAnimation();
        FocusScope.of(context).unfocus();
      },
    );
  }

  bool isKeyboardOpen() => View.of(context).viewInsets.bottom != 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade400,
            ),
          ),
          padding: const EdgeInsets.all(8),
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onTap,
                  child: ValueListenableBuilder(
                    valueListenable: choosenEntity,
                    builder: (context, value, child) {
                      textEditingController.text = value.name;
                      textEditingController.selection =
                          TextSelection.fromPosition(
                        TextPosition(offset: textEditingController.text.length),
                      );
                      return SizedBox(
                        width: size.width * 0.8,
                        height: 60,
                        child: TextField(
                          onTap: onTap,
                          maxLines: null,
                          controller: textEditingController,
                          cursorColor: ColorTheme.darkRed,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: onIconTap,
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    size: 18,
                    progress: animation,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: Colors.white,
          ),
          curve: Curves.fastEaseInToSlowEaseOut,
          duration: const Duration(milliseconds: 300),
          constraints: BoxConstraints(
            minHeight: isOpen ? 120 : 0,
            maxHeight: isOpen ? 150 : 0,
          ),
          child: AnimatedOpacity(
            opacity: isOpen ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Scrollbar(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                child: ValueListenableBuilder(
                  valueListenable: itemList,
                  builder: (context, value, child) => ListView.builder(
                    itemCount: value.length,
                    controller: scrollController,
                    itemBuilder: (context, index) => Material(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: InkWell(
                        onTap: () => onItemTap(value[index]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 8.0,
                          ),
                          child: index == 0
                              ? Text(
                                  value[index].name,
                                  overflow: TextOverflow.fade,
                                )
                              : Text(
                                  value[index].name,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                  overflow: TextOverflow.fade,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
