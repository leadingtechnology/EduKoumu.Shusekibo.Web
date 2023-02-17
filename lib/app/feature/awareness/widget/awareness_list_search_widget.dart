import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_model.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/shared/util/spacing.dart';



class AwarenessListSearchWidget extends ConsumerWidget {
  const AwarenessListSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FilterModel filter = ref.watch(filterProvider);

    final juyo = ref.watch(awarenessListJuyoProvider);
    final txt = ref.watch(awarenessListTextProvider);
    final ids = ref.watch(awarenessListIdProvider);

    final _txtController = TextEditingController();
    final _idsController = TextEditingController();
    

    return Container(
        padding: Spacing.fromLTRB(4, 0, 4, 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Container(
                      padding: Spacing.right(8),
                      alignment: Alignment.centerRight,
                      child: const Text('氏名'),
                    ),
                    Expanded(
                      child: Container(
                          padding: Spacing.x(4),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: TextField(
                            controller: _idsController,
                            // onChanged:(e){
                            //   if(e.length > 0)(
                            //     ref.read(awarenessListIdProvider.notifier).state = e
                            //   );
                            // },
                          )
                        ),
                    )
                  ],
                )),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Container(
                      padding: Spacing.right(8),
                      alignment: Alignment.centerRight,
                      child: Text('気づき'),
                    ),
                    Expanded(
                      child: Container(
                          padding: Spacing.x(4),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: TextField(
                            controller: _txtController,
                            maxLines: 1,
                            // onChanged:(String e){
                            //   if(e.length > 0)(
                            //     ref.read(awarenessListTextProvider.notifier).state = e
                            //   );
                            // }
                          )
                      ),
                    )
                  ],
                )),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
                flex: 4,
                child: Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: CheckboxListTile(
                        title: Text("重要"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: juyo,
                        onChanged: (bool? v) {
                          ref.read(awarenessListJuyoProvider.notifier).state = v!;
                          //ref.read(filterProvider.notifier).update();
                        }
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    )
                  ],
                )),
            Expanded(
              flex: 2,
              child: Container()
            ),
            Expanded(
                flex: 1,
                child: SizedBox(width: 1,),
            ),
          ],
        ));
  }
}

