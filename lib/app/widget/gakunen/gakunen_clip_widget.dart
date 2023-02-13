import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_provider.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

class GakunenClipWidget extends ConsumerWidget {
  const GakunenClipWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gakunenInitProvider);
    final themeData = Theme.of(context);
    final dantai = ref.watch(dantaiProvider);

    return state.when(
      loading: () {
        return Container();
      },
      loaded: () {
        final gakunenList = ref.watch(gakunenCache)['${dantai.id}'];

        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: gakunenList!.map((gakunen) {
            return ChoiceChip(
              label: Text(
                '${gakunen.gakunenRyakusho}',
                style: TextStyle(
                  color: gakunen == ref.watch(gakunenProvider)
                      ? themeData.colorScheme.onPrimary
                      : themeData.colorScheme.primary,
                  letterSpacing: 0,
                  wordSpacing: 0,
                ),
              ),
              selected: gakunen == ref.watch(gakunenProvider),
              selectedColor: gakunen == ref.watch(gakunenProvider)
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.primary.withAlpha(24),
              backgroundColor: themeData.colorScheme.primary.withAlpha(24),
              onSelected: (bool selected) {
                ref.read(gakunenProvider.notifier).state = gakunen;

                final shozoku = ref
                    .read(shozokuCache)['${dantai.id}']!
                    .where((e) => e.gakunenCode == gakunen.gakunenCode);
                if (shozoku.isNotEmpty) {
                  ref.read(shozokuProvider.notifier).state = shozoku.first;
                }

              },
            );
          }).toList(),
        );
      },
      error: (AppException error) {
        return Text('$error');
      },
    );

  }
}
