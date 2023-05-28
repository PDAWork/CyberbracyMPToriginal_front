import 'package:cyberbracy_mpt_original_front/presentation/consult_calendar/consult_calendar.dart';
import 'package:cyberbracy_mpt_original_front/presentation/home/presentation/control_body/control_body.dart';
import 'package:flutter/material.dart';

import '../../../core/const/colors_theme.dart';
import '../../../core/const/custom_icon_icons.dart';
import '../../../widget/app_bar_custom.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  ScrollController controller = ScrollController();

  List page = [
    const ControlBody(),
    const ConsultCalendar(),
    const Center(child: CircularProgressIndicator()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      backgroundColor: ColorTheme.white,
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              showUnselectedLabels: false,
              elevation: 1,
              backgroundColor: ColorTheme.red,
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CustomIcon.control),
                  label: 'Контроль',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CustomIcon.schedule),
                  label: 'Расписание',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CustomIcon.profile),
                  label: 'Профиль',
                ),
              ],
            ),
          ),
        ),
      ),
      body: page[currentIndex],
    );
  }
}
