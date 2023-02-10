import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shusekibo/app/provider/app_start_provider.dart';
import 'package:shusekibo/feature/attendance/widget/attendance_list_page.dart';
import 'package:shusekibo/feature/attendance/widget/attendance_seats_page.dart';
import 'package:shusekibo/feature/attendance/widget/attendance_timed_list_page.dart';
import 'package:shusekibo/feature/attendance/widget/attendance_timed_seats_page.dart';
import 'package:shusekibo/feature/auth/widget/sign_in_page.dart';
import 'package:shusekibo/feature/awareness/widget/awareness_page.dart';
import 'package:shusekibo/feature/dashboard/widget/dashboard_page.dart';
import 'package:shusekibo/feature/health/widget/health_list_page.dart';
import 'package:shusekibo/feature/health/widget/health_seats_page.dart';
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
      authenticated: (menuId) {
        switch (menuId) {
          case 0:
            return DashboardPage();
          case 10:
            return AttendanceSeatsPage();
          case 11:
            return AttendanceListPage();
          case 20:
            return AttendanceTimedSeatsPage();
          case 21:
            return AttendanceTimedListPage();
          case 30:
            return HealthSeatsPage();
          case 31:
            return HealthListPage();
          case 40:
            return AwarenessPage();
          // case 50:
          //   return SettingPage();
          default:
            return DashboardPage();
        }        
      },
      unauthenticated: SignInPage.new,
      internetUnAvailable: () => const ConnectionUnavailableWidget(),
      orElse: () => const LoadingWidget(),
    );
  }
}
