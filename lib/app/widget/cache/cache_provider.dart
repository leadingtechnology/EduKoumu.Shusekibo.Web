import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_timed_meibo_model.dart';
import 'package:shusekibo/app/widget/attendance/timed_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_bunrui_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_model.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/dashboard/tokobi_model.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_model.dart';
import 'package:shusekibo/app/widget/health/health_meibo_model.dart';
import 'package:shusekibo/app/widget/health/health_reason_model.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_model.dart';

import '../health/health_stamp_model.dart';

// userId -> Dantai List +
final dantaiCache = StateProvider<Map<String, List<DantaiModel>>>(
  (ref) => {},
);

// dantaiId -> Gakunen List +
final gakunenCache = StateProvider<Map<String, List<GakunenModel>>>(
  (ref) => {},
);

// dantaiId-GakunenCode -> Shozoku List +
final shozokuCache = StateProvider<Map<String, List<ShozokuModel>>>(
  (ref) => {},
);

// shozokuId - -> Time List -
final timedCache = StateProvider<Map<String, List<TimedModel>>>(
  (ref) => {},
);

// shozokuId - -> Time List -
final tokobiCache = StateProvider<Map<String, List<TokobiModel>>>(
  (ref) => {},
);

// bunruiId -> Bunrui List +
final bunruiCache = StateProvider<Map<String, List<AwarenessBunruiModel>>>(
  (ref) => {},
);

// Health Stamp -> Reason1 List +
final healthRegistStampCache = StateProvider<Map<String, HealthStampModel>>(
  (ref) => {},
);
final healthUnegistStampCache = StateProvider<Map<String, HealthStampModel>>(
  (ref) => {},
);

// Health Stamp -> Reason List +
final healthReason1Cache = StateProvider<Map<String, List<HealthReasonModel>>>(
  (ref) => {},
);

// Health Stamp -> Reason2 List
final healthReason2Cache = StateProvider<Map<String, List<HealthReasonModel>>>(
  (ref) => {},
);

//
final healthMeibosCache = StateProvider<Map<String, HealthMeiboModel>>(
  (ref) => {},
);

// Health Stamp -> Reason1 List +
final attendanceRegistStampCache =
    StateProvider<Map<String, AttendanceStampModel>>(
  (ref) => {},
);
final attendanceUnegistStampCache =
    StateProvider<Map<String, AttendanceStampModel>>(
  (ref) => {},
);

// Attendance Stamp -> Reason1 List
final attendanceReason1Cache =
    StateProvider<Map<String, List<AttendanceReasonModel>>>(
  (ref) => {},
);

// Attendance Stamp -> Reason2 List
final attendanceReason2Cache =
    StateProvider<Map<String, List<AttendanceReasonModel>>>(
  (ref) => {},
);

//
final attendanceMeibosCache =
    StateProvider<Map<String, AttendanceMeiboModel>>(
  (ref) => {},
);
final attendanceTimedMeibosCache =
    StateProvider<Map<String, AttendanceTimedMeiboModel>>(
  (ref) => {},
);

// Awareness
final awarenessMeibosCache =
    StateProvider<Map<String, AwarenessMeiboModel>>(
  (ref) => {},
);
final awarenessKizukiCache =
    StateProvider<Map<String, AwarenessKizukiModel>>(
  (ref) => {},
);
