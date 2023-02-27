import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class HealthSearchWidget extends ConsumerWidget {
  const HealthSearchWidget({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterProvider);

    return Container(
        padding: Spacing.all(4),
        //color: Colors.green[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Container(
                      padding: Spacing.right(8),
                      alignment: Alignment.centerRight,
                      child: const Text('学年'),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                        child: Container(
                            padding: Spacing.x(4),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text( 
                              '${filter.gakunenCode == '0' ? '' : filter.gakunenRyakusho ?? ''}',
                            ),
                        ),
                      ),
                    )
                  ],
                ),),
            Expanded(
              child: Container(),
            ),
            Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Container(
                      padding: Spacing.right(8),
                      alignment: Alignment.centerRight,
                      child: const Text('クラス'),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                        child: Container(
                            padding: Spacing.x(4),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(filter.className ?? ''),),
                      ),
                    )
                  ],
                ),),
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: const Color(0xFF2D4E27),
                      value: filter.kouryuGakkyu ?? false,
                      onChanged: (v) {},
                    ),
                    const Text('交流学級で表示')
                  ],
                ),
              ),
            ),                
            Expanded(
              child: Container(),
            ),
            Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Container(
                      padding: Spacing.right(8),
                      alignment: Alignment.centerRight,
                      child: const Text('対象日'),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                        child: Container(
                            padding: Spacing.x(4),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(filter.japanDate ?? ''),),
                      ),
                    )
                  ],
                ),),
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
                    icon: const Icon(Icons.refresh),),
              ),
            ),
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                      icon: const Icon(Icons.tune),),
                ),),
          ],
        ),);
  }
}
