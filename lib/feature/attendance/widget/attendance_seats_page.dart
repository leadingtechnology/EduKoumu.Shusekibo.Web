import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceSeatsRoute extends PageRouteInfo {
  const AttendanceSeatsRoute() : super(name, path: '/attendanceseats');
  static const String name = 'AttendanceSeatsRoute';
}    

class AttendanceSeatsPage extends ConsumerWidget {
  const AttendanceSeatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Text('Attendance Seats.');
  }
}
