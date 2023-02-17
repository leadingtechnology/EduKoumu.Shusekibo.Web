import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/widget/health/health_meibo_model.dart';
import 'package:shusekibo/app/widget/health/health_meibo_provider.dart';
import 'package:shusekibo/app/widget/health/health_reason_provider.dart';
import 'package:shusekibo/app/widget/health/health_stamp_provider.dart';
import 'package:shusekibo/app/widget/health/health_status_model.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class HealthSeatWidget extends ConsumerWidget {
  HealthSeatWidget({Key? key, required this.index, required this.meibo})
      : super(key: key);

  final int index;
  final HealthMeiboModel meibo;
  final _baseUrl = dotenv.env['BASE_URL']!;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stamp = ref.watch(healthStampProvider);
    final reason1 = ref.watch(healthReason1Provider);
    final reason2 = ref.watch(healthReason2Provider);

    Color color;
    final url = '$_baseUrl${meibo.photoUrl}';
    final accessToken = ref.read(tokenProvider).access_token.toString();

    late HealthStatusModel Jokyo;
    if (meibo.jokyoList != null && meibo.jokyoList![0] != null) {
      Jokyo = meibo.jokyoList![0];
    } else {
      Jokyo = const HealthStatusModel();
    }

    if (Jokyo.jokyoCode == '' || Jokyo.jokyoCode == null) {
      color = Theme.of(context).colorScheme.errorContainer;
    } else if (Jokyo.jokyoCode != '100') {
      color = Theme.of(context).colorScheme.primaryContainer;
    } else {
      color = Colors.grey.withAlpha(50);
    }

    return GestureDetector(
      onTap: () async {
        await ref.read(healthMeiboInitProvider.notifier).updateById(
              meibo,
              stamp,
              reason1,
              reason2,
            );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
        child: DecoratedBox(
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
                      )),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(meibo.studentNumber ?? '',
                            style: const TextStyle(fontSize: 12)),
                        Text('${meibo.name}',
                            style: const TextStyle(fontSize: 14)),
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
                      AutoSizeText(
                        '${Jokyo.jiyu1 ?? ''}${Jokyo.jiyu2 ?? ''}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
