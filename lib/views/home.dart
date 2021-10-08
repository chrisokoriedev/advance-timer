import 'package:advance_timer/constants/theme_data.dart';
import 'package:advance_timer/enum.dart';
import 'package:advance_timer/model/menu_info.dart';
import 'package:advance_timer/views/clockpage.dart';
import 'package:advance_timer/views/stopwatchpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data.dart';
import 'alarmpage.dart';
import 'timerpage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var now = DateTime.now();
    // var formattedTime = DateFormat('hh:mm:aa').format(now);
    // var formattedDate = DateFormat('EE, DD/mm/yyyy').format(now);
    // var timeZoneString = now.timeZoneOffset.toString().split('.').first;
    // var offsetSign = '';
    // if (!timeZoneString.startsWith('_')) offsetSign = "+";
    return Scaffold(
      backgroundColor: Color(0xff2d2f41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map(
                  (currentMenuInfo) => buildMenuButton(currentMenuInfo),
                )
                .toList(),
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
                builder: (BuildContext context, value, Widget child) {
              if (value.menuType == MenuType.clock)
                return ClockPage();
              else if (value.menuType == MenuType.alarm)
                return AlarmPage();
              else if (value.menuType == MenuType.timer)
                return TimerPage();
              else if (value.menuType == MenuType.stopwatch)
                return StopWatchPage();
              return null;
            }),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, value, Widget child) {
        return FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: currentMenuInfo.menuType == value.menuType
                ? CustomColors.menuBackgroundColor
                : Colors.transparent,
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            child: Column(
              children: [
                Image.asset(
                  currentMenuInfo.imageSource,
                  scale: 1.5,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  currentMenuInfo.title ?? "",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ));
      },
    );
  }
}
