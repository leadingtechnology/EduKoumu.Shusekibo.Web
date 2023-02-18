import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_timed_filter_widget.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_timed_footer_bar.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_timed_list_widget.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_timed_search_widget.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_timed_stamp_reason_widget.dart';
import 'package:shusekibo/app/feature/common/widget/base_scaffold_widget.dart';
import 'package:shusekibo/app/widget/attendance/attendance_timed_meibo_provider.dart';
import 'package:shusekibo/app/widget/common/header_bar.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AttendanceTimedListRoute extends PageRouteInfo {
  const AttendanceTimedListRoute() : super(name, path: '/attendancetimedlist');
  static const String name = 'AttendanceTimedListRoute';
}    

class AttendanceTimedListPage extends ConsumerWidget {
  AttendanceTimedListPage({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffoldWidget(
      scaffoldKey: scaffoldKey,
      filter: AttendanceTimedFilterWidget(),
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
            AttendanceTimedSearchWidget(
              scaffoldKey: scaffoldKey,
              isTimed: true,
            ),

            // screen
            Spacing.height(8),
            Expanded(
              child: Column(
                children: [
                  const AttendanceTimedStampReasonWidget(),
                  Expanded(
                      child: Container(
                          alignment: Alignment.topLeft,
                          padding: Spacing.all(16),
                          child: const AttendanceTimedListView(),),),
                ],
              ),
            ),

            // footer
            Spacing.height(8),
            const AttendanceTimedFooterBar(
              buttnoName: 'テーブル',
              menuId: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class AttendanceTimedListView extends ConsumerWidget {
  const AttendanceTimedListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(attendanceTimedMeiboInitProvider);

    return state.when(
      blank: Container.new,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (AppException e) => Text(e.toString()),
      loaded: () {
        // Boxes.getHealthMeiboModelBox()
        return AttendanceTimedListWidget(
          key: attendanceTimedGlobalKey,
        );
      },
    );
  }
}
