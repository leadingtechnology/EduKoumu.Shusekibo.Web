import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_provider.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_state.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

abstract class AttendanceReasonRepositoryProtocol {
  Future<AttendanceReasonState> fetch(AttendanceStampModel stamp);
}

final attendanceReasonRepositoryProvider =
    Provider(AttendanceReasonRepository.new);

class AttendanceReasonRepository implements AttendanceReasonRepositoryProtocol {
  AttendanceReasonRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<AttendanceReasonState> fetch(AttendanceStampModel stamp) async {
    final response = await _api.get('api/ShukketsuShussekibo/reasons/${stamp.shukketsuJokyoCd}');

    response.when(
        success: (success) {},
        error: (error) {
          return AttendanceReasonState.error(error);
        },);

    if (response is APISuccess) {
      final value = response.value;
      try {

        // Reason1
        final reason1List =
            attendanceReasonListFromJson(value['JiyuList'] as List<dynamic>);
        if (reason1List.isNotEmpty) {
          _ref.read(attendanceReason1Provider.notifier).state =
              reason1List.first;
        }

        var reason2List = <AttendanceReasonModel>[];
        if (stamp.shukketsuJokyoCd == '430' && reason1List.isNotEmpty) {
          reason2List = reason1List;
          _ref.read(attendanceReason2Provider.notifier).state =
              reason1List.first;
        }

        _ref
            .read(attendanceReason1Cache.notifier)
            .state['${stamp.shukketsuJokyoCd}'] = reason1List;
        _ref
            .read(attendanceReason2Cache.notifier)
            .state['${stamp.shukketsuJokyoCd}'] = reason2List;

        return const AttendanceReasonState.loaded();
      } catch (e) {
        return AttendanceReasonState.error(
            AppException.errorWithMessage(e.toString()),);
      }
    } else if (response is APIError) {
      return AttendanceReasonState.error(response.exception);
    } else {
      return const AttendanceReasonState.loading();
    }
  }
}
