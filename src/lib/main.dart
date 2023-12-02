import 'package:aoc2023/common-widges.dart';
import 'package:aoc2023/dayslogic/day1.dart';
import 'package:aoc2023/dayslogic/day2.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

List<List<String>> results = [[]];

Future<void> main() async {
  results = [
    [await Day1.run1(), await Day1.run2()],
    [await Day2.run1(), await Day2.run2()]
  ];
  runApp(const AocMainWindow());
}

class AocMainWindow extends StatelessWidget {
  const AocMainWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(builder: (context, yaru, child) {
      return MaterialApp(
        theme: yaru.theme,
        darkTheme: yaru.darkTheme,
        home: const _Home(),
      );
    });
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YaruMasterDetailPage(
        length: 2,
        tileBuilder:(context, index, selected, availableWidth) {
          if (index == 0) {
            return const YaruMasterTile(
              leading: Icon(YaruIcons.calendar_day),
              title: Text('Days')
            );
          } else {
            
            return const YaruMasterTile(
              leading: Icon(YaruIcons.chat_text_filled),
              title: Text('Readme')
            );
            
          }
        },
        pageBuilder: (context, index) {
           if (index == 0) {
              return GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 550,
                  mainAxisExtent: 150,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15),
                children: [
                  DaypartBanner(titleText: "Day 1 Part 1", result: results[0][0]),
                  DaypartBanner(titleText: "Day 1 Part 2", result: results[0][1]),
                  DaypartBanner(titleText: "Day 1 Part 2", result: results[1][0]),
                  DaypartBanner(titleText: "Day 1 Part 2", result: results[1][1]),
                ]
              );
          } else {
              return const Center(
                child: Column(children: [
                  Text("A nice exercise to learn Dart and Flutter"),
                  Hyperlink(url: "https://ubuntu.github.io/yaru_widgets.dart/")
                ]) 
              );
          }
        },
      )
    );
  }
}



