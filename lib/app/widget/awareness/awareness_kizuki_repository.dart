import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_state.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

abstract class AwarenessKizukiRepositoryProtocol {
  Future<AwarenessKizukiState> fetch(); 
}

final awarenessKizukiRepositoryProvider = Provider(AwarenessKizukiRepository.new);

class AwarenessKizukiRepository implements AwarenessKizukiRepositoryProtocol {
  AwarenessKizukiRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<AwarenessKizukiState> fetch() async {
    final dantai = _ref.read(dantaiProvider);
    final filter = _ref.read(filterProvider);

    final strDate = DateFormat('yyyy-MM-dd')
        .format(filter.beginDate ?? DateTime.now());
    final endDate = DateFormat('yyyy-MM-dd')
        .format(filter.endDate ?? DateTime.now());

    final json = '''
{        
    DantaiId: ${dantai.id},
    Gakunen: ${filter.gakunenCode},
    ShozokuId: ${filter.classId},
    Start: "$strDate",
    End: "$endDate",
    TakeNo: 100,
    PageNo: 1
}
   ''';

    final response = await _api.post2('api/kizuki/search', json);


    response.when(
        success: (success) {},
        error: (error) {return AwarenessKizukiState.error(error);},
    );

    if (response is APISuccess) {
      final value = response.value;
      try {
        // 1) change response to list
        final kizukiList =
            awarenessKizukiListFromJson(value['Value']  as List<dynamic>);

        // save to cache
        _ref.read(awarenessKizukiCache.notifier).state = Map.fromIterables(
          kizukiList.map((e) => '${e.id}').toList(),
          kizukiList.map((e) => e).toList(),
        );

        return const AwarenessKizukiState.loaded();
      } catch (e) {
        return AwarenessKizukiState.error(
            AppException.errorWithMessage(e.toString()),);
      }
    } else if (response is APIError) {
      return AwarenessKizukiState.error(response.exception);
    } else {
      return const AwarenessKizukiState.loading();
    }
  }

  @override
  Future<AwarenessKizukiState> patch(int id, String json) async {
    final response = await _api.patch('api/kizuki/$id', json);

    if (response is APISuccess) {
      try {
        return const AwarenessKizukiState.loaded();
      } catch (e) {
        return AwarenessKizukiState.error(
            AppException.errorWithMessage(e.toString()),);
      }
    } else if (response is APIError) {
      return AwarenessKizukiState.error(response.exception);
    } else {
      return const AwarenessKizukiState.loading();
    }
  }

  Future<AwarenessKizukiState> delete(
      AwarenessKizukiModel kizuki, String dt,) async {
    final response = await _api.delete(
        'api/kizuki/${kizuki.id}?timestamp=${kizuki.timeStamp}', '',);

    if (response is APISuccess) {
      try {
        return const AwarenessKizukiState.loaded();
      } catch (e) {
        return AwarenessKizukiState.error(
            AppException.errorWithMessage(e.toString()),);
      }
    } else if (response is APIError) {
      return AwarenessKizukiState.error(response.exception);
    } else {
      return const AwarenessKizukiState.loading();
    }
  }  


}
