import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_provider.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_state.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

abstract class AttendanceStampRepositoryProtocol {
  Future<AttendanceStampState> fetch(); 
}

final attendanceStampRepositoryProvider = Provider(AttendanceStampRepository.new);

class AttendanceStampRepository implements AttendanceStampRepositoryProtocol {
  AttendanceStampRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<AttendanceStampState> fetch() async {
    final response = await _api.get('api/ShukketsuShussekibo/stamps');

    response.when(
      success: (success) {},
      error: (error) {return AttendanceStampState.error(error);},
    );

    if (response is APISuccess) {
      final value = response.value;
      try {
        // 1) Regist Stamp
        final registStampList = attendanceStampListFromJson(
            value['RegistStampList'] as List<dynamic>,);
        
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
        
        // 2) Unregist Stamp
        final unregistStampList = attendanceStampListFromJson(
            value['UnregistStampList'] as List<dynamic>,);

        _ref.read(attendanceStampProvider.notifier).state =
            registStampList.first;

        // Cacheの作成
        final registStampMap = Map.fromIterables(
          registStampList.map((e) => '${e.shukketsuJokyoCd}').toList(),
          registStampList.map((e) => e).toList(),
        );
        final unregistStampMap = Map.fromIterables(
          unregistStampList.map((e) => '${e.shukketsuJokyoCd}').toList(),
          unregistStampList.map((e) => e).toList(),
        );

        _ref.read(attendanceRegistStampCache.notifier).state = registStampMap;
        _ref.read(attendanceUnegistStampCache.notifier).state = unregistStampMap;


        return AttendanceStampState.loaded();
      } catch (e) {
        return AttendanceStampState.error(
            AppException.errorWithMessage(e.toString()));
      }
    } else if (response is APIError) {
      return AttendanceStampState.error(response.exception);
    } else {
      return const AttendanceStampState.loading();
    }
  }
}
