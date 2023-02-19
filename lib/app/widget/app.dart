import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/route/router.dart';
import 'package:shusekibo/app/feature/route/router.gr.dart';

import 'package:shusekibo/l10n/l10n.dart';
import 'package:shusekibo/shared/constants/app_theme.dart';

class App extends ConsumerWidget {
  App({super.key});

  final _appRouter = AppRouter();
  final locale = const Locale('ja', 'JP');

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [AppRouteObserver()],
      ),
      routeInformationProvider: _appRouter.routeInfoProvider(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
    );
  }
}
