import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shusekibo/shared/util/date_util.dart';
import 'package:shusekibo/shared/util/spacing.dart';
import 'package:shusekibo/widget/dantai/dantai_widget.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green[100],
      padding: Spacing.fromLTRB(4, 0, 8, 4),
      child: Row(
        children: [
          const DantaiWidget(),
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
                  const Text(
                    'test',
                    style: TextStyle(fontSize: 16),
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
