import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/widget/dantai/dantai_model.dart';
import 'package:shusekibo/widget/dantai/dantai_provider.dart';


class DantaiWidget extends ConsumerWidget {
  const DantaiWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dantaiListProvider);

    return state.when(
      loading:(){
        return Container();
      },
      loaded: (dantaiList){
        return DropdownButtonHideUnderline(
          child: DropdownButton<DantaiModel>(
            value: ref.watch(dantaiProvider),
            //icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.black, fontSize: 18),
            dropdownColor: Colors.white,
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: (DantaiModel? newValue) {
              ref.read(dantaiProvider.notifier).state = newValue!;
            },
            items: dantaiList.map((value) {
              return DropdownMenuItem<DantaiModel>(
                value: value,
                child: Text(value.name.toString(),
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
