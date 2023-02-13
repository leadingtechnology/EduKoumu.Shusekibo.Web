import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/common/widget/globals.dart';
import 'package:shusekibo/app/widget/health/health_meibo_model.dart';
import 'package:shusekibo/app/widget/health/health_meibo_provider.dart';
import 'package:shusekibo/app/widget/health/health_reason_provider.dart';
import 'package:shusekibo/app/widget/health/health_stamp_provider.dart';
import 'package:shusekibo/app/widget/health/health_status_model.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class HealthSeatWidget extends ConsumerWidget {
  const HealthSeatWidget({super.key, required this.index, required this.healthMeibo});

  final int index;
  final HealthMeiboModel healthMeibo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stamp = ref.watch(healthStampProvider);
    final reason1 = ref.watch(healthReason1Provider);
    final reason2 = ref.watch(healthReason2Provider);

    Color color;

    late HealthStatusModel Jokyo;
    if (healthMeibo.jokyoList != null && healthMeibo.jokyoList![0] != null){
      Jokyo = healthMeibo.jokyoList![0];
    }else{
      Jokyo = const HealthStatusModel();
    }
    
    if ( Jokyo.jokyoCode  == '' || Jokyo.jokyoCode == null) {
      color = Theme.of(context).colorScheme.errorContainer;
    }else if (Jokyo.jokyoCode != '100') {
      color = Theme.of(context).colorScheme.primaryContainer;
    } else {
      color = Colors.grey.withAlpha(50);
    }

    return GestureDetector(
      onTap: () async{
        await ref.read(healthMeiboInitProvider.notifier).updateById(
          healthMeibo, 
          stamp,
          reason1,
          reason2,
        );
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 5, 5),
        child: Container(
          decoration: const BoxDecoration(
            //color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: 1.0,
                color: Colors.black26,
                blurRadius: 2.0,
                offset: Offset(2, 0),
              )
            ],
          ),
          child: Column(
            children: [
              // User Information
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                      child: ClipOval(
                        child: Image.asset(getPic(healthMeibo.studentKihonId??0)),
                        
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('${healthMeibo.studentNumber}',style: TextStyle(fontSize: 12)),
                        Text('${healthMeibo.name}',style: TextStyle(fontSize: 14)),
                      ],
                    )),
                  ],
                ),
              ),
    
              // status bar
              Spacing.height(4),
              Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('${Jokyo.ryaku ?? ''}'),
                      AutoSizeText('${Jokyo.jiyu1 ?? ''}${Jokyo.jiyu2 ?? ''}', maxLines: 1, overflow: TextOverflow.ellipsis,),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
