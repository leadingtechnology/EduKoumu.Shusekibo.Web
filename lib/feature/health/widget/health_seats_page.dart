import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HealthSeatsRoute extends PageRouteInfo {
  const HealthSeatsRoute() : super(name, path: '/healthseats');
  static const String name = 'HealthSeatsRoute';
}       

class HealthSeatsPage extends ConsumerWidget {
  const HealthSeatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Text('Health Seats.');
  }
}
