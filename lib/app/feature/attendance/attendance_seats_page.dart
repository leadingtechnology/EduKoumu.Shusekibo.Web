import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/common/widget/base_scaffold_widget.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AttendanceSeatsRoute extends PageRouteInfo {
  const AttendanceSeatsRoute() : super(name, path: '/attendanceseats');
  static const String name = 'AttendanceSeatsRoute';
}    

class AttendanceSeatsPage extends ConsumerWidget {
  AttendanceSeatsPage({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffoldWidget(
      scaffoldKey: scaffoldKey,
      filter: Container(),
      child: Container(
        padding: Spacing.all(12),
        //decoration: BoxDecoration(color: Colors.red),
        child: const Text('Attendance seat.'),
      ),
    );
  }
}
