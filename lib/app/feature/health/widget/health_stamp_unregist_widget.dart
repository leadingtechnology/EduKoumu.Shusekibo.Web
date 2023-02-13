import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/health/health_stamp_model.dart';
import 'package:shusekibo/app/widget/health/health_stamp_provider.dart';

class HealthStampUnregistWidget extends ConsumerWidget {
  const HealthStampUnregistWidget({ super.key, required this.stamps });

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
          //selectedColor: Colors.white,
          children: stamps
              .map((e) => SizedBox(
                  height: 40,
                  width: 100,
                  child: Center(
                      child: Text(
                    '${e.jokyoNmRyaku}',
                    style: const TextStyle(fontSize: 15),
                  ),),),)
              .toList(),
        )
      ],
    );   
  }  
}
