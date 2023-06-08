import 'package:cyberbracy_mpt_original_front/core/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/requirements_entity.dart';
import 'package:flutter/material.dart';

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
  double borderRadius = 10;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    if (widget.items.isNotEmpty) {
      choosenEntity = ValueNotifier(widget.items.first);
      textEditingController = TextEditingController(
        text: choosenEntity.value.name,
      );
    } else {
      textEditingController = TextEditingController();
    }

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
    if (widget.items.isNotEmpty) {
      choosenEntity.dispose();
    }
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
        if (widget.items.isNotEmpty) {
          choosenEntity.value = entity;
        }
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
        AnimatedContainer(
          constraints: BoxConstraints(
            minHeight: 30,
            maxWidth: size.width,
            minWidth: size.width,
          ),
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            borderRadius: isOpen
                ? BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    topRight: Radius.circular(borderRadius),
                  )
                : BorderRadius.all(
                    Radius.circular(borderRadius),
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
                  child: widget.items.isNotEmpty
                      ? ValueListenableBuilder(
                          valueListenable: choosenEntity,
                          builder: (context, value, child) {
                            textEditingController.text = value.name;
                            textEditingController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                  offset: textEditingController.text.length),
                            );
                            return ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: 30,
                                maxWidth: size.width * 0.8,
                                minWidth: size.width * 0.8,
                              ),
                              child: TextField(
                                onTap: onTap,
                                maxLines: null,
                                controller: textEditingController,
                                cursorColor: ColorTheme.darkRed,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 6),
                                  isDense: true,
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : const SizedBox.shrink(),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onIconTap,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 30,
                    child: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      size: 18,
                      progress: animation,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
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
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.circular(borderRadius)),
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
                                  overflow: TextOverflow.ellipsis,
                                )
                              : Text(
                                  value[index].name,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
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
