import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/common/widget/base_scaffold_widget.dart';
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
      filter: Container(),
      child: Container(
        padding: Spacing.all(12),
        //decoration: BoxDecoration(color: Colors.red),
        child: const Text('Attendance Timed List.'),
      ),
    );
  }
}
