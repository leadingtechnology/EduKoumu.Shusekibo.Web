import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/widget/attendance/attendance_reason_model.dart';
import 'package:shusekibo/widget/attendance/attendance_reason_provider.dart';



class AttendanceReasonWidget extends ConsumerWidget {
  const AttendanceReasonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(attendanceReasonListProvider);

    return state.when(
      loading:(){
        return Container();
      },
      loaded: (){
        final list1 = ref.watch(attendanceReason1ListProvider);
        final list2 = ref.watch(attendanceReason2ListProvider);

        return Column(
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<AttendanceReasonModel>(
                value: ref.watch(attendanceReason1Provider),
                //icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                dropdownColor: Colors.white,
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (AttendanceReasonModel? newValue) {
                  ref.read(attendanceReason1Provider.notifier).state = newValue!;
                },
                items: list1.map((value) {
                  return DropdownMenuItem<AttendanceReasonModel>(
                    value: value,
                    child: Text(value.shukketsuJiyuNmRyaku.toString(),
                        style: const TextStyle(fontFamily: 'NotoSansJP'),),
                  );
                }).toList(),
              ),
            ),
            // second
            DropdownButtonHideUnderline(
              child: DropdownButton<AttendanceReasonModel>(
                value: ref.watch(attendanceReason1Provider),
                //icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                dropdownColor: Colors.white,
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (AttendanceReasonModel? newValue) {
                  ref.read(attendanceReason2Provider.notifier).state = newValue!;
                },
                items: list2.map((value) {
                  return DropdownMenuItem<AttendanceReasonModel>(
                    value: value,
                    child: Text(
                      value.shukketsuJiyuNmRyaku.toString(),
                      style: const TextStyle(fontFamily: 'NotoSansJP'),
                    ),
                  );
                }).toList(),
              ),
            ),

          ],
        );      
      },
      error: (AppException error){
        return Container();
      },
    );
  }
}
