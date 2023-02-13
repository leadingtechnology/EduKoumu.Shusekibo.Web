import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_provider.dart';


class AttendanceStampWidget extends ConsumerWidget {
  const AttendanceStampWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(attendanceStampListProvider);

    return state.when(
      loading:(){
        return const Text('');
      },
      loaded: (registList, unregistlist){
        return DropdownButtonHideUnderline(
          child: DropdownButton<AttendanceStampModel>(
            value: ref.watch(attendanceStampProvider),
            //icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.black, fontSize: 18),
            dropdownColor: Colors.white,
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: (AttendanceStampModel? newValue) {
              ref.read(attendanceStampProvider.notifier).state = newValue!;
            },
            items: registList.map((value) {
              return DropdownMenuItem<AttendanceStampModel>(
                value: value,
                child: Text(value.shukketsuJokyoNmRyaku.toString(),
                    style: const TextStyle(fontFamily: 'NotoSansJP'),),
              );
            }).toList(),
          ),
        );      
      },
      error: (AppException error){
        return const Text('attendance stamp error');
      },
    );
  }
}
