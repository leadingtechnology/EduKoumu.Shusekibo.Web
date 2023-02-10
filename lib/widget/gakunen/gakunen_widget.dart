import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/widget/gakunen/gakunen_model.dart';
import 'package:shusekibo/widget/gakunen/gakunen_provider.dart';

class GakunenWidget extends ConsumerWidget {
  const GakunenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gakunenListProvider);

    return state.when(
      loading: () {
        return Container();
      },
      loaded: (gakunenList) {
        return DropdownButtonHideUnderline(
          child: DropdownButton<GakunenModel>(
            value: ref.watch(gakunenProvider),
            //icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.black, fontSize: 18),
            dropdownColor: Colors.white,
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: (GakunenModel? newValue) {
              ref.read(gakunenProvider.notifier).state = newValue!;
            },
            items: gakunenList.map((value) {
              return DropdownMenuItem<GakunenModel>(
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
