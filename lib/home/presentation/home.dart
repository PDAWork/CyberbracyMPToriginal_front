import 'package:cyberbracy_mpt_original_front/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/const/custom_icon_icons.dart';
import 'package:cyberbracy_mpt_original_front/const/images_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 130,
        actions: [
          Image.asset(
            ImagesUrl.chat_bot,
            width: 35,
          ),
          SizedBox(width: 15)
        ],
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: SvgPicture.asset(
                ImagesUrl.logo,
                height: 35,
              ),
            ),
            Text(
              'Открытый\nконтроль',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),

        // title: Text('открытый\nконтроль',style: Theme.of(context).textTheme.titleSmall,),
      ),
      backgroundColor: ColorTheme.white,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
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
                icon: Icon(CustomIcon.schedule),
                label: 'Расписание',
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcon.control),
                label: 'Контроль',
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcon.profile),
                label: 'Профиль',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
