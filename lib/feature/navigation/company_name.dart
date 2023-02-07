import 'package:flutter/material.dart';

import 'package:shusekibo/shared/util/spacing.dart';

class CompanyName extends StatelessWidget {
  const CompanyName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container (
      //color: Colors.yellow,
      padding: Spacing.fromLTRB(0, 10, 0, 10),
      alignment: Alignment.center,
      child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 20,),
            Image.asset(
              'assets/icons/default_pkg_icon.png',
              width: 60,
              height: 60,
            ),
          ],
        ),
      ],
      ),
    );
  }
}
