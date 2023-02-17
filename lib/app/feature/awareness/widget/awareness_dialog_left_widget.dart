import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shusekibo/app/feature/common/widget/dialog_util.dart';
import 'package:shusekibo/app/feature/common/widget/speech_input.dart';
import 'package:shusekibo/shared/util/spacing.dart';


class AwarenessDialogLeftWidget extends StatelessWidget {
   AwarenessDialogLeftWidget({
    Key? key, required this.kizukiController
  }) : super(key: key);

  final TextEditingController kizukiController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 88, child: Column(crossAxisAlignment: CrossAxisAlignment.end,  children: [
      const Text('気づき', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      
      Spacing.height(24),
      IconButton(icon: FaIcon(FontAwesomeIcons.microphone), onPressed: () async{
        await DialogUtil.show(
          context: context,
          builder: (BuildContext context) {
            return SpeechInput(kizukiController);
          },
        );
      }),
      

      Spacing.height(24),
      
      Spacing.height(24),
      

    ],));
  }
}

