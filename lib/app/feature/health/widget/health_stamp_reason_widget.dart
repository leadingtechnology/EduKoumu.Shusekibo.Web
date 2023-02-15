import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shusekibo/app/feature/health/widget/health_reason_widget.dart';
import 'package:shusekibo/app/feature/health/widget/health_stamp_regist_widget.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/health/health_stamp_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class HealthStampReasonWidget extends ConsumerWidget {
  const HealthStampReasonWidget({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(healthStampInitProvider);
    final unregistFlag = ref.watch(healthUnregistShowProvider);
    
    return state.when(
      loading: () {
        return Container();
      },
      loaded: () {
        final registStamps = ref.read(healthRegistStampCache).values.toList();
        final unregistStamps =
            ref.read(healthUnegistStampCache).values.toList();

        return Container(
          //color: Colors.grey[100],
          padding: Spacing.y(4),
          child: Column(
            children: [
              // tools bar
              Row(
                children: [
                  Spacing.width(20),
                  Transform.rotate(
                    angle: pi / 4,
                    child: const FaIcon(
                      FontAwesomeIcons.stamp,
                      size: 36,
                    ),
                  ),
                  Container(
                      padding: Spacing.x(4),
                      alignment: Alignment.topRight,
                      child:
                          const Text('健康観察\n状況', textAlign: TextAlign.center)),
                  Spacing.width(12),
                  HealthStampRegistWidget(
                    stamps: registStamps,
                  ),
                  Spacing.width(8),
                  IconButton(
                    onPressed: () {
                      ref.read(healthUnregistShowProvider.notifier).state =
                          !unregistFlag;
                    },
                    icon: unregistFlag
                        ? const FaIcon(
                            FontAwesomeIcons.angleUp,
                          )
                        : const FaIcon(
                            FontAwesomeIcons.angleDown,
                          ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    padding: Spacing.x(4),
                    alignment: Alignment.topRight,
                    child: const Text(
                      '事由',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const HealthReasonWidget(),
                  Spacing.width(24),
                ],
              ),
              if (unregistFlag)
                Row(
                  children: [
                    const SizedBox(
                      width: 132,
                    ),
                    HealthStampRegistWidget(
                      stamps: unregistStamps,
                    )
                  ],
                ),
              // tools bar
            ],
          ),
        );
      },
      error: (AppException error) {
        return Text('$error');
      },
    );


  }  
}
