import 'package:flutter/material.dart';
import 'package:shusekibo/app/feature/awareness/awareness_list_page.dart';
import 'package:shusekibo/app/feature/awareness/awareness_seats_page.dart';
import 'package:shusekibo/app/widget/common/globals.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AwarenessTab extends StatefulWidget {
  const AwarenessTab({Key? key, required this.scaffoldKey, required this.onTap})
      : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Function onTap;

  @override
  State<AwarenessTab> createState() => _AwarenessTabState();
}

class _AwarenessTabState extends State<AwarenessTab>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);

    tabController = _tabController;
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
              onTap: (e) {
                widget.onTap(e);
              },
              isScrollable: true,
              labelPadding: Spacing.x(24),
              labelColor: Theme.of(context).colorScheme.primary,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Theme.of(context).colorScheme.primary,
              //indicator: CircleTabIndicator(color: Colors.red, radius: 5),
              tabs: [
                Tab(
                    child: Text('本日の様子',
                        style: TextStyle(fontFamily: 'NotoSansJP'))),
                Tab(
                    child: Text('最近の気づき',
                        style: TextStyle(fontFamily: 'NotoSansJP'))),
              ]),

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
