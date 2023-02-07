import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AwarenessListRoute extends PageRouteInfo {
  const AwarenessListRoute() : super(name, path: '/awarenesslist');
  static const String name = 'AwarenessListRoute';
}       

class AwarenessListPage extends ConsumerWidget {
  const AwarenessListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
