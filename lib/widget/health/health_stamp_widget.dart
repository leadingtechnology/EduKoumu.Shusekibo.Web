import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/widget/health/health_stamp_model.dart';
import 'package:shusekibo/widget/health/health_stamp_provider.dart';


class HealthStampWidget extends ConsumerWidget {
  const HealthStampWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(healthStampListProvider);

    return state.when(
      loading:(){
        return Container();
      },
      loaded: (list, list2){
        return DropdownButtonHideUnderline(
          child: DropdownButton<HealthStampModel>(
            value: ref.watch(healthStampProvider),
            //icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.black, fontSize: 18),
            dropdownColor: Colors.white,
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: (HealthStampModel? newValue) {
              ref.read(healthStampProvider.notifier).state = newValue!;
            },
            items: list.map((value) {
              return DropdownMenuItem<HealthStampModel>(
                value: value,
                child: Text(value.jokyoCd.toString(),
                    style: const TextStyle(fontFamily: 'NotoSansJP'),),
              );
            }).toList(),
          ),
        );      
      },
      error: (AppException error){
        return Container();
      },
    );
  }
}
