import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/common/widget/base_scaffold_widget.dart';
import 'package:shusekibo/app/widget/awareness/awareness_bunrui_widget.dart';
import 'package:shusekibo/app/widget/common/header_bar.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class SettingRoute extends PageRouteInfo {
  const SettingRoute() : super(name, path: '/setting');
  static const String name = 'SettingRoute';
}

class SettingPage extends ConsumerWidget {
  SettingPage({super.key, this.screenTitle = '設定'});

  final String screenTitle;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffoldWidget(
      scaffoldKey: scaffoldKey,
      filter: Container(),
      child: Container(
        padding: Spacing.all(12),
        //decoration: BoxDecoration(color: Colors.red),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // header
            const HeaderBar(),

            Spacing.height(8),
            // search bar
            const AwarenessBunruiWidget(),

            // screen
            
            // footer
           
            Spacing.height(8),
          ],
        ),
      ),
    );
  }
}
