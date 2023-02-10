import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/widget/attendance/attendance_stamp_provider.dart';
import 'package:shusekibo/widget/common/app_state.dart';

abstract class AttendanceStampRepositoryProtocol {
  Future<AppState> fetch(); 
}

final attendanceStampRepositoryProvider = Provider(AttendanceStampRepository.new);

class AttendanceStampRepository implements AttendanceStampRepositoryProtocol {
  AttendanceStampRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<AppState> fetch() async {
    final response = await _api.get('api/ShukketsuShussekibo/stamps');

    response.when(
        success: (success) {},
        error: (error) {return AppState.error(error);},
    );

    if (response is APISuccess) {
      final value = response.value;
      try {
        // 1) Regist Stamp
        final registStampList = attendanceStampListFromJson(
            value['RegistStampList'] as List<dynamic>);
        
        // Add 2 stamps
        const handStamp = AttendanceStampModel(
            shukketsuJokyoCd: '001',
            shukketsuJokyoNmRyaku: '(未選択)',
            shukketsuJokyoKey: '',);

        const delStamp = AttendanceStampModel(
            shukketsuJokyoCd: '999',
            shukketsuJokyoNmRyaku: 'クリア',
            shukketsuJokyoKey: 'Delete',);
            
        registStampList
          ..insert(0, handStamp)
          ..add(delStamp);
        
        _ref.read(attendanceRegistStampProvider.notifier).state =
            registStampList;
        if (registStampList.isNotEmpty){
          _ref.read(attendanceStampProvider.notifier).state =
              registStampList.first;
        }

        // 2) Unregist Stamp
        final unregistStampList = attendanceStampListFromJson(
            value['UnregistStampList'] as List<dynamic>,);

        _ref.read(attendanceUnregistStampProvider.notifier).state =
            unregistStampList;

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
