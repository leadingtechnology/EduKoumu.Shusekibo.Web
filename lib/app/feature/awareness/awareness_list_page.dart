import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/feature/awareness/widget/awareness_regist_dialog.dart';
import 'package:shusekibo/app/feature/awareness/widget/awareness_search_widget.dart';
import 'package:shusekibo/app/feature/common/widget/dialog_util.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_kizuki_provider.dart';
import 'package:shusekibo/app/widget/awareness/awareness_operation_item.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/shared/util/date_util.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AwarenessListRoute extends PageRouteInfo {
  const AwarenessListRoute() : super(name, path: '/awarenesslist');
  static const String name = 'AwarenessListRoute';
}       

class AwarenessListPage extends ConsumerWidget {
  AwarenessListPage({
    Key? key,
    this.screenTitle = '',
    required this.scaffoldKey,
  }) : super(key: key);

  final String screenTitle;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // search bar
        Spacing.height(8),
        AwarenessSearchWidget(scaffoldKey: scaffoldKey),
        //AwarenessListSearchWidget(),
        //AwarenessListSearchWidget(scaffoldKey: scaffoldKey),

        // screen
        Spacing.height(8),
        Expanded(
          child: AwarenessListView(),
        ),

        // footer
      ],
    );
  }
}

class AwarenessListView extends ConsumerWidget {
  AwarenessListView({Key? key}) : super(key: key);

  final List<String> opeItem = [
    'edit',
    '',
    'copy',
    '',
    'delete',
    '',
    'favorite',
    '',
    'template'
  ];
  final Map<String, IconData> opeIcon = {
    'edit': FontAwesomeIcons.pen,
    'copy': FontAwesomeIcons.copy,
    'delete': FontAwesomeIcons.trashCan,
    'favorite': FontAwesomeIcons.star,
    'template': FontAwesomeIcons.fileLines,
  };

  final _baseUrl = dotenv.env['BASE_URL']!;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessToken = ref.read(tokenProvider).access_token.toString();
    final state = ref.watch(awarenessKizukiInitProvider);

    // final String ids = ref.watch(awarenessListIdProvider);
    // final String txt = ref.watch(awarenessListTextProvider);
    // final bool juyo = ref.watch(awarenessListJuyoProvider);

    return state.when(
      blank: Container.new,
      loading: () => const Center(child: CircularProgressIndicator(),), 
      error: (AppException e){ return Text(e.toString());},
      loaded: () {
        final kizuki = ref.watch(awarenessKizukiCache).values.toList();

return ListView.separated(
          padding: EdgeInsets.only(top: 20.0),
          itemBuilder: (context, index) => ListTile(
            leading: ClipOval(
                child: Image.network(
              '${_baseUrl}${kizuki[index].photoUrl}',
              headers: {"Authorization": "Bearer " + accessToken},
            )),
            title: Text('${kizuki[index].studentName}'),
            isThreeLine: true,
            subtitle: Container(
                child: Column(children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text('${kizuki[index].naiyou}')]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${kizuki[index].tourokusyaName ?? ''}'),
                    Spacing.width(10),
                    SizedBox(
                      width: 10,
                      child: Text('|'),
                    ),
                    Text(
                        '${DateUtil.getJapaneseDate(DateTime.parse(kizuki[index].torokuDate ?? ''))}'),
                  ]),
            ])),
            selected: false,
            trailing: popUpMenu(kizuki: kizuki[index]),
          ),
          itemCount: kizuki.length,
          separatorBuilder: (context, index) {
            return Divider(
              height: 0.5,
              indent: 75,
              endIndent: 20,
            );
          },
        );        

    
      },
    );
  }
}

class popUpMenu extends ConsumerWidget {
  popUpMenu({
    Key? key,
    required this.kizuki,
  }) : super(key: key);

  final AwarenessKizukiModel kizuki;
  final TextStyle style = TextStyle(fontSize: 14);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<AwarenessOperationItem>(
      onSelected: (AwarenessOperationItem opt) async {
        await _handlePressActionButton(context, kizuki, opt, ref);
      },
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<AwarenessOperationItem>>[
        PopupMenuItem<AwarenessOperationItem>(
          value: AwarenessOperationItem.edit,
          child: Row(
            children: [
              SizedBox(
                  width: 24,
                  child: Center(child: FaIcon(FontAwesomeIcons.pen, size: 18))),
              Spacing.width(8),
              Text('気づきの編集', style: style),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<AwarenessOperationItem>(
          value: AwarenessOperationItem.copy,
          child: Row(
            children: [
              SizedBox(
                  width: 24,
                  child:
                      Center(child: FaIcon(FontAwesomeIcons.copy, size: 18))),
              Spacing.width(8),
              Text('気づきのコピー', style: style),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<AwarenessOperationItem>(
          value: AwarenessOperationItem.delete,
          child: Row(
            children: [
              SizedBox(
                  width: 24,
                  child: Center(
                      child: FaIcon(FontAwesomeIcons.trashCan, size: 18))),
              Spacing.width(8),
              Text('削除', style: style),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<AwarenessOperationItem>(
          value: AwarenessOperationItem.favorite,
          child: Row(
            children: [
              SizedBox(
                  width: 24,
                  child:
                      Center(child: FaIcon(FontAwesomeIcons.star, size: 18))),
              Spacing.width(8),
              Text('「テンプレート文(個人)」登録', style: style),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<AwarenessOperationItem>(
          value: AwarenessOperationItem.template,
          child: Row(
            children: [
              SizedBox(
                  width: 24,
                  child: Center(
                      child: FaIcon(FontAwesomeIcons.fileLines, size: 18))),
              Spacing.width(8),
              Text('「テンプレート文(学校共通)」登録',
                  style: TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ],
    );
  }
}

Future<void> _handlePressActionButton(
    BuildContext context,
    AwarenessKizukiModel kizuki,
    AwarenessOperationItem opt,
    WidgetRef ref) async {
  //if (opt == AwarenessOperationItem.edit)
  //  await ref.read(awarenessMeiboListProvider.notifier).updateById(id);

  if (opt == AwarenessOperationItem.copy || opt == AwarenessOperationItem.edit)
  
    await DialogUtil.show(
      context: context,
      builder: (BuildContext context) {
        return AwarenessRegistDialog(kizuki: kizuki, opt: opt);
      },
    );

    

  if (opt == AwarenessOperationItem.delete) {
    await ref.read(awarenessKizukiInitProvider.notifier).delete(kizuki.id??0);
  }

  if(opt == AwarenessOperationItem.copy){
    await ref.read(awarenessKizukiInitProvider.notifier).fetch();
  }

}
