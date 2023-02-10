import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shusekibo/app/widget/app_start_page.dart';
import 'package:shusekibo/feature/attendance/widget/attendance_list_page.dart';
import 'package:shusekibo/feature/attendance/widget/attendance_seats_page.dart';
import 'package:shusekibo/feature/attendance/widget/attendance_timed_list_page.dart';
import 'package:shusekibo/feature/attendance/widget/attendance_timed_seats_page.dart';
import 'package:shusekibo/feature/auth/widget/sign_in_page.dart';
import 'package:shusekibo/feature/awareness/widget/awareness_list_page.dart';
import 'package:shusekibo/feature/awareness/widget/awareness_page.dart';
import 'package:shusekibo/feature/awareness/widget/awareness_seats_page.dart';
import 'package:shusekibo/feature/dashboard/widget/dashboard_page.dart';
import 'package:shusekibo/feature/health/widget/health_list_page.dart';
import 'package:shusekibo/feature/health/widget/health_seats_page.dart';

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    //RedirectRoute(path: '*', redirectTo: '/'),
    AutoRoute(page: AppStartPage, initial: true),
    AutoRoute(path: '/signin', page: SignInPage),
  
    AutoRoute(path: '/dashboard', page: DashboardPage),
    AutoRoute(path: '/healthlist', page: HealthListPage),
    AutoRoute(path: '/healthseats', page: HealthSeatsPage),
    AutoRoute(path: '/attendancelist', page: AttendanceListPage),
    AutoRoute(path: '/attendanceseats', page: AttendanceSeatsPage),
    AutoRoute(path: '/attendancetimedlist', page: AttendanceTimedListPage),
    AutoRoute(path: '/attendancetimedseats', page: AttendanceTimedSeatsPage),
    
    AutoRoute(path: '/awareness', page: AwarenessPage),
    AutoRoute(path: '/awarenesslist', page: AwarenessListPage),
    AutoRoute(path: '/awarenessseats', page: AwarenessSeatsPage),
  ],
)
class $AppRouter {}
