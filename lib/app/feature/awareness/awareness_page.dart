import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/common/widget/base_scaffold_widget.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AwarenessRoute extends PageRouteInfo {
  const AwarenessRoute() : super(name, path: '/awareness');
  static const String name = 'AwarenessRoute';
}       

class AwarenessPage extends ConsumerWidget {
  AwarenessPage({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffoldWidget(
      scaffoldKey: scaffoldKey,
      filter: Container(),
      child: Container(
        padding: Spacing.all(12),
        child: const Text('Awareness.'),
      ),
    );
  }
}
