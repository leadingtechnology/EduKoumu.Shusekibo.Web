import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/widget/attendance/attendance_reason_model.dart';
import 'package:shusekibo/widget/attendance/attendance_reason_provider.dart';
import 'package:shusekibo/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/widget/common/app_state.dart';

abstract class AttendanceReasonRepositoryProtocol {
  Future<AppState> fetch(AttendanceStampModel stamp);
}

final attendanceReasonRepositoryProvider =
    Provider(AttendanceReasonRepository.new);

class AttendanceReasonRepository implements AttendanceReasonRepositoryProtocol {
  AttendanceReasonRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<AppState> fetch(AttendanceStampModel stamp) async {
    final response = await _api.get('api/ShukketsuShussekibo/reasons/${stamp.shukketsuJokyoCd}');

    response.when(
        success: (success) {},
        error: (error) {
          return AppState.error(error);
        });

    if (response is APISuccess) {
      final value = response.value;
      try {

        // Reason1
        final reason1List =
            attendanceReasonListFromJson(value['JiyuList'] as List<dynamic>);
        _ref.read(attendanceReason1ListProvider.notifier).state = reason1List;
        if(reason1List.isNotEmpty){
          _ref.read(attendanceReason1Provider.notifier).state = reason1List.first;
        }

        if (stamp.shukketsuJokyoCd == '430' && reason1List.isNotEmpty) {
          _ref.read(attendanceReason2ListProvider.notifier).state = reason1List;
          _ref.read(attendanceReason2Provider.notifier).state =
              reason1List.first;
        }else{
          _ref.read(attendanceReason2ListProvider.notifier).state = [];
          _ref.read(attendanceReason2Provider.notifier).state = const AttendanceReasonModel();
        }

        return const AppState.loaded();
      } catch (e) {
        return AppState.error(
            AppException.errorWithMessage(e.toString()));
      }
    } else if (response is APIError) {
      return AppState.error(response.exception);
    } else {
      return const AppState.loading();
    }
  }
}
