import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/feature/navigation/navigation_bar.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class BaseScaffoldWidget extends ConsumerWidget {
  const BaseScaffoldWidget({
    super.key,
    required this.scaffoldKey,
    required this.child,
    required this.filter,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget child;
  final Widget filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: filter,
      body: SafeArea(
          child: Row(
        children: [
          // menu bar
          const SizedBox(
            width: 100,
            child: MyNavigationBar(),
          ),
          Spacing.width(10),
          // screen
          Expanded(child: child),
          const SizedBox(
            width: 8,
          ),
        ],
      ),),
    );
  }
}
