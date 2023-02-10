import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/widget/health/health_reason_model.dart';

import 'package:shusekibo/widget/health/health_reason_provider.dart';


class HealthReasonWidget extends ConsumerWidget {
  const HealthReasonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(healthReasonListProvider);

    return state.when(
      loading:(){
        return Container();
      },
      loaded: (){
        final list1 = ref.watch(healthReason1ListProvider);
        final list2 = ref.watch(healthReason2ListProvider);

        return Column(
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<HealthReasonModel>(
                value: ref.watch(healthReason1Provider),
                //icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                dropdownColor: Colors.white,
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (HealthReasonModel? newValue) {
                  ref.read(healthReason1Provider.notifier).state = newValue!;
                },
                items: list1.map((value) {
                  return DropdownMenuItem<HealthReasonModel>(
                    value: value,
                    child: Text(value.jiyuNmRyaku.toString(),
                        style: const TextStyle(fontFamily: 'NotoSansJP'),),
                  );
                }).toList(),
              ),
            ),
            // second
            DropdownButtonHideUnderline(
              child: DropdownButton<HealthReasonModel>(
                value: ref.watch(healthReason2Provider),
                //icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                dropdownColor: Colors.white,
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (HealthReasonModel? newValue) {
                  ref.read(healthReason2Provider.notifier).state = newValue!;
                },
                items: list2.map((value) {
                  return DropdownMenuItem<HealthReasonModel>(
                    value: value,
                    child: Text(
                      value.jiyuNmRyaku.toString(),
                      style: const TextStyle(fontFamily: 'NotoSansJP'),
                    ),
                  );
                }).toList(),
              ),
            ),

          ],
        );      
      },
      error: (AppException error){
        return Container();
      },
    );
  }
}
