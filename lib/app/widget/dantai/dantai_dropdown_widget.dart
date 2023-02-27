import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_model.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

class DantaiDropdownWidget extends ConsumerWidget{
  const DantaiDropdownWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final state = ref.watch(dantaiInitProvider);

    return state.when(
      loading: () => const Center(child: Text(''),), 
      error: (AppException e){ return Text(e.toString());},
      loaded: () {
        final token = ref.watch(tokenProvider);
        final dantaiList =
            ref.watch(dantaiCache.notifier).state['${token.LoginId}'] ?? [];

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
              //if (ref.read(dantaiProvider) == newValue) return ;
              
              ref.read(dantaiProvider.notifier).state = newValue!;
              ref.read(filterProvider.notifier).state = const FilterModel();
              
            },
            items: dantaiList.map((value) {
              return DropdownMenuItem<DantaiModel>(
                value: value,
                child: Text(
                  value.name.toString(),
                  style: const TextStyle(fontFamily: 'NotoSansJP'),
                ),
              );
            }).toList(),
          ),
        );
      },
    );

  }
}
