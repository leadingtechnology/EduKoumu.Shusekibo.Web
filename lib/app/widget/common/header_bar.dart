import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_dropdown_widget.dart';
import 'package:shusekibo/shared/util/date_util.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class HeaderBar extends ConsumerWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(tokenProvider);

    return Container(
      //color: Colors.green[100],
      padding: Spacing.fromLTRB(4, 0, 8, 4),
      child: Row(
        children: [
          const DantaiDropdownWidget(),
          Expanded(child: Container()),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(DateUtil.getJapaneseDate(DateTime.now())),
              Spacing.width(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(FontAwesomeIcons.user, size: 16),
                  Spacing.width(10),
                  Text(
                    '${token.UserName}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
