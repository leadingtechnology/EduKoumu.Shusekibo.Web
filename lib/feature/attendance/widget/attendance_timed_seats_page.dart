import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceTimedSeatsRoute extends PageRouteInfo {
  const AttendanceTimedSeatsRoute() : super(name, path: '/attendancetimedseats');
  static const String name = 'AttendanceTimedSeatsRoute';
}   

class AttendanceTimedSeatsPage extends ConsumerWidget {
  const AttendanceTimedSeatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
