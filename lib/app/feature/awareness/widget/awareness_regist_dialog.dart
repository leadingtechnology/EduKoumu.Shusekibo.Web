import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/awareness/widget/awareness_dialog_left_widget.dart';
import 'package:shusekibo/app/feature/awareness/widget/awareness_dialog_middle_widget.dart';
import 'package:shusekibo/app/feature/awareness/widget/awareness_template_search_student.dart';
import 'package:shusekibo/app/feature/common/widget/seito_widget.dart';
import 'package:shusekibo/app/feature/common/widget/toast_helper.dart';
import 'package:shusekibo/app/widget/awareness/awareness_bunrui_widget.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_provider.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_provider.dart';
import 'package:shusekibo/app/widget/awareness/awareness_operation_item.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AwarenessRegistDialog extends ConsumerWidget {
  AwarenessRegistDialog({
    Key? key,
    required this.kizuki,
    this.opt = AwarenessOperationItem.add,
  }) : super(key: key);

  final AwarenessKizukiModel kizuki;
  final AwarenessOperationItem opt;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final kizukiController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _meiboBox = ref.watch(awarenessMeibosCache);

    bool juyo; //  = ref.watch(awarenessJuyoProvider);
    List<AwarenessMeiboModel> meibos = [];

    // Add Mode
    if (opt == AwarenessOperationItem.add) {
      meibos = _meiboBox.values
          .toList()
          .where((e) => e.selectFlag ?? false)
          .toList();
    }

    // Edit Mode
    if (opt == AwarenessOperationItem.edit) {
      kizukiController.text = '${kizuki.naiyou}';
    }

    // Copy Mode
    if (opt == AwarenessOperationItem.copy) {
      kizukiController.text = '${kizuki.naiyou}';
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Form(
        key: _formKey,
        child: SimpleDialog(
          children: [
            // 1. title
            Text("　気づきの編集",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

            // 2.1 student name
            Divider(color: Colors.grey),
            Container(
              padding: Spacing.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2.1 student list
                  Row(
                    children: [
                      Container(
                        width: 88,
                        alignment: Alignment.centerRight,
                        child: Text(
                          '氏名',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      Spacing.width(12),
                      if (opt == AwarenessOperationItem.add)
                        Expanded(
                            child: SizedBox(
                                width: 600,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      children: meibos
                                          .map((e) => SeitoWidget(
                                                studentName:
                                                    e.studentName ?? '',
                                                studentId: e.studentId ?? 0,
                                                photoUrl: e.photoUrl ?? '',
                                              ))
                                          .toList()),
                                ))),
                      if (opt == AwarenessOperationItem.edit)
                        Expanded(
                            child: SizedBox(
                          width: 600,
                          child: SeitoWidget(
                            studentName: kizuki.studentName ?? '',
                            studentId: kizuki.studentId ?? 0,
                            photoUrl: 'api/images?seitoseq=${kizuki.seitoSeq}',
                          ),
                        )),
                      if (opt == AwarenessOperationItem.copy)
                        Expanded(
                            child: SizedBox(
                          width: 600,
                          child: AwarenessTemplateSearchStudent(),
                        )),
                    ],
                  ),

                  // 2.2 student list
                  Row(children: [
                    Container(
                      width: 88,
                      alignment: Alignment.centerRight,
                      child: Text(
                        '分類',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    Spacing.width(12),
                    Expanded(
                      child: AwarenessBunruiWidget(),
                    ),
                  ]),

                  Spacing.height(8),
                  // 2.3 kizuki
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    AwarenessDialogLeftWidget(
                      kizukiController: kizukiController,
                    ),
                    Spacing.width(12),
                    AwarenessDialogMiddleWidget(
                      controller: kizukiController,
                    ),
                    Spacing.width(12),
                  ]),
                ],
              ),
            ),

            // 3.buttom button
            Divider(color: Colors.grey),
            Container(
                padding: Spacing.fromLTRB(16, 0, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      child: Text(
                        '閉じる',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        ref.read(awarenessStudentAddProvider.notifier).state =
                            [];
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(child: Container()),
                    ElevatedButton(
                        child: Text('保存'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0056d2),
                          padding: Spacing.xy(32, 0),
                        ),
                        onPressed: () async {
                          final FormState? form = _formKey.currentState;
                          if (kizukiController.text == null ||
                              kizukiController.text.isEmpty) {
                            return;
                          }
                          if (ref.watch(awarenessCountProvider) <= 0) {
                            return;
                          }
                          ref.read(awarenessCountProvider.notifier).state = 0;

                          if (opt == AwarenessOperationItem.edit) {
                            ref.read(awarenessEditProvider.notifier).state =
                                kizuki.id!;
                            await ref
                                .read(awarenessKizukiInitProvider.notifier)
                                .patch('${kizukiController.text}');
                          } else {
                            await ref
                                .read(awarenessMeiboInitProvider.notifier)
                                .save('${kizukiController.text}', opt);
                          }
                          ToastHelper.showToast(context, "　保存しました　");
                          Navigator.of(context).pop();
                        }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
