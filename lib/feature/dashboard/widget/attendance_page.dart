import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceRoute extends PageRouteInfo {
  const AttendanceRoute() : super(name, path: '/attendance');
  static const String name = 'AttendanceRoute';
}  

class AttendancePage extends ConsumerWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
  