import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/common/widget/base_scaffold_widget.dart';
import 'package:shusekibo/app/feature/health/widget/health_filter_widget.dart';
import 'package:shusekibo/app/feature/health/widget/health_footer_bar.dart';
import 'package:shusekibo/app/feature/health/widget/health_list_widget.dart';
import 'package:shusekibo/app/feature/health/widget/health_search_widget.dart';
import 'package:shusekibo/app/feature/health/widget/health_stamp_reason_widget.dart';
import 'package:shusekibo/app/widget/common/header_bar.dart';
import 'package:shusekibo/app/widget/health/health_meibo_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

import 'package:shusekibo/shared/util/spacing.dart';

class HealthListRoute extends PageRouteInfo {
  const HealthListRoute() : super(name, path: '/healthlist');
  static const String name = 'HealthListRoute';
}       

class HealthListPage extends ConsumerWidget {
  HealthListPage({ Key? key , this.screenTitle = '無題'}) : super(key: key);

  final String screenTitle;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffoldWidget(
      scaffoldKey: scaffoldKey,
      filter: HealthFilterWidget(),
      child: Container(
        padding: Spacing.all(12),
        //decoration: BoxDecoration(color: Colors.red),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // header
            const HeaderBar(),

            Spacing.height(8),
            // search bar
            HealthSearchWidget(scaffoldKey: scaffoldKey),

            // screen
            Spacing.height(8),
            Expanded(
                child: Column(children: [
              // Icon Bar
              const HealthStampReasonWidget(),
              Spacing.height(16),

              Expanded(
                //child: Container(),
                child: Container(
                  color: Colors.grey[100],
                  padding: Spacing.all(16),
                  child: const HealthListView(),
                ),
              ),
              // tools bar
            ],),),
            // footer
            Spacing.height(8),
            const HealthFooterBar(
              buttnoName: 'テーブル',
              menuId: 30,
            ),
            Spacing.height(8),
          ],
        ),
      ),
    );
  }
}

class HealthListView extends ConsumerWidget {
  const HealthListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(healthMeiboInitProvider);

    return state.when(
      blank: Container.new,
      loading: () => const Center(child: CircularProgressIndicator()), 
      error: (AppException e) => Text(e.toString()),
      loaded: () {
        return HealthListWidget(
          key: helthGlobalKey,
        );
      },
    );

  }
}
