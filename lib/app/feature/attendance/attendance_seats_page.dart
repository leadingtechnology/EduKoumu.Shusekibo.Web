import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_filter_widget.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_footer_bar.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_search_widget.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_seat_widget.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_stamp_reason_widget.dart';
import 'package:shusekibo/app/feature/common/widget/base_scaffold_widget.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/common/header_bar.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AttendanceSeatsRoute extends PageRouteInfo {
  const AttendanceSeatsRoute() : super(name, path: '/attendanceseats');
  static const String name = 'AttendanceSeatsRoute';
}    

class AttendanceSeatsPage extends ConsumerWidget {
  AttendanceSeatsPage({super.key, this.screenTitle = ''});

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
                child: Column(children: [
              const AttendanceStampReasonWidget(),

              Expanded(
                //child: Container(),
                child: Container(
                    color: Colors.grey[100],
                    padding: Spacing.all(16),
                    child: const AttendanceSeatsGridView(),),
              ),
            ],),),

            // footer
            Spacing.height(8),
            const AttendanceFooterBar(buttnoName: '一覧', menuId: 11,),
          ],
        ),
      ),
    );
  }
}

// ShuketuSeat
class AttendanceSeatsGridView extends ConsumerWidget {
  const AttendanceSeatsGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(attendanceMeiboInitProvider);
    
    return state.when(
      blank: Container.new,
      loading: () => const Center(child: CircularProgressIndicator(),), 
      error: (AppException e){
          print('${e.toString()}');
          
          return Container();
      },
      loaded: () {
        final meibosmap = ref.watch(attendanceMeibosCache);
        
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 2,
          ),
          itemCount: meibosmap.length,
          itemBuilder: (BuildContext context, int index) {
            return AttendanceSeatWidget(
              meibo: meibosmap.values.elementAt(index),
            );
          },
        );
      },
    );
  }
}
