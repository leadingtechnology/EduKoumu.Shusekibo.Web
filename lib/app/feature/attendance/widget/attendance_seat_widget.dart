import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_model.dart';
import 'package:shusekibo/app/widget/attendance/attendance_meibo_provider.dart';
import 'package:shusekibo/app/widget/attendance/attendance_reason_provider.dart';
import 'package:shusekibo/app/widget/attendance/attendance_stamp_provider.dart';
import 'package:shusekibo/app/widget/attendance/attendance_status_model.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AttendanceSeatWidget extends ConsumerWidget {
  AttendanceSeatWidget({super.key, required this.index, required this.meibo});

  final int index;
  final AttendanceMeiboModel meibo;
  final _baseUrl = dotenv.env['BASE_URL']!;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stamp = ref.watch(attendanceStampProvider);
    final reason1 = ref.watch(attendanceReason1Provider);
    final reason2 = ref.watch(attendanceReason2Provider);

    Color color;
    final url = '$_baseUrl${meibo.photoUrl}';
    final accessToken = ref.read(tokenProvider).access_token.toString();

    late AttendanceStatusModel jokyo;

    jokyo = meibo.jokyoList != null
        ? meibo.jokyoList![0]
        : const AttendanceStatusModel();

    if (jokyo.shukketsuKbn == '' || jokyo.shukketsuKbn == null) {
      color = Theme.of(context).colorScheme.errorContainer;
    } else if (jokyo.shukketsuKbn != '101') {
      color = Theme.of(context).colorScheme.primaryContainer;
    } else {
      color = Colors.grey.withAlpha(50);
    }

    return GestureDetector(
      onTap: () async {
        ref.read(attendanceMeiboInitProvider.notifier).updateById(
              meibo,
              stamp,
              reason1,
              reason2,
            );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
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
                          child: Image.network(
                        url,
                        headers: {"Authorization": "Bearer " + accessToken},
                      ),),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                          Text(
                            meibo.studentNumber ?? '',
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            '${meibo.name}',
                            style: const TextStyle(fontSize: 14),
                          ),
                      ],
                    ),),
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
                    children: [
                      Text(jokyo.ryaku ?? ''),
                      Text(jokyo.jiyu1 ?? ''),
                    ],
                  ),),
            ],
          ),
        ),
      ),
    );
  }
}
