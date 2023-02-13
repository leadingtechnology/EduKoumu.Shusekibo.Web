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
    final healthFilter = ref.watch(healthFilterProvider);

    return Container(
        padding: Spacing.all(4),
        //color: Colors.green[100],
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
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(filter.gakunenRyakusho ?? ''),),
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
                            child: Text(healthFilter.japanDate ?? ''),),
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
