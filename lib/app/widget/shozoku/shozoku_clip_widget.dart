import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_provider.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

class ShozokuClipWidget extends ConsumerWidget {
  const ShozokuClipWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shozokuInitProvider);

    return state.when(loading: () {
      return Container();
    }, loaded: () {
        final dantai = ref.watch(dantaiProvider);
        final gakunen = ref.watch(gakunenProvider);
        final shozoku = ref.watch(shozokuProvider);
        final themeData = Theme.of(context);
        
        final shozokuList = ref
            .watch(shozokuCache)['${dantai.id}']!
            .where((e) => e.gakunenCode == gakunen.gakunenCode);
        
      return Wrap(
        spacing: 10,
        runSpacing: 10,
        children: shozokuList.map((element) {
          return ChoiceChip(
            label: Text(
              '${element.className}',
              style: TextStyle(
                color: element == shozoku
                    ? themeData.colorScheme.onPrimary
                    : themeData.colorScheme.primary,
                letterSpacing: 0,
                wordSpacing: 0,
              ),
            ),
            selected: element == shozoku,
            selectedColor: element == shozoku
                ? themeData.colorScheme.primary
                : themeData.colorScheme.primary.withAlpha(24),
            backgroundColor: themeData.colorScheme.primary.withAlpha(24),
            onSelected: (bool selected) {
              ref.read(shozokuProvider.notifier).state = element;
            },
          );
        }).toList(),
      );
    }, error: (AppException error) {
      return Text('$error');
    },);
  }
}
