
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/health/health_stamp_model.dart';
import 'package:shusekibo/app/widget/health/health_stamp_provider.dart';

class HealthStampRegistWidget extends ConsumerWidget {
  const HealthStampRegistWidget({ super.key, required this.stamps });

  final List<HealthStampModel> stamps;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStamp = ref.watch(healthStampProvider);
    final isSelected =
        stamps.map((e) => e.jokyoCd == selectedStamp.jokyoCd).toList();

    return Row(
      children: [
        ToggleButtons(
          constraints: const BoxConstraints.expand(width: 50),
          fillColor: Theme.of(context).colorScheme.secondaryContainer,
          onPressed: (int index) {
            ref.read(healthStampProvider.notifier).state = stamps[index];
          },
          isSelected: isSelected,
          
          children: stamps.map((e) {
            var fontSize = 15.0;
            if (e.jokyoCd == '001' || e.jokyoCd == '999') {
              fontSize = 13.0;
            }

            return SizedBox(
              height: 40,
              width: 100,
              child: Center(
                  child: Text('${e.jokyoNmRyaku}',
                      style: TextStyle(fontSize: fontSize),),),
            );
          }).toList(),
        )
      ],
    );
  }  
}
