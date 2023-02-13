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
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../../widget/app_start_page.dart' as _i1;
import '../attendance/widget/attendance_list_page.dart' as _i6;
import '../attendance/widget/attendance_seats_page.dart' as _i7;
import '../attendance/widget/attendance_timed_list_page.dart' as _i8;
import '../attendance/widget/attendance_timed_seats_page.dart' as _i9;
import '../auth/widget/sign_in_page.dart' as _i2;
import '../awareness/widget/awareness_list_page.dart' as _i11;
import '../awareness/widget/awareness_page.dart' as _i10;
import '../awareness/widget/awareness_seats_page.dart' as _i12;
import '../dashboard/widget/dashboard_page.dart' as _i3;
import '../health/health_list_page.dart' as _i4;
import '../health/health_seat_page.dart' as _i5;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AppStartRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AppStartPage(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.SignInPage(key: args.key),
      );
    },
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.DashboardPage(key: args.key),
      );
    },
    HealthListRoute.name: (routeData) {
      final args = routeData.argsAs<HealthListRouteArgs>(
          orElse: () => const HealthListRouteArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.HealthListPage(key: args.key),
      );
    },
    HealthSeatsRoute.name: (routeData) {
      final args = routeData.argsAs<HealthSeatsRouteArgs>(
          orElse: () => const HealthSeatsRouteArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.HealthSeatsPage(
          key: args.key,
          screenTitle: args.screenTitle,
        ),
      );
    },
    AttendanceListRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceListRouteArgs>(
          orElse: () => const AttendanceListRouteArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.AttendanceListPage(key: args.key),
      );
    },
    AttendanceSeatsRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceSeatsRouteArgs>(
          orElse: () => const AttendanceSeatsRouteArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.AttendanceSeatsPage(key: args.key),
      );
    },
    AttendanceTimedListRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceTimedListRouteArgs>(
          orElse: () => const AttendanceTimedListRouteArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.AttendanceTimedListPage(key: args.key),
      );
    },
    AttendanceTimedSeatsRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceTimedSeatsRouteArgs>(
          orElse: () => const AttendanceTimedSeatsRouteArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.AttendanceTimedSeatsPage(key: args.key),
      );
    },
    AwarenessRoute.name: (routeData) {
      final args = routeData.argsAs<AwarenessRouteArgs>(
          orElse: () => const AwarenessRouteArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.AwarenessPage(key: args.key),
      );
    },
    AwarenessListRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.AwarenessListPage(),
      );
    },
    AwarenessSeatsRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.AwarenessSeatsPage(),
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          AppStartRoute.name,
          path: '/',
        ),
        _i13.RouteConfig(
          SignInRoute.name,
          path: '/signin',
        ),
        _i13.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
        ),
        _i13.RouteConfig(
          HealthListRoute.name,
          path: '/healthlist',
        ),
        _i13.RouteConfig(
          HealthSeatsRoute.name,
          path: '/healthseats',
        ),
        _i13.RouteConfig(
          AttendanceListRoute.name,
          path: '/attendancelist',
        ),
        _i13.RouteConfig(
          AttendanceSeatsRoute.name,
          path: '/attendanceseats',
        ),
        _i13.RouteConfig(
          AttendanceTimedListRoute.name,
          path: '/attendancetimedlist',
        ),
        _i13.RouteConfig(
          AttendanceTimedSeatsRoute.name,
          path: '/attendancetimedseats',
        ),
        _i13.RouteConfig(
          AwarenessRoute.name,
          path: '/awareness',
        ),
        _i13.RouteConfig(
          AwarenessListRoute.name,
          path: '/awarenesslist',
        ),
        _i13.RouteConfig(
          AwarenessSeatsRoute.name,
          path: '/awarenessseats',
        ),
      ];
}

/// generated route for
/// [_i1.AppStartPage]
class AppStartRoute extends _i13.PageRouteInfo<void> {
  const AppStartRoute()
      : super(
          AppStartRoute.name,
          path: '/',
        );

  static const String name = 'AppStartRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i13.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({_i14.Key? key})
      : super(
          SignInRoute.name,
          path: '/signin',
          args: SignInRouteArgs(key: key),
        );

  static const String name = 'SignInRoute';
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i13.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({_i14.Key? key})
      : super(
          DashboardRoute.name,
          path: '/dashboard',
          args: DashboardRouteArgs(key: key),
        );

  static const String name = 'DashboardRoute';
}

class DashboardRouteArgs {
  const DashboardRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HealthListPage]
class HealthListRoute extends _i13.PageRouteInfo<HealthListRouteArgs> {
  HealthListRoute({_i14.Key? key})
      : super(
          HealthListRoute.name,
          path: '/healthlist',
          args: HealthListRouteArgs(key: key),
        );

  static const String name = 'HealthListRoute';
}

class HealthListRouteArgs {
  const HealthListRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'HealthListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.HealthSeatsPage]
class HealthSeatsRoute extends _i13.PageRouteInfo<HealthSeatsRouteArgs> {
  HealthSeatsRoute({
    _i14.Key? key,
    String screenTitle = '',
  }) : super(
          HealthSeatsRoute.name,
          path: '/healthseats',
          args: HealthSeatsRouteArgs(
            key: key,
            screenTitle: screenTitle,
          ),
        );

  static const String name = 'HealthSeatsRoute';
}

class HealthSeatsRouteArgs {
  const HealthSeatsRouteArgs({
    this.key,
    this.screenTitle = '',
  });

  final _i14.Key? key;

  final String screenTitle;

  @override
  String toString() {
    return 'HealthSeatsRouteArgs{key: $key, screenTitle: $screenTitle}';
  }
}

/// generated route for
/// [_i6.AttendanceListPage]
class AttendanceListRoute extends _i13.PageRouteInfo<AttendanceListRouteArgs> {
  AttendanceListRoute({_i14.Key? key})
      : super(
          AttendanceListRoute.name,
          path: '/attendancelist',
          args: AttendanceListRouteArgs(key: key),
        );

  static const String name = 'AttendanceListRoute';
}

class AttendanceListRouteArgs {
  const AttendanceListRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'AttendanceListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.AttendanceSeatsPage]
class AttendanceSeatsRoute
    extends _i13.PageRouteInfo<AttendanceSeatsRouteArgs> {
  AttendanceSeatsRoute({_i14.Key? key})
      : super(
          AttendanceSeatsRoute.name,
          path: '/attendanceseats',
          args: AttendanceSeatsRouteArgs(key: key),
        );

  static const String name = 'AttendanceSeatsRoute';
}

class AttendanceSeatsRouteArgs {
  const AttendanceSeatsRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'AttendanceSeatsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.AttendanceTimedListPage]
class AttendanceTimedListRoute
    extends _i13.PageRouteInfo<AttendanceTimedListRouteArgs> {
  AttendanceTimedListRoute({_i14.Key? key})
      : super(
          AttendanceTimedListRoute.name,
          path: '/attendancetimedlist',
          args: AttendanceTimedListRouteArgs(key: key),
        );

  static const String name = 'AttendanceTimedListRoute';
}

class AttendanceTimedListRouteArgs {
  const AttendanceTimedListRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'AttendanceTimedListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.AttendanceTimedSeatsPage]
class AttendanceTimedSeatsRoute
    extends _i13.PageRouteInfo<AttendanceTimedSeatsRouteArgs> {
  AttendanceTimedSeatsRoute({_i14.Key? key})
      : super(
          AttendanceTimedSeatsRoute.name,
          path: '/attendancetimedseats',
          args: AttendanceTimedSeatsRouteArgs(key: key),
        );

  static const String name = 'AttendanceTimedSeatsRoute';
}

class AttendanceTimedSeatsRouteArgs {
  const AttendanceTimedSeatsRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'AttendanceTimedSeatsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.AwarenessPage]
class AwarenessRoute extends _i13.PageRouteInfo<AwarenessRouteArgs> {
  AwarenessRoute({_i14.Key? key})
      : super(
          AwarenessRoute.name,
          path: '/awareness',
          args: AwarenessRouteArgs(key: key),
        );

  static const String name = 'AwarenessRoute';
}

class AwarenessRouteArgs {
  const AwarenessRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'AwarenessRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.AwarenessListPage]
class AwarenessListRoute extends _i13.PageRouteInfo<void> {
  const AwarenessListRoute()
      : super(
          AwarenessListRoute.name,
          path: '/awarenesslist',
        );

  static const String name = 'AwarenessListRoute';
}

/// generated route for
/// [_i12.AwarenessSeatsPage]
class AwarenessSeatsRoute extends _i13.PageRouteInfo<void> {
  const AwarenessSeatsRoute()
      : super(
          AwarenessSeatsRoute.name,
          path: '/awarenessseats',
        );

  static const String name = 'AwarenessSeatsRoute';
}
