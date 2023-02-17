import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_filter_widget.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_footer_bar.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_list_widget.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_search_widget.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_stamp_reason_widget.dart';
import 'package:shusekibo/app/feature/common/widget/base_scaffold_widget.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_provider.dart';
import 'package:shusekibo/app/widget/common/header_bar.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AttendanceListRoute extends PageRouteInfo {
  const AttendanceListRoute() : super(name, path: '/attendancelist');
  static const String name = 'AttendanceListRoute';
}    

class AttendanceListPage extends ConsumerWidget {
  AttendanceListPage({ super.key, this.screenTitle = ''});

  final String screenTitle;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffoldWidget(
      scaffoldKey: scaffoldKey,
      filter: AttendanceFilterWidget(),
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
            AttendanceSearchWidget(scaffoldKey: scaffoldKey,),

            // screen
            Spacing.height(8),
            Expanded(
              child: Column(
                children: [
                  const AttendanceStampReasonWidget(),

                  Expanded(
                      child: Container(
                          alignment: Alignment.topLeft, 
                          padding: Spacing.all(16),
                          child: const AttendanceListView(),
                      ),
                  ),
                ],
              ),
            ),

            // footer
            Spacing.height(8),
            const AttendanceFooterBar(buttnoName: 'テーブル', menuId: 10,),
          ],
        ),
      ),
      
    );
  }
}

// // ShuketuSeat
class AttendanceListView extends ConsumerWidget {
  const AttendanceListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(attendanceMeiboInitProvider);

    return state.when(
      blank: Container.new,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (AppException e) => Text(e.toString()),
      loaded: () {
        // Boxes.getHealthMeiboModelBox()
        return AttendanceListWidget(
          key: attendanceGlobalKey,
        );
      },
    );
  }
}

