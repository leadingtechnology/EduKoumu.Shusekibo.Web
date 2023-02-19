import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_state.dart';
import 'package:shusekibo/app/widget/attendance/attendance_timed_meibo_model.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_model.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

abstract class AttendanceTimedMeiboRepositoryProtocol {
  Future<AttendanceMeiboState> fetch(FilterModel filter); 
}

final attendanceTimedMeiboRepositoryProvider =
    Provider(AttendanceTimedMeiboRepository.new);

class AttendanceTimedMeiboRepository
    implements AttendanceTimedMeiboRepositoryProtocol {

  AttendanceTimedMeiboRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<AttendanceMeiboState> fetch(FilterModel filter) async {
    final strDate = DateFormat('yyyy-MM-dd')
        .format(filter.targetDate ?? DateTime.now());
    
    var url = 'api/shozoku/${filter.classId}/JigenbetsuShussekibo';
    url = '$url?date=$strDate&kouryuGakkyu=${filter.kouryuGakkyu}';
    final response = await _api.get(url);

    print('jigen timed url : $url');

    response.when(
        success: (success) {},
        error: (error) {return AttendanceMeiboState.error(error);},
    );

    if (response is APISuccess) {
      final value = response.value;
      try {

        print('jigen timed value : $value');
        // get list
        final meibos =
            attendanceTimedMeiboListFromJson(value as List<dynamic>);

        // save to cache
        _ref.read(attendanceTimedMeibosCache.notifier).state = Map.fromIterables(
          meibos.map((e) => '${e.studentKihonId}').toList(),
          meibos.map((e) => e).toList(),
        );

        return const AttendanceMeiboState.loaded();
      } catch (e) {
        return AttendanceMeiboState.error(
            AppException.errorWithMessage(e.toString()),);
      }
    } else if (response is APIError) {
      return AttendanceMeiboState.error(response.exception);
    } else {
      return const AttendanceMeiboState.loading();
    }
  }

  Future<AttendanceMeiboState> save() async {
    final filter = _ref.read(filterProvider);

    final strDate = DateFormat('yyyy-MM-dd')
        .format(filter.targetDate ?? DateTime.now());

    print('------ strDate: $strDate');

    final meibos = _ref.read(attendanceTimedMeibosCache).values.toList();
    final json = jsonEncode(meibos
        .map((v) => v.toNewJson())
        .toList(),);

    print('------ attendance timed json: $json');
    final response = await _api.post2(
        'api/shozoku/${filter.classId}/JigenbetsuShussekibo?date=$strDate',
        json,);

    return response.when(
      success: (success) {return const AttendanceMeiboState.loaded();}, 
      error: (error) {return AttendanceMeiboState.error(error);},
    );
  }   

}
