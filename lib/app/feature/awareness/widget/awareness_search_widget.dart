import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_model.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/shared/util/date_util.dart';
import 'package:shusekibo/shared/util/spacing.dart';



class AwarenessSearchWidget extends ConsumerWidget {
  const AwarenessSearchWidget({Key? key, required this.scaffoldKey}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FilterModel filter = ref.watch(filterProvider);

    int tabIndex = ref.watch(awarenessTabProvider);
    String kikan = '${DateUtil.getJapaneseDate(filter.beginDate??DateTime.now())} ~ ${DateUtil.getJapaneseDate(filter.endDate ?? DateTime.now())}';
    if (filter.gakunenRyakusho == null || filter.gakunenRyakusho!.isEmpty){
      kikan = '';
    }

    return Container(
        padding: Spacing.all(4),
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
                      child: Text('学年'),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){scaffoldKey.currentState?.openEndDrawer();},
                        child: Container(
                            padding: Spacing.x(4),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text('${filter.gakunenCode == '0' ? '' : filter.gakunenRyakusho ?? ''}')),
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
                      child: Text('クラス'),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){scaffoldKey.currentState?.openEndDrawer();},
                        child: Container(
                            padding: Spacing.x(4),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text('${filter.className ?? ''}')),
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
                child: Spacing.width(10)),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: IconButton(
                    onPressed: () {
                      ref.read(filterInitProvider.notifier).update();
                    },
                    icon: Icon(Icons.refresh)),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      }, icon: Icon(Icons.tune)),
                )),
          ],
        ));
  }
}
