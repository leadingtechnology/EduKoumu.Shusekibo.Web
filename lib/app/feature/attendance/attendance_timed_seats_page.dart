import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_timed_filter_widget.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_timed_footer_bar.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_timed_search_widget.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_timed_seat_widget.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_timed_stamp_reason_widget.dart';
import 'package:shusekibo/app/feature/common/widget/base_scaffold_widget.dart';
import 'package:shusekibo/app/widget/attendance/attendance_timed_meibo_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/common/header_bar.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

import 'package:shusekibo/shared/util/spacing.dart';

class AttendanceTimedSeatsRoute extends PageRouteInfo {
  const AttendanceTimedSeatsRoute() : super(name, path: '/attendancetimedseats');
  static const String name = 'AttendanceTimedSeatsRoute';
}   

class AttendanceTimedSeatsPage extends ConsumerWidget {
  AttendanceTimedSeatsPage({super.key, this.screenTitle = ''});

  final String screenTitle;
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
            ),

            // screen
            Spacing.height(8),
            Expanded(
                child: Column(children: [
              // Icon Bar
              const AttendanceTimedStampReasonWidget(),

              Expanded(
                //child: Container(),
                child: Container(
                    color: Colors.grey[100],
                    padding: Spacing.all(16),
                    child: const AttendanceTimedSeatsGridView(),),
              ),
              // tools bar
            ],),),

            // footer
            Spacing.height(8),
            const AttendanceTimedFooterBar(
              buttnoName: '一覧',
              menuId: 21,
            ),
          ],
        ),
      ),
    );
  }
}

// ShuketuSeat
class AttendanceTimedSeatsGridView extends ConsumerWidget {
  const AttendanceTimedSeatsGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(attendanceTimedMeiboInitProvider);

    return state.when(
      blank: Container.new,
      loading: () => const Center(child: CircularProgressIndicator(),), 
      error: (AppException e){
          print('${e.toString()}');
          
          return Container();
      },
      loaded: () {

        final meibosmap = ref.watch(attendanceTimedMeibosCache);

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 2,
          ),
          itemCount: meibosmap.length,
          itemBuilder: (BuildContext context, int index) {
            return AttendanceTimedSeatWidget(
              meibo:  meibosmap.values.elementAt(index),
            );
          },
        );
      },
    );
  }
}
