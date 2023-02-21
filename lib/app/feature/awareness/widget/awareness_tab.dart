import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/awareness/awareness_list_page.dart';
import 'package:shusekibo/app/feature/awareness/awareness_seats_page.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_provider.dart';
import 'package:shusekibo/app/widget/common/globals.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AwarenessTab extends ConsumerStatefulWidget {
  const AwarenessTab({Key? key, required this.scaffoldKey, required this.onTap})
      : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Function onTap;

  @override
  ConsumerState<AwarenessTab> createState() => _AwarenessTabState();
}

class _AwarenessTabState extends ConsumerState<AwarenessTab>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      ref.read(awarenessTabProvider.notifier).state = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          TabBar(
              controller: _tabController,
              onTap: (e) {},
              isScrollable: true,
              labelPadding: Spacing.x(24),
              labelColor: Theme.of(context).colorScheme.primary,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Theme.of(context).colorScheme.primary,
              //indicator: CircleTabIndicator(color: Colors.red, radius: 5),
              tabs: const [
                Tab(
                    child: Text('本日の様子',
                        style: TextStyle(fontFamily: 'NotoSansJP'),),),
                Tab(
                    child: Text('最近の気づき',
                        style: TextStyle(fontFamily: 'NotoSansJP'),),),
              ],),

          // tab container
          Container(
            height: 640,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                AwarenessSeatPage(
                  scaffoldKey: widget.scaffoldKey,
                ),
                AwarenessListPage(
                  scaffoldKey: widget.scaffoldKey,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
