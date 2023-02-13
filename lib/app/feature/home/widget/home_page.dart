import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/navigation/navigation_bar.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class HomeRoute extends PageRouteInfo {
  const HomeRoute() : super(name, path: '/home');
  static const String name = 'HomeRoute';
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    
    return Scaffold(
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
            Expanded(child: AutoRouter()),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
