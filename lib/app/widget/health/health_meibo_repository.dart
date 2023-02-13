import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_model.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/app/widget/health/health_meibo_model.dart';
import 'package:shusekibo/app/widget/health/health_meibo_state.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

abstract class HealthMeiboRepositoryProtocol {
  Future<HealthMeiboState> fetch(
      FilterModel filter); 
}

final healthMeiboRepositoryProvider = Provider(HealthMeiboRepository.new);

class HealthMeiboRepository implements HealthMeiboRepositoryProtocol {
  HealthMeiboRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<HealthMeiboState> fetch(FilterModel filter ) async {

    final strDate = DateFormat('yyyy-MM-dd').format(filter.targetDate?? DateTime.now());
    final url = 'api/shozoku/${filter.classId}/KenkouKansatsubo?date=$strDate&kouryuGakkyu=true';
    final response = await _api.get(url);

    print('------ meibo ------ $url');

    response.when(
        success: (success) {},
        error: (error) {return HealthMeiboState.error(error);},
    );

    if (response is APISuccess) {
      final value = response.value;
      try {
        final healthMeiboList = healthMeiboListFromJson(value as List<dynamic>);

        // save to cache
        _ref.read(healthMeibosCache.notifier).state = {};
        _ref.read(healthMeibosCache.notifier).state = Map.fromIterables(
            healthMeiboList.map((e) => '${e.studentKihonId}').toList(),
            healthMeiboList.map((e) => e).toList(),);
        

        return const HealthMeiboState.loaded();
      } catch (e) {
        return HealthMeiboState.error(
            AppException.errorWithMessage(e.toString()),);
      }
    } else if (response is APIError) {
      return HealthMeiboState.error(response.exception);
    } else {
      return const HealthMeiboState.loading();
    }
  }

  @override
  Future<HealthMeiboState> save() async {
    final filter = _ref.read(filterProvider);
    final extraFilter = _ref.read(healthFilterProvider);
    
    final strDate = DateFormat('yyyy-MM-dd')
        .format(extraFilter.targetDate ?? DateTime.now());

    final meibos = _ref.read(healthMeibosCache).values.toList();
    final json = jsonEncode(meibos
        .map((v) => v.toNewJson())
        .toList(),); //jsonEncode(meibos.map((i) => i.toJson()).toList()).toString();

    final response = await _api.post2(
        'api/shozoku/${filter.classId}/KenkouKansatsubo?date=$strDate', json,);

    return response.when(success: (success) async {
      return const HealthMeiboState.loaded();
    }, error: (error) {
      return HealthMeiboState.error(error);
    },);
  }  
  
}
