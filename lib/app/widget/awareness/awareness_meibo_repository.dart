import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_provider.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_state.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_model.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

abstract class AwarenessMeiboRepositoryProtocol {
  Future<AwarenessMeiboState> fetch(FilterModel filter);
}

final awarenessMeiboRepositoryProvider = Provider(AwarenessMeiboRepository.new);

class AwarenessMeiboRepository implements AwarenessMeiboRepositoryProtocol {
  AwarenessMeiboRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<AwarenessMeiboState> fetch(FilterModel filter) async {
    final response = await _api.get('api/shozoku/${filter.classId}/kizuki');

    response.when(
      success: (success) {},
      error: (error) {
        return AwarenessMeiboState.error(error);
      },
    );

    if (response is APISuccess) {
      final value = response.value;
      try {

        // 1) change response to list
        final meiboList = awarenessMeiboListFromJson(value as List<dynamic>);

        // save to cache
        _ref.read(awarenessMeibosCache.notifier).state = Map.fromIterables(
          meiboList.map((e) => '${e.studentId}').toList(),
          meiboList.map((e) => e).toList(),
        );

        return const AwarenessMeiboState.loaded();
      } catch (e) {
        return AwarenessMeiboState.error(
          AppException.errorWithMessage(e.toString()),
        );
      }
    } else if (response is APIError) {
      return AwarenessMeiboState.error(response.exception);
    } else {
      return const AwarenessMeiboState.loading();
    }
  }

  Future<AwarenessMeiboState> save(String json) async {

    final response = await _api.post2('api/kizuki', json);

    response.when(
      success: (success) {},
      error: (error) {
        return AwarenessMeiboState.error(error);
      },
    );    

    if (response is APISuccess) {
      final value = response.value as List;
      print('------ save sucess : ${value.toString()}');
      try {
        // 1) change response to list
        final meibos = awarenessMeiboListFromJson(value);

        // 2) save cache
        final studentList = _ref
            .read(awarenessMeibosCache)
            .values
            .toList()
            .where((e) => e.selectFlag ?? false)
            .toList();
        
        for (final m in studentList) {
          final meibo =
              meibos.where((e) => e.studentId == m.studentId).first;

          if (meibo.kizukiCount == null || meibo.kizukiCount! <= 0) continue;
          
          final meibo2 = AwarenessMeiboModel(
            gakunen: meibo.gakunen,
            shozokuId: meibo.shozokuId,
            className: meibo.className,
            shussekiNo: meibo.shussekiNo,
            studentId: meibo.studentId,
            studentName: meibo.studentName,
            photoUrl: meibo.photoUrl,
            genderCode: meibo.genderCode,
            kizukiCount: meibo.kizukiCount,
            selectFlag: false,
            changedFlag: true,
          );
          
          _ref.read(awarenessMeibosCache.notifier).state['${meibo.studentId}'] =
              meibo2;
        }
        _ref.read(awarenessCountProvider.notifier).state = 0;

        return const AwarenessMeiboState.loaded();
      } catch (e) {
        return AwarenessMeiboState.error(
            AppException.errorWithMessage(e.toString()),);
      }
    } else if (response is APIError) {
      return AwarenessMeiboState.error(response.exception);
    } else {
      return const AwarenessMeiboState.loading();
    }
  }
}
