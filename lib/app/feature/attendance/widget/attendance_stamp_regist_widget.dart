import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_provider.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';

class AttendanceStampRegistWidget extends ConsumerWidget {
  const AttendanceStampRegistWidget({Key? key, required this.stamps}) : super(key: key);
  
  final List<AttendanceStampModel> stamps;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStamp = ref.watch(attendanceStampProvider);
    final isSelected = 
        stamps
        .map((e) => e.shukketsuJokyoCd == selectedStamp.shukketsuJokyoCd)
        .toList();

    return Row(
      children: [
        ToggleButtons(
            constraints: const BoxConstraints.expand(width: 50),
            fillColor: Theme.of(context).colorScheme.secondaryContainer,
            onPressed: (int index) {
              ref.read(attendanceStampProvider.notifier).state = stamps[index];

            final reason1List = ref.read(attendanceReason1Cache)[
                    '${stamps[index].shukketsuJokyoCd}'] ??
                [];
            if (reason1List.isEmpty) {
              ref.read(attendanceReason1Provider.notifier).state =
                  const AttendanceReasonModel();
            } else {
              ref.read(attendanceReason1Provider.notifier).state =
                  reason1List.first;
            }

            final reason2List =
                ref.read(attendanceReason2Cache)['${stamps[index].shukketsuJokyoCd}'] ?? [];

            if (reason2List.isEmpty) {
              ref.read(attendanceReason2Provider.notifier).state =
                  const AttendanceReasonModel();
            } else {
              ref.read(attendanceReason2Provider.notifier).state =
                  reason2List.first;
            }
            },
            isSelected: isSelected,
            children: stamps.map((e) {
              var fontSize = 15.0;
              if (e.shukketsuJokyoCd == '001' || e.shukketsuJokyoCd == '999') {
                fontSize = 13.0;
              }
              
              return SizedBox(
                  height: 40,
                  width: 100,
                  child: Center(
                      child: Text('${e.shukketsuJokyoNmRyaku}',
                          style: TextStyle(fontSize: fontSize),)));
            }).toList(),)
      ],
    );

  }
}
