import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_provider.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AttendanceReasonWidget extends ConsumerWidget {
  const AttendanceReasonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(attendanceReasonInitProvider);
    final stamp = ref.watch(attendanceStampProvider);

    return state.when(
      loading: () {return Container();},
      error: (AppException error) { return Text('$error'); },
      loaded: () {

        final reason1List =
            ref.read(attendanceReason1Cache)['${stamp.shukketsuJokyoCd}'] ?? [];
        final reason2List =
            ref.read(attendanceReason2Cache)['${stamp.shukketsuJokyoCd}'] ?? [];

        // 2) create drowdown item
        final reason1Items = <DropdownMenuItem<AttendanceReasonModel>>[];
        final reason2Items = <DropdownMenuItem<AttendanceReasonModel>>[];

        for (final r in reason1List) {
          reason1Items.add(
            DropdownMenuItem<AttendanceReasonModel>(
              value: r,
              child: Text('${r.shukketsuJiyuNmSeishiki}'),
            ),
          );
        }
        for (final r in reason2List) {
          reason2Items.add(
            DropdownMenuItem<AttendanceReasonModel>(
              value: r,
              child: Text('${r.shukketsuJiyuNmSeishiki}'),
            ),
          );
        }

        // 3) return dropdown widget
        return Wrap(
          children: [
            Spacing.width(10),
            Container(
              height: 35,
              padding: const EdgeInsets.fromLTRB(5,0,0,0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<AttendanceReasonModel>(
                  value: ref.watch(attendanceReason1Provider),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'NotoSansJP',
                  ),
                  dropdownColor: Colors.white,
                  onChanged: (AttendanceReasonModel? newValue) {
                    ref.read(attendanceReason1Provider.notifier).state =
                        newValue!;
                  },
                  items: reason1Items.toSet().toList(),
                ),
              ),
            ),
            Spacing.width(4),
            if (reason2Items.isNotEmpty)
              Container(
                height: 35,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<AttendanceReasonModel>(
                    value: ref.watch(attendanceReason2Provider),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'NotoSansJP',
                    ),
                    dropdownColor: Colors.white,
                    onChanged: (AttendanceReasonModel? newValue) {
                      ref.read(attendanceReason2Provider.notifier).state =
                          newValue!;
                    },
                    items: reason1Items.toSet().toList(),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
