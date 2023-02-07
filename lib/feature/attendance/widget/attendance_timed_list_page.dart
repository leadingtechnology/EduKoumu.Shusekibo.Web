import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceTimedListRoute extends PageRouteInfo {
  const AttendanceTimedListRoute() : super(name, path: '/attendancetimedlist');
  static const String name = 'AttendanceTimedListRoute';
}    

class AttendanceTimedListPage extends ConsumerWidget {
  const AttendanceTimedListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
