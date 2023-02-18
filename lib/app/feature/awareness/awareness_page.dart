import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shusekibo/app/feature/awareness/widget/awareness_filter_widget.dart';
import 'package:shusekibo/app/feature/awareness/widget/awareness_regist_dialog.dart';
import 'package:shusekibo/app/feature/awareness/widget/awareness_tab.dart';
import 'package:shusekibo/app/feature/common/widget/dialog_util.dart';
import 'package:shusekibo/app/feature/navigation/navigation_bar.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_provider.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_provider.dart';
import 'package:shusekibo/app/widget/common/header_bar.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AwarenessRoute extends PageRouteInfo {
  const AwarenessRoute() : super(name, path: '/awareness');
  static const String name = 'AwarenessRoute';
}       

final showDialogProvider = StateProvider<bool>((ref) => false);

class AwarenessPage extends ConsumerWidget {
  AwarenessPage({super.key, this.screenTitle = '気づき'});

  final String screenTitle;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final kizukiController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(awarenessTabProvider);
    final count = ref.watch(awarenessCountProvider);

    return Scaffold(
      key: scaffoldKey,
      endDrawer: AwarenessFilterWidget(),
      body: Row(
        children: [
          // menu bar
          const SizedBox(
            width: 100,
            child: MyNavigationBar(),
          ),
          Spacing.width(10),
          // screen
          Expanded(
            child: Container(
              padding: Spacing.all(12),
              //decoration: BoxDecoration(color: Colors.red),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // header
                  const HeaderBar(),
                  Spacing.height(8),

                  Expanded(
                      child: AwarenessTab(
                    scaffoldKey: scaffoldKey,
                    onTap: (int e) {
                      ref.read(awarenessTabProvider.notifier).state = e;
                    },
                  ),),
                  Spacing.height(8),
                  //AwarenessFooterBar(),
                  tabIndex == 0
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Container()),
                            OutlinedButton.icon(
                              onPressed: count <= 0
                                  ? null
                                  : () async {
                                      await _handlePressActionButton(context);
                                    },
                              icon: const FaIcon(FontAwesomeIcons.plus),
                              label: const Text(' 気づきの登録 '),
                              style: OutlinedButton.styleFrom(
                                  primary: Colors.black,
                                  backgroundColor: Colors.white,
                                  fixedSize: const Size(180, 36),
                                  side: const BorderSide(
                                      width: 1,
                                      color: Colors.black87,
                                      style: BorderStyle.solid),
                                  shape: const StadiumBorder(),
                                  elevation: 8),
                            ),
                          ],
                        )
                      : Spacing.height(2),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }

  Future<void> _handlePressActionButton(BuildContext context) async {
    await DialogUtil.show(
      context: context,
      builder: (BuildContext context) {
        return AwarenessRegistDialog(
            kizuki: AwarenessKizukiModel(
          id: 0,
        ));
      },
    );
  }
}
