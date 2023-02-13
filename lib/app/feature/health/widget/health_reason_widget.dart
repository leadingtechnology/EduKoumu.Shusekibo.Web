import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/health/health_reason_model.dart';
import 'package:shusekibo/app/widget/health/health_reason_provider.dart';
import 'package:shusekibo/app/widget/health/health_stamp_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class HealthReasonWidget extends ConsumerWidget {
  const HealthReasonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(healthReasonInitProvider);
    final stamp = ref.watch(healthStampProvider);

    return state.when(
      loading: () {return Container();},
      error: (AppException error) { return Text('$error'); },
      loaded: () {

        final reason1List =
            ref.read(healthReason1Cache)['${stamp.jokyoCd}'] ?? [];
        final reason2List =
            ref.read(healthReason2Cache)['${stamp.jokyoCd}'] ?? [];
        
      // 2) create drowdown item
      final reason1Items = <DropdownMenuItem<HealthReasonModel>>[];
      final reason2Items = <DropdownMenuItem<HealthReasonModel>>[];

      for (final r in reason1List) {
        reason1Items.add(
          DropdownMenuItem<HealthReasonModel>(
            value: r,
            child: Text('${r.jiyuNmSeishiki}'),
          ),
        );
      }
      for (final r in reason2List) {
        reason2Items.add(
          DropdownMenuItem<HealthReasonModel>(
            value: r,
            child: Text('${r.jiyuNmSeishiki}'),
          ),
        );
      }

      // 3) return dropdown widget
      return Row(
        children: [
          SizedBox(
            width: 140,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<HealthReasonModel>(
                value: ref.watch(healthReason1Provider),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'NotoSansJP',),
                dropdownColor: Colors.white,
                onChanged: (HealthReasonModel? newValue) {
                  ref.read(healthReason1Provider.notifier).state = newValue!;
                },
                items: reason1Items.toSet().toList(),
              ),
            ),
          ),
          Spacing.width(4),
          if (!reason2Items.isNotEmpty) SizedBox(
            width: 140,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<HealthReasonModel>(
                value: ref.watch(healthReason1Provider),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'NotoSansJP',
                ),
                dropdownColor: Colors.white,
                onChanged: (HealthReasonModel? newValue) {
                  ref.read(healthReason1Provider.notifier).state = newValue!;
                },
                items: reason1Items.toSet().toList(),
              ),
            ),
          ),
        ],
      );
    },);
  }
}
