import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_model.dart';
import 'package:shusekibo/app/widget/attendance/timed_model.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
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

// dantaiId-GakunenCode-Shozoku -> Time List -
final timedCache = StateProvider<Map<String, List<TimedModel>>>(
  (ref) => {},
);

// Health Stamp -> Reason1 List +
final healthRegistStampCache = StateProvider<Map<String, HealthStampModel>>(
  (ref) => {},
);
final healthUnegistStampCache = StateProvider<Map<String, HealthStampModel>>(
  (ref) => {},
);

// Health Stamp -> Reason1 List
final healthReason1Cache = StateProvider<Map<String, List<HealthReasonModel>>>(
  (ref) => {},
);

// Health Stamp -> Reason2 List
final healthReason2Cache = StateProvider<Map<String, List<HealthReasonModel>>>(
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
final healthMeibosCache = StateProvider<Map<String, HealthMeiboModel>>(
  (ref) => {},
);
