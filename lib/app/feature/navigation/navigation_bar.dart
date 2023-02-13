import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/feature/navigation/company_name.dart';
import 'package:shusekibo/app/feature/navigation/nav_bar.dart';
import 'package:shusekibo/app/feature/navigation/nav_bar_item.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class MyNavigationBar extends ConsumerWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuId = ref.watch(menuIdProvider);

    return Container(
      alignment: Alignment.centerLeft,
      decoration:
          BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
        BoxShadow(
            blurRadius: 3,
            color: Theme.of(context).primaryColor,
            offset: const Offset(2.0, 0))
      ]),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LayoutBuilder(builder: (context, constraints) {
              return Container();
            },),
            const CompanyName(),
            Spacing.height(20),
            Flexible(
              fit: FlexFit.tight,
              child: NavBar(),
            ),

            // NavBarItem(
            //   icon: Icons.settings,
            //   title: '設定',
            //   active: menuId == 50 ? true : false,
            //   touched: () {
            //     ref.read(menuIdProvider.notifier).state = 50;
            //   },
            //   menuId: 'setting',
            //   menuNo: 11,
            // ),
            NavBarItem(
              icon: Icons.logout,
              title: 'ログアウト',
              touched: () async {
                await ref.read(authProvider.notifier).logout();
              },
              active: menuId == 12 ? true : false,
              menuId: 'logout',
              menuNo: 12,
            ),
          ],
        ),
      ),
    );
  }
}
