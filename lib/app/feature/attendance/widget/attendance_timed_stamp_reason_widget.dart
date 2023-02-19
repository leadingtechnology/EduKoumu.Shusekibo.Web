import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_reason_widget.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_stamp_regist_widget.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AttendanceTimedStampReasonWidget extends ConsumerWidget {
  const AttendanceTimedStampReasonWidget({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(attendanceStampInitProvider);
    final unregistFlag = ref.watch(attendanceUnregistShowProvider);

    return state.when(
      loading: () {return Container();}, 
      loaded: () {

      final registStamps = ref.read(attendanceRegistStampCache).values.toList();
      final unregistStamps =
          ref.read(attendanceUnegistStampCache).values.toList();


      return Container(
        //color: Colors.grey[100],
        padding: Spacing.y(4),
        child: Column(children: [
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
                  child: const Text('出欠\n状況', textAlign: TextAlign.center),),
              Spacing.width(12),
              // Container(
              //     padding: Spacing.x(4),
              //     alignment: Alignment.topRight,
              //     child: Text(
              //       '記号\nキー',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(fontSize: 12),
              //     )),
              AttendanceStampRegistWidget(
                stamps: registStamps,
              ),
              Spacing.width(8),
              IconButton(
                onPressed: () {ref.read(attendanceUnregistShowProvider.notifier).state = !unregistFlag; },
                icon: unregistFlag?const FaIcon(FontAwesomeIcons.angleUp,):const FaIcon(FontAwesomeIcons.angleDown,),
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
                  ),),
              const AttendanceReasonWidget(),
           
            ],
          ),
              if (unregistFlag)
                Row(
                  children: [
                    const SizedBox(
                      width: 104,
                    ),
                    AttendanceStampRegistWidget(
                      stamps: unregistStamps,
                    )
                  ],
                ),
          // tools bar
        ],),
      );
    }, error: (AppException error) {
      return Text('$error');
    },);
  }  

}
