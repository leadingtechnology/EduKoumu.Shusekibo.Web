// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../../app/widget/app_start_page.dart' as _i1;
import '../../feature/attendance/widget/attendance_list_page.dart' as _i7;
import '../../feature/attendance/widget/attendance_seats_page.dart' as _i8;
import '../../feature/attendance/widget/attendance_timed_list_page.dart' as _i9;
import '../../feature/attendance/widget/attendance_timed_seats_page.dart'
    as _i10;
import '../../feature/auth/widget/sign_in_page.dart' as _i3;
import '../../feature/awareness/widget/awareness_list_page.dart' as _i11;
import '../../feature/awareness/widget/awareness_seats_page.dart' as _i12;
import '../../feature/dashboard/widget/attendance_page.dart' as _i14;
import '../../feature/dashboard/widget/dashboard_page.dart' as _i4;
import '../../feature/dashboard/widget/health_page.dart' as _i13;
import '../../feature/health/widget/health_list_page.dart' as _i5;
import '../../feature/health/widget/health_seats_page.dart' as _i6;
import '../../feature/home/widget/home_page.dart' as _i2;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AppStartRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AppStartPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.SignInPage(key: args.key),
      );
    },
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.DashboardPage(key: args.key),
      );
    },
    HealthListRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.HealthListPage(),
      );
    },
    HealthSeatsRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.HealthSeatsPage(),
      );
    },
    AttendanceListRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AttendanceListPage(),
      );
    },
    AttendanceSeatsRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.AttendanceSeatsPage(),
      );
    },
    AttendanceTimedListRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AttendanceTimedListPage(),
      );
    },
    AttendanceTimedSeatsRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.AttendanceTimedSeatsPage(),
      );
    },
    AwarenessListRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.AwarenessListPage(),
      );
    },
    AwarenessSeatsRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.AwarenessSeatsPage(),
      );
    },
    HealthRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.HealthPage(),
      );
    },
    AttendanceRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.AttendancePage(),
      );
    },
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(
          AppStartRoute.name,
          path: '/',
        ),
        _i15.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i15.RouteConfig(
          SignInRoute.name,
          path: '/signin',
        ),
        _i15.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          children: [
            _i15.RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardRoute.name,
              redirectTo: 'health',
              fullMatch: true,
            ),
            _i15.RouteConfig(
              HealthRoute.name,
              path: 'health',
              parent: DashboardRoute.name,
            ),
            _i15.RouteConfig(
              AttendanceRoute.name,
              path: 'attendance',
              parent: DashboardRoute.name,
            ),
          ],
        ),
        _i15.RouteConfig(
          HealthListRoute.name,
          path: '/healthlist',
        ),
        _i15.RouteConfig(
          HealthSeatsRoute.name,
          path: '/healthseats',
        ),
        _i15.RouteConfig(
          AttendanceListRoute.name,
          path: '/attendancelist',
        ),
        _i15.RouteConfig(
          AttendanceSeatsRoute.name,
          path: '/attendanceseats',
        ),
        _i15.RouteConfig(
          AttendanceTimedListRoute.name,
          path: '/attendancetimedlist',
        ),
        _i15.RouteConfig(
          AttendanceTimedSeatsRoute.name,
          path: '/attendancetimedseats',
        ),
        _i15.RouteConfig(
          AwarenessListRoute.name,
          path: '/awarenesslist',
        ),
        _i15.RouteConfig(
          AwarenessSeatsRoute.name,
          path: '/awarenessseats',
        ),
      ];
}

/// generated route for
/// [_i1.AppStartPage]
class AppStartRoute extends _i15.PageRouteInfo<void> {
  const AppStartRoute()
      : super(
          AppStartRoute.name,
          path: '/',
        );

  static const String name = 'AppStartRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.SignInPage]
class SignInRoute extends _i15.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({_i16.Key? key})
      : super(
          SignInRoute.name,
          path: '/signin',
          args: SignInRouteArgs(key: key),
        );

  static const String name = 'SignInRoute';
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i15.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          DashboardRoute.name,
          path: '/dashboard',
          args: DashboardRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

class DashboardRouteArgs {
  const DashboardRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.HealthListPage]
class HealthListRoute extends _i15.PageRouteInfo<void> {
  const HealthListRoute()
      : super(
          HealthListRoute.name,
          path: '/healthlist',
        );

  static const String name = 'HealthListRoute';
}

/// generated route for
/// [_i6.HealthSeatsPage]
class HealthSeatsRoute extends _i15.PageRouteInfo<void> {
  const HealthSeatsRoute()
      : super(
          HealthSeatsRoute.name,
          path: '/healthseats',
        );

  static const String name = 'HealthSeatsRoute';
}

/// generated route for
/// [_i7.AttendanceListPage]
class AttendanceListRoute extends _i15.PageRouteInfo<void> {
  const AttendanceListRoute()
      : super(
          AttendanceListRoute.name,
          path: '/attendancelist',
        );

  static const String name = 'AttendanceListRoute';
}

/// generated route for
/// [_i8.AttendanceSeatsPage]
class AttendanceSeatsRoute extends _i15.PageRouteInfo<void> {
  const AttendanceSeatsRoute()
      : super(
          AttendanceSeatsRoute.name,
          path: '/attendanceseats',
        );

  static const String name = 'AttendanceSeatsRoute';
}

/// generated route for
/// [_i9.AttendanceTimedListPage]
class AttendanceTimedListRoute extends _i15.PageRouteInfo<void> {
  const AttendanceTimedListRoute()
      : super(
          AttendanceTimedListRoute.name,
          path: '/attendancetimedlist',
        );

  static const String name = 'AttendanceTimedListRoute';
}

/// generated route for
/// [_i10.AttendanceTimedSeatsPage]
class AttendanceTimedSeatsRoute extends _i15.PageRouteInfo<void> {
  const AttendanceTimedSeatsRoute()
      : super(
          AttendanceTimedSeatsRoute.name,
          path: '/attendancetimedseats',
        );

  static const String name = 'AttendanceTimedSeatsRoute';
}

/// generated route for
/// [_i11.AwarenessListPage]
class AwarenessListRoute extends _i15.PageRouteInfo<void> {
  const AwarenessListRoute()
      : super(
          AwarenessListRoute.name,
          path: '/awarenesslist',
        );

  static const String name = 'AwarenessListRoute';
}

/// generated route for
/// [_i12.AwarenessSeatsPage]
class AwarenessSeatsRoute extends _i15.PageRouteInfo<void> {
  const AwarenessSeatsRoute()
      : super(
          AwarenessSeatsRoute.name,
          path: '/awarenessseats',
        );

  static const String name = 'AwarenessSeatsRoute';
}

/// generated route for
/// [_i13.HealthPage]
class HealthRoute extends _i15.PageRouteInfo<void> {
  const HealthRoute()
      : super(
          HealthRoute.name,
          path: 'health',
        );

  static const String name = 'HealthRoute';
}

/// generated route for
/// [_i14.AttendancePage]
class AttendanceRoute extends _i15.PageRouteInfo<void> {
  const AttendanceRoute()
      : super(
          AttendanceRoute.name,
          path: 'attendance',
        );

  static const String name = 'AttendanceRoute';
}
