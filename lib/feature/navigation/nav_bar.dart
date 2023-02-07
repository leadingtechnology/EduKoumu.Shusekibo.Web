import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'nav_bar_item.dart';

final menuIdProvider = StateProvider<int>((_) => 0);

class NavBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuId = ref.watch(menuIdProvider);
    return Container(
      child: Column(
        children: [
          NavBarItem(
            icon: FontAwesomeIcons.house,
            title: 'ホーム',
            active: menuId==0?true:false,
            touched: () {
              ref.read(menuIdProvider.notifier).state = 0; 
            },
            menuId: 'darsboard',
            menuNo: 0,
          ),
          NavBarItem(
            icon: FontAwesomeIcons.clipboard,
            title: '出欠(日)',
            active: menuId == 10 || menuId == 11 ? true : false,
            touched: () {
              ref.read(menuIdProvider.notifier).state = 10; 
            },
            menuId: 'attendance',
            menuNo: 10,
          ),
          NavBarItem(
            icon: FontAwesomeIcons.clipboard,
            title: '出欠(時限)',
            active: menuId == 20 || menuId == 21 ? true : false,
            touched: () {
              ref.read(menuIdProvider.notifier).state = 20; 
            },
            menuId: 'attendanceTimed',
            menuNo: 20,
          ),
          NavBarItem(
            icon: FontAwesomeIcons.stethoscope,
            title: '健康観察',
            active: menuId == 30 || menuId == 31 ? true : false,
            touched: () {
              ref.read(menuIdProvider.notifier).state = 30; 
            },
            menuId: 'health',
            menuNo: 30,
          ),
          NavBarItem(
            icon: FontAwesomeIcons.lightbulb,
            title: '気づき',
            active: menuId == 40 ? true : false,
            touched: () {
              // ref.read(menuIdProvider.notifier).state = 40; 
              // ref.read(awarenessTabProvider.notifier).state = 0;
              // globals.tabController?.animateTo(0);
            },
            menuId: 'awareness',
            menuNo: 40,
          ),
        ],
      ),
    );
  }
}