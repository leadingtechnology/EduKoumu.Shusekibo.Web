import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/common/widget/base_scaffold_widget.dart';
import 'package:shusekibo/app/feature/dashboard/widget/dashboard_summary_tab.dart';
import 'package:shusekibo/app/widget/common/header_bar.dart';
import 'package:shusekibo/shared/util/date_util.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class DashboardRoute extends PageRouteInfo {
  const DashboardRoute() : super(name, path: '/dashboard');
  static const String name = 'DashboardRoute';
}  

class DashboardPage extends ConsumerWidget {
  DashboardPage({super.key});

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

            Spacing.height(24),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    //
                    // 左の設定
                    Expanded(
                      flex: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${DateUtil.getJpMonthDayWeek(DateTime.now())}の出欠人数等（クラス別）',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16,),
                          ),
                          const DashboardSummaryTab(),
                          Spacing.height(16),
                          // Text("状況確認", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                          // Container(child: DashboardCalendarTab()),
                        ],
                      ),
                    ),
                    //
                    // 右の設定
                    const SizedBox(
                      width: 204,
                    ),

                    //ParentsContectWidget(itemCount: itemCount),
                  ],
                ),
              ),
            ),

            // footer
            Spacing.height(8),
          ],
        ),
      ),
    );
  }
}

  
