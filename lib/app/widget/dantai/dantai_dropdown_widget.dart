import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_provider.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_provider.dart';

class DantaiDropdownWidget extends ConsumerWidget{
  const DantaiDropdownWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(tokenProvider);
    final state = ref.watch(dantaiInitProvider);
    final dantaiList = ref.watch(dantaiCache.notifier).state['${token.LoginId}'] ?? [];

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

          final gakunen = ref.read(gakunenCache)['${newValue.id}'];
          if (gakunen!.isNotEmpty) {
            ref.read(gakunenProvider.notifier).state = gakunen.first;

            final shozoku = ref
                .read(shozokuCache)['${newValue.id}']!
                .where((e) => e.gakunenCode == gakunen.first.gakunenCode);
            if (shozoku.isNotEmpty) {
              ref.read(shozokuProvider.notifier).state = shozoku.first;
            }
          }
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
  }
}
