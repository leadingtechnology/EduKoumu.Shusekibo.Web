import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_provider.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AwarenessSeatWidget extends ConsumerWidget {
  AwarenessSeatWidget({Key? key, required this.meibo}) : super(key: key);

  final AwarenessMeiboModel meibo;
  Color changeColor = Colors.black;
  final _baseUrl = dotenv.env['BASE_URL']!;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (meibo.changedFlag != null && meibo.changedFlag == true) {
      changeColor = Colors.blue;
    }

    String url = '${_baseUrl}${meibo.photoUrl}';
    final accessToken = ref.read(tokenProvider).access_token.toString();

    return GestureDetector(
      onTap: () async {
        await ref
            .read(awarenessMeiboInitProvider.notifier)
            .updateByMeibo(meibo);
      },
      child: Stack(
        children: [
          Padding(
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
                              child: Image.network(
                            url,
                            headers: {"Authorization": "Bearer " + accessToken},
                          )),
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('${meibo.shussekiNo ?? ''}',
                                style: TextStyle(fontSize: 12)),
                            Text('${meibo.studentName}',
                                style: TextStyle(fontSize: 14)),
                          ],
                        )),
                      ],
                    ),
                  ),

                  // status bar
                  Spacing.height(4),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(50),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Text('$a1'),
                          meibo.kizukiCount != 0
                              ? const FaIcon(
                                  FontAwesomeIcons.lightbulb,
                                  size: 16,
                                )
                              : Container(),
                          meibo.kizukiCount != 0
                              ? Text(
                                  '${meibo.kizukiCount} 件',
                                  style: TextStyle(color: changeColor),
                                )
                              : Text(' '),
                        ],
                      )),
                ],
              ),
            ),
          ),
          meibo.selectFlag ?? false == true
              ? Opacity(
                  opacity: 0.6,
                  child: Stack(
                    children: [
                      Container(color: Colors.grey[500]),
                    ],
                  ),
                )
              : Container(),
          meibo.selectFlag ?? false == true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacing.height(2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(2.0),
                            alignment: Alignment.topRight,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(90),
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Theme.of(context).primaryColor,
                            )),
                        //Spacing.width(8),
                      ],
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
