import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shusekibo/app/feature/attendance/widget/attendance_timed_list_widget.dart';
import 'package:shusekibo/app/feature/common/widget/toast_helper.dart';
import 'package:shusekibo/app/feature/navigation/nav_bar.dart';
import 'package:shusekibo/app/widget/attendance/attendance_timed_meibo_provider.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AttendanceTimedFooterBar extends ConsumerWidget {
  const AttendanceTimedFooterBar(
      {super.key, required this.buttnoName, required this.menuId,});
  
  final String buttnoName;
  final int menuId;

  @override
   Widget build(BuildContext context, WidgetRef ref) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedButton.icon(
          onPressed: () {
            ref.read(menuIdProvider.notifier).state = menuId; 
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: const Size(150, 40),
            side: const BorderSide(
                width: 1, color: Colors.black87, style: BorderStyle.solid,),
          ),
          icon: const Icon(FontAwesomeIcons.grip,size: 16,color: Colors.black),
          label: Text(buttnoName,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        Spacing.width(12),
        OutlinedButton(
          onPressed: () async{
            ref.read(attendanceTimedMeiboInitProvider.notifier).updateByBlank();
            attendanceTimedGlobalKey.currentState?.setBlank();
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: const Size(150, 40),
            side: const BorderSide(
                width: 1, color: Colors.black87, style: BorderStyle.solid,),
          ),
          child: const Text(
            ' 空白のみ全出 ',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),

        Expanded(child: Container()),
        ElevatedButton(
          onPressed: () async{
            await ref.read(attendanceTimedMeiboInitProvider.notifier).save();
            ToastHelper.showToast(context, '　保存しました　');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor : const Color(0xFF0056d2),
            fixedSize: const Size(150, 40),
          ),
          child: const Text('保存', style: TextStyle(fontSize: 16),),
        ),
      ],
    );
  }
}
