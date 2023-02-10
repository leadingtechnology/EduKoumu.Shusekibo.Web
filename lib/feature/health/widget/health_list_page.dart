import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/feature/common/widget/base_scaffold_widget.dart';

import 'package:shusekibo/shared/util/spacing.dart';

class HealthListRoute extends PageRouteInfo {
  const HealthListRoute() : super(name, path: '/healthlist');
  static const String name = 'HealthListRoute';
}       

class HealthListPage extends ConsumerWidget {
  HealthListPage({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffoldWidget(
      scaffoldKey: scaffoldKey,
      filter: Container(),
      child: Container(
        padding: Spacing.all(12),
        //decoration: BoxDecoration(color: Colors.red),
        child: const Text('Health List.'),
      ),
    );
  }
}
