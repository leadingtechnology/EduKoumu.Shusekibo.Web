import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shusekibo/app/provider/app_start_provider.dart';
import 'package:shusekibo/feature/auth/widget/sign_in_page.dart';
import 'package:shusekibo/feature/dashboard/widget/dashboard_page.dart';
import 'package:shusekibo/shared/widget/connection_unavailable_widget.dart';
import 'package:shusekibo/shared/widget/loading_widget.dart';

class AppStartPage extends ConsumerStatefulWidget {
  const AppStartPage({Key? key}) : super(key: key);

  @override
  AppStartPageState createState() => AppStartPageState();
}

class AppStartPageState extends ConsumerState<AppStartPage> {
  @override
  void initState() {
    super.initState();
    ref.read(appStartProvider); 
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(appStartProvider);

    return state.maybeWhen(
      initial: () => const LoadingWidget(),
      authenticated: DashboardPage.new,
      unauthenticated: SignInPage.new,
      internetUnAvailable: () => const ConnectionUnavailableWidget(),
      orElse: () => const LoadingWidget(),
    );
  }
}
