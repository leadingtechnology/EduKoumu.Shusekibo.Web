import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AwarenessSeatsRoute extends PageRouteInfo {
  const AwarenessSeatsRoute() : super(name, path: '/awarenessseats');
  static const String name = 'AwarenessSeatsRoute';
}       

class AwarenessSeatsPage extends ConsumerWidget {
  const AwarenessSeatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Text('Awareness Seats.');
  }
}