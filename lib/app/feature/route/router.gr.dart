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
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../../widget/app_start_page.dart' as _i1;
import '../attendance/attendance_list_page.dart' as _i6;
import '../attendance/attendance_seats_page.dart' as _i7;
import '../attendance/attendance_timed_list_page.dart' as _i8;
import '../attendance/attendance_timed_seats_page.dart' as _i9;
import '../auth/widget/sign_in_page.dart' as _i2;
import '../awareness/awareness_list_page.dart' as _i11;
import '../awareness/awareness_page.dart' as _i10;
import '../awareness/awareness_seats_page.dart' as _i12;
import '../dashboard/widget/dashboard_page.dart' as _i3;
import '../health/health_list_page.dart' as _i4;
import '../health/health_seat_page.dart' as _i5;
import '../system/setting_page.dart' as _i13;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    AppStartRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AppStartPage(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.SignInPage(key: args.key),
      );
    },
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.DashboardPage(key: args.key),
      );
    },
    HealthListRoute.name: (routeData) {
      final args = routeData.argsAs<HealthListRouteArgs>(
          orElse: () => const HealthListRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.HealthListPage(
          key: args.key,
          screenTitle: args.screenTitle,
        ),
      );
    },
    HealthSeatsRoute.name: (routeData) {
      final args = routeData.argsAs<HealthSeatsRouteArgs>(
          orElse: () => const HealthSeatsRouteArgs());
      return _i14.MaterialPageX<dynamic>(
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
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.AttendanceListPage(
          key: args.key,
          screenTitle: args.screenTitle,
        ),
      );
    },
    AttendanceSeatsRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceSeatsRouteArgs>(
          orElse: () => const AttendanceSeatsRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.AttendanceSeatsPage(
          key: args.key,
          screenTitle: args.screenTitle,
        ),
      );
    },
    AttendanceTimedListRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceTimedListRouteArgs>(
          orElse: () => const AttendanceTimedListRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.AttendanceTimedListPage(key: args.key),
      );
    },
    AttendanceTimedSeatsRoute.name: (routeData) {
      final args = routeData.argsAs<AttendanceTimedSeatsRouteArgs>(
          orElse: () => const AttendanceTimedSeatsRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.AttendanceTimedSeatsPage(
          key: args.key,
          screenTitle: args.screenTitle,
        ),
      );
    },
    AwarenessRoute.name: (routeData) {
      final args = routeData.argsAs<AwarenessRouteArgs>(
          orElse: () => const AwarenessRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.AwarenessPage(
          key: args.key,
          screenTitle: args.screenTitle,
        ),
      );
    },
    AwarenessListRoute.name: (routeData) {
      final args = routeData.argsAs<AwarenessListRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.AwarenessListPage(
          key: args.key,
          screenTitle: args.screenTitle,
          scaffoldKey: args.scaffoldKey,
        ),
      );
    },
    AwarenessSeatRoute.name: (routeData) {
      final args = routeData.argsAs<AwarenessSeatRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.AwarenessSeatPage(
          key: args.key,
          scaffoldKey: args.scaffoldKey,
        ),
      );
    },
    SettingRoute.name: (routeData) {
      final args = routeData.argsAs<SettingRouteArgs>(
          orElse: () => const SettingRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.SettingPage(
          key: args.key,
          screenTitle: args.screenTitle,
        ),
      );
    },
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(
          AppStartRoute.name,
          path: '/',
        ),
        _i14.RouteConfig(
          SignInRoute.name,
          path: '/signin',
        ),
        _i14.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
        ),
        _i14.RouteConfig(
          HealthListRoute.name,
          path: '/healthlist',
        ),
        _i14.RouteConfig(
          HealthSeatsRoute.name,
          path: '/healthseats',
        ),
        _i14.RouteConfig(
          AttendanceListRoute.name,
          path: '/attendancelist',
        ),
        _i14.RouteConfig(
          AttendanceSeatsRoute.name,
          path: '/attendanceseats',
        ),
        _i14.RouteConfig(
          AttendanceTimedListRoute.name,
          path: '/attendancetimedlist',
        ),
        _i14.RouteConfig(
          AttendanceTimedSeatsRoute.name,
          path: '/attendancetimedseats',
        ),
        _i14.RouteConfig(
          AwarenessRoute.name,
          path: '/awareness',
        ),
        _i14.RouteConfig(
          AwarenessListRoute.name,
          path: '/awarenesslist',
        ),
        _i14.RouteConfig(
          AwarenessSeatRoute.name,
          path: '/awarenessseats',
        ),
        _i14.RouteConfig(
          SettingRoute.name,
          path: '/setting',
        ),
      ];
}

/// generated route for
/// [_i1.AppStartPage]
class AppStartRoute extends _i14.PageRouteInfo<void> {
  const AppStartRoute()
      : super(
          AppStartRoute.name,
          path: '/',
        );

  static const String name = 'AppStartRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i14.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({_i15.Key? key})
      : super(
          SignInRoute.name,
          path: '/signin',
          args: SignInRouteArgs(key: key),
        );

  static const String name = 'SignInRoute';
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i14.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({_i15.Key? key})
      : super(
          DashboardRoute.name,
          path: '/dashboard',
          args: DashboardRouteArgs(key: key),
        );

  static const String name = 'DashboardRoute';
}

class DashboardRouteArgs {
  const DashboardRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HealthListPage]
class HealthListRoute extends _i14.PageRouteInfo<HealthListRouteArgs> {
  HealthListRoute({
    _i15.Key? key,
    String screenTitle = '無題',
  }) : super(
          HealthListRoute.name,
          path: '/healthlist',
          args: HealthListRouteArgs(
            key: key,
            screenTitle: screenTitle,
          ),
        );

  static const String name = 'HealthListRoute';
}

class HealthListRouteArgs {
  const HealthListRouteArgs({
    this.key,
    this.screenTitle = '無題',
  });

  final _i15.Key? key;

  final String screenTitle;

  @override
  String toString() {
    return 'HealthListRouteArgs{key: $key, screenTitle: $screenTitle}';
  }
}

/// generated route for
/// [_i5.HealthSeatsPage]
class HealthSeatsRoute extends _i14.PageRouteInfo<HealthSeatsRouteArgs> {
  HealthSeatsRoute({
    _i15.Key? key,
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

  final _i15.Key? key;

  final String screenTitle;

  @override
  String toString() {
    return 'HealthSeatsRouteArgs{key: $key, screenTitle: $screenTitle}';
  }
}

/// generated route for
/// [_i6.AttendanceListPage]
class AttendanceListRoute extends _i14.PageRouteInfo<AttendanceListRouteArgs> {
  AttendanceListRoute({
    _i15.Key? key,
    String screenTitle = '',
  }) : super(
          AttendanceListRoute.name,
          path: '/attendancelist',
          args: AttendanceListRouteArgs(
            key: key,
            screenTitle: screenTitle,
          ),
        );

  static const String name = 'AttendanceListRoute';
}

class AttendanceListRouteArgs {
  const AttendanceListRouteArgs({
    this.key,
    this.screenTitle = '',
  });

  final _i15.Key? key;

  final String screenTitle;

  @override
  String toString() {
    return 'AttendanceListRouteArgs{key: $key, screenTitle: $screenTitle}';
  }
}

/// generated route for
/// [_i7.AttendanceSeatsPage]
class AttendanceSeatsRoute
    extends _i14.PageRouteInfo<AttendanceSeatsRouteArgs> {
  AttendanceSeatsRoute({
    _i15.Key? key,
    String screenTitle = '',
  }) : super(
          AttendanceSeatsRoute.name,
          path: '/attendanceseats',
          args: AttendanceSeatsRouteArgs(
            key: key,
            screenTitle: screenTitle,
          ),
        );

  static const String name = 'AttendanceSeatsRoute';
}

class AttendanceSeatsRouteArgs {
  const AttendanceSeatsRouteArgs({
    this.key,
    this.screenTitle = '',
  });

  final _i15.Key? key;

  final String screenTitle;

  @override
  String toString() {
    return 'AttendanceSeatsRouteArgs{key: $key, screenTitle: $screenTitle}';
  }
}

/// generated route for
/// [_i8.AttendanceTimedListPage]
class AttendanceTimedListRoute
    extends _i14.PageRouteInfo<AttendanceTimedListRouteArgs> {
  AttendanceTimedListRoute({_i15.Key? key})
      : super(
          AttendanceTimedListRoute.name,
          path: '/attendancetimedlist',
          args: AttendanceTimedListRouteArgs(key: key),
        );

  static const String name = 'AttendanceTimedListRoute';
}

class AttendanceTimedListRouteArgs {
  const AttendanceTimedListRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'AttendanceTimedListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.AttendanceTimedSeatsPage]
class AttendanceTimedSeatsRoute
    extends _i14.PageRouteInfo<AttendanceTimedSeatsRouteArgs> {
  AttendanceTimedSeatsRoute({
    _i15.Key? key,
    String screenTitle = '',
  }) : super(
          AttendanceTimedSeatsRoute.name,
          path: '/attendancetimedseats',
          args: AttendanceTimedSeatsRouteArgs(
            key: key,
            screenTitle: screenTitle,
          ),
        );

  static const String name = 'AttendanceTimedSeatsRoute';
}

class AttendanceTimedSeatsRouteArgs {
  const AttendanceTimedSeatsRouteArgs({
    this.key,
    this.screenTitle = '',
  });

  final _i15.Key? key;

  final String screenTitle;

  @override
  String toString() {
    return 'AttendanceTimedSeatsRouteArgs{key: $key, screenTitle: $screenTitle}';
  }
}

/// generated route for
/// [_i10.AwarenessPage]
class AwarenessRoute extends _i14.PageRouteInfo<AwarenessRouteArgs> {
  AwarenessRoute({
    _i15.Key? key,
    String screenTitle = '気づき',
  }) : super(
          AwarenessRoute.name,
          path: '/awareness',
          args: AwarenessRouteArgs(
            key: key,
            screenTitle: screenTitle,
          ),
        );

  static const String name = 'AwarenessRoute';
}

class AwarenessRouteArgs {
  const AwarenessRouteArgs({
    this.key,
    this.screenTitle = '気づき',
  });

  final _i15.Key? key;

  final String screenTitle;

  @override
  String toString() {
    return 'AwarenessRouteArgs{key: $key, screenTitle: $screenTitle}';
  }
}

/// generated route for
/// [_i11.AwarenessListPage]
class AwarenessListRoute extends _i14.PageRouteInfo<AwarenessListRouteArgs> {
  AwarenessListRoute({
    _i15.Key? key,
    String screenTitle = '',
    required _i15.GlobalKey<_i15.ScaffoldState> scaffoldKey,
  }) : super(
          AwarenessListRoute.name,
          path: '/awarenesslist',
          args: AwarenessListRouteArgs(
            key: key,
            screenTitle: screenTitle,
            scaffoldKey: scaffoldKey,
          ),
        );

  static const String name = 'AwarenessListRoute';
}

class AwarenessListRouteArgs {
  const AwarenessListRouteArgs({
    this.key,
    this.screenTitle = '',
    required this.scaffoldKey,
  });

  final _i15.Key? key;

  final String screenTitle;

  final _i15.GlobalKey<_i15.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'AwarenessListRouteArgs{key: $key, screenTitle: $screenTitle, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i12.AwarenessSeatPage]
class AwarenessSeatRoute extends _i14.PageRouteInfo<AwarenessSeatRouteArgs> {
  AwarenessSeatRoute({
    _i15.Key? key,
    required _i15.GlobalKey<_i15.ScaffoldState> scaffoldKey,
  }) : super(
          AwarenessSeatRoute.name,
          path: '/awarenessseats',
          args: AwarenessSeatRouteArgs(
            key: key,
            scaffoldKey: scaffoldKey,
          ),
        );

  static const String name = 'AwarenessSeatRoute';
}

class AwarenessSeatRouteArgs {
  const AwarenessSeatRouteArgs({
    this.key,
    required this.scaffoldKey,
  });

  final _i15.Key? key;

  final _i15.GlobalKey<_i15.ScaffoldState> scaffoldKey;

  @override
  String toString() {
    return 'AwarenessSeatRouteArgs{key: $key, scaffoldKey: $scaffoldKey}';
  }
}

/// generated route for
/// [_i13.SettingPage]
class SettingRoute extends _i14.PageRouteInfo<SettingRouteArgs> {
  SettingRoute({
    _i15.Key? key,
    String screenTitle = '設定',
  }) : super(
          SettingRoute.name,
          path: '/setting',
          args: SettingRouteArgs(
            key: key,
            screenTitle: screenTitle,
          ),
        );

  static const String name = 'SettingRoute';
}

class SettingRouteArgs {
  const SettingRouteArgs({
    this.key,
    this.screenTitle = '設定',
  });

  final _i15.Key? key;

  final String screenTitle;

  @override
  String toString() {
    return 'SettingRouteArgs{key: $key, screenTitle: $screenTitle}';
  }
}
