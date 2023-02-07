import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceListRoute extends PageRouteInfo {
  const AttendanceListRoute() : super(name, path: '/attendancelist');
  static const String name = 'AttendanceListRoute';
}    

class AttendanceListPage extends ConsumerWidget {
  const AttendanceListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
