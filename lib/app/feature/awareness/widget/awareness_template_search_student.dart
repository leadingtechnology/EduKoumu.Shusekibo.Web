import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/common/widget/seito_widget.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AwarenessTemplateSearchStudent extends ConsumerWidget {
  AwarenessTemplateSearchStudent({Key? key}) : super(key: key);

  final _multiKey = GlobalKey<DropdownSearchState<AwarenessMeiboModel>>();
  
    @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(awarenessMeiboInitProvider);
    
    return state.when(
      blank: Container.new,
      loading: () => const Center(child: CircularProgressIndicator(),), 
      error: (AppException e){
          print('${e.toString()}');
          return Container();
      },
      loaded: () {
        final meibos = ref.watch(awarenessMeibosCache).values.toList();

        return SizedBox(
            width: 300,
            child: DropdownSearch<AwarenessMeiboModel>.multiSelection(
              key: _multiKey,
              onChanged: (List<AwarenessMeiboModel> meibos) async {
                List<int> ids = meibos.map((e) => e.studentId ?? 0).toList();
                ref.read(awarenessStudentAddProvider.notifier).state = ids;
              },
              autoValidateMode: AutovalidateMode.always,
              validator: (List<AwarenessMeiboModel>? v) {
                return v == null || v.isEmpty ? '必須項目です' : null;
              },
              popupProps: PopupPropsMultiSelection.menu(
                showSelectedItems: true,
                itemBuilder: (BuildContext context, AwarenessMeiboModel item,
                    bool isSelected) {
                  return Column(
                    children: [
                      Spacing.height(8),
                      Row(
                        children: [
                          Spacing.width(8),
                          SeitoWidget(
                            studentName: item.studentName ?? '',
                            studentId: item.studentId ?? 0,
                            photoUrl: item.photoUrl ?? '',
                          ),
                        ],
                      ),
                      new Divider(
                        color: Colors.black12,
                      ),
                    ],
                  );
                },
                popupSelectionWidget:
                    (cnt, AwarenessMeiboModel item, bool isSelected) {
                  return isSelected
                      ? Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green[500],
                            ),
                            Spacing.width(4),
                          ],
                        )
                      : Container();
                },

                popupCustomMultiSelectionWidget: (context, list) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: OutlinedButton(
                          onPressed: () {
                            // How should I unselect all items in the list?
                            _multiKey.currentState?.closeDropDownSearch();
                          },
                          child: const Text('取消'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: OutlinedButton(
                          onPressed: () {
                            // How should I select all items in the list?
                            _multiKey.currentState?.popupSelectAllItems();
                          },
                          child: const Text('すべて選択'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: OutlinedButton(
                          onPressed: () {
                            // How should I unselect all items in the list?
                            _multiKey.currentState?.popupDeselectAllItems();
                          },
                          child: const Text('すべてクリア'),
                        ),
                      ),
                    ],
                  );
                },
                //disabledItemFn: (String s) => s.startsWith('I'),
              ),

              dropdownBuilder: (context, selectedItems) {
                Widget item(AwarenessMeiboModel m) => Container(
                      height: 32,
                      padding: EdgeInsets.only(left: 6),
                      margin: EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColorLight,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SeitoWidget(
                            studentName: '${m.studentName}',
                            studentId: m.studentId ?? 0,
                            photoUrl: m.photoUrl ?? '',
                          ),
                          MaterialButton(
                            height: 20,
                            shape: const CircleBorder(),
                            padding: EdgeInsets.all(0),
                            color: Colors.red[200],
                            minWidth: 20,
                            onPressed: () {
                              _multiKey.currentState?.removeItem(m);
                            },
                            child: Icon(
                              Icons.close_outlined,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                    );
                return Wrap(
                  children: selectedItems.map((e) => item(e)).toList(),
                );
              },
              dropdownSearchDecoration: const InputDecoration(
                hintText: "生徒の選択",
                //labelText: "Menu mode multiSelection*",
                contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                border: OutlineInputBorder(),
              ),
              items: meibos,
              showClearButton: true,

              //clearButtonSplashRadius: 20,
              selectedItems: [],
              compareFn: (item, selectedItem) {
                return item.studentId == selectedItem.studentId;
              },
            ),
          );

      }
    );
  
  }
}
