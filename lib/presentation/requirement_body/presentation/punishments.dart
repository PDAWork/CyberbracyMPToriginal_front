import 'package:flutter/material.dart';

import '../../../core/const/colors_theme.dart';


class Punishments extends StatelessWidget {
  const Punishments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ответственность за нарушения',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      'Административная',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Указание на нормативно-правовой акт',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorTheme.grey,
                        ),
                        'ст. 13.20 КоАП РФ: "Нарушение правил хранения, комплектования, учета или использования архивных документов, за исключением случаев, предусмотренных статьей 13.25 настоящего Кодекса, - влечет предупреждение или наложение административного штрафа на граждан в размере от одной тысячи до трех тысяч рублей; на должностных лиц - от трех тысяч до пяти тысяч рублей; на юридических лиц - от пяти тысяч до десяти тысяч рублей".')
                  ],
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Санкции',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            ...List.generate(3, (index) {
              return Card(
                borderOnForeground: true,
                shape: Border.all(
                  color: ColorTheme.white,
                  width: 1,
                ),
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ColorTheme.white,
                        border: Border.all(
                          width: 1,
                          color: ColorTheme.lightGrey,
                        ),
                      ),
                      child:  Text('Физическое лицо'),
                    ),
                    ...List.generate(2, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: index %2 == 0 ? Border(
                            bottom: BorderSide(
                              color: ColorTheme.background
                            )
                          ): null
                        ) ,
                        padding: const EdgeInsets.all(10.0),
                        child: Text("300-5000"),
                      );
                    })
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
