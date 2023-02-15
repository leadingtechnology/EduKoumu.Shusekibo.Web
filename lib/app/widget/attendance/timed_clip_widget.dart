import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shusekibo/app/widget/attendance/timed_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

class TimedClipWidget extends ConsumerWidget {
  const TimedClipWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timedInitProvider);
    final themeData = Theme.of(context);

    return state.when(
      loading: () {return Container(); }, 
      error: (AppException error) {return Container(child: Text('$error')); },
      loaded: () {

        final targetDate = ref.watch(attendanceTimedFilterDateProvider);
        final strDate = DateFormat('yyyy-MM-dd').format(targetDate);
        final shozoku = ref.watch(shozokuProvider);
        
        final timedList = ref.read(timedCache)['${shozoku.id}-$strDate'];
        
        if (timedList!.isEmpty){
          return const Text('(無し)');
        }

        return Wrap(
          direction: Axis.horizontal,
          spacing: 10.0,
          runSpacing: 10.0,
          children: timedList.map((timed) {
            return ChoiceChip(
              label: Text(
                '${timed.ryaku}',
                style: TextStyle(
                  color: timed == ref.watch(timedProvider)
                      ? themeData.colorScheme.onPrimary
                      : themeData.colorScheme.primary,
                  letterSpacing: 0,
                  wordSpacing: 0,
                ),
              ),
              selected: timed == ref.watch(timedProvider),
              selectedColor: timed == ref.watch(timedProvider)
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.primary.withAlpha(24),
              backgroundColor: themeData.colorScheme.primary.withAlpha(24),
              onSelected: (bool selected) {
                ref.read(timedProvider.notifier).state = timed;
              },
            );
          }).toList(),
        );
      },
    );
  }
}
