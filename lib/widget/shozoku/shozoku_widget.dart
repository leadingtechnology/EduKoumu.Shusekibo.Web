import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/widget/shozoku/shozoku_model.dart';
import 'package:shusekibo/widget/shozoku/shozoku_provider.dart';

class ShozokuWidget extends ConsumerWidget {
  const ShozokuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shozokuListProvider);

    return state.when(
      loading: () {
        return Container();
      },
      loaded: (shozokuList) {
        return DropdownButtonHideUnderline(
          child: DropdownButton<ShozokuModel>(
            value: ref.watch(shozokuProvider),
            //icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.black, fontSize: 18),
            dropdownColor: Colors.white,
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: (ShozokuModel? newValue) {
              ref.read(shozokuProvider.notifier).state = newValue!;
            },
            items: shozokuList.map((value) {
              return DropdownMenuItem<ShozokuModel>(
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
      error: (AppException error) {
        return Container();
      },
    );
  }
}
