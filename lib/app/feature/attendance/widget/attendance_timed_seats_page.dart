import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/common/widget/base_scaffold_widget.dart';

import 'package:shusekibo/shared/util/spacing.dart';

class AttendanceTimedSeatsRoute extends PageRouteInfo {
  const AttendanceTimedSeatsRoute() : super(name, path: '/attendancetimedseats');
  static const String name = 'AttendanceTimedSeatsRoute';
}   

class AttendanceTimedSeatsPage extends ConsumerWidget {
  AttendanceTimedSeatsPage({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffoldWidget(
      scaffoldKey: scaffoldKey,
      filter: Container(),
      child: Container(
        padding: Spacing.all(12),
        //decoration: BoxDecoration(color: Colors.red),
        child: const Text('Attendance Timed Seats.'),
      ),
    );
  }
}
