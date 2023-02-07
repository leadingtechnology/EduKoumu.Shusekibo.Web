import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HealthListRoute extends PageRouteInfo {
  const HealthListRoute() : super(name, path: '/healthlist');
  static const String name = 'HealthListRoute';
}       

class HealthListPage extends ConsumerWidget {
  const HealthListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
