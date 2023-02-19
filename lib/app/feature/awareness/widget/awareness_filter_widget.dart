import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_clip_widget.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_clip_widget.dart';
import 'package:shusekibo/shared/util/spacing.dart';



class AwarenessFilterWidget extends ConsumerWidget {
  int selectedLocation = 0, selectedDate = 2, selectedTOD = 1;

  Future _pickDateRange(BuildContext context, WidgetRef ref) async {
    final initialDateRange = DateTimeRange(start: DateTime.now(), end: DateTime.now());

    final newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: initialDateRange,
        firstDate: DateTime(2022, 4, 1),
        lastDate: DateTime(2023, 3, 31),
        locale: const Locale('ja'),
        builder: (context, child) {
            return Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400.0,
                  ),
                  child: child,
                )
              ],
            );
          }
    );

    if (newDateRange != null) {
      ref.read(beginDateProvider.notifier).state = newDateRange.start;
      ref.read(endDateProvider.notifier).state = newDateRange.end;
    } else {
      return;
    }
  }

  Widget build(BuildContext context, WidgetRef ref) {
    int tabIndex = ref.watch(awarenessTabProvider);

    final beginDate = ref.watch(beginDateProvider);
    final endDate = ref.watch(endDateProvider);
    
    ThemeData themeData = Theme.of(context);

    return Container(
        width: 300,
        margin: Spacing.y(16),
        padding: Spacing.xy(24, 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('フィルター'),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: themeData.colorScheme.primary.withAlpha(24),   
                    ),
                    child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.circleCheck,
                        color: themeData.colorScheme.primary,
                      ),
                      onPressed: (){
                        ref.read(filterInitProvider.notifier).update(
                          beginDate: beginDate, 
                          endDate: endDate,
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              //  -- 1 --
              Spacing.height(24),
              const Text('学年'),
              Spacing.height(8),
              Container(
                padding: Spacing.left(12),
                child: const GakunenClipWidget(),
              ),
              Spacing.height(16),
              //  -- 2 --
              const Text('クラス'),
              Spacing.height(8),
              Container(
                padding: Spacing.left(32),
                child: const ShozokuClipWidget(),
              ),
              Spacing.height(16),
              //  -- 3 --
              if (tabIndex != 0) const Text('期間') else Spacing.height(1),
              if (tabIndex != 0) Spacing.height(8) else Spacing.height(1),
              if (tabIndex != 0)
                InkWell(
                  onTap: () async {
                    await _pickDateRange(context, ref);
                  },
                  child: SingleIconChip(
                    text:
                        '${DateFormat.yMd().format(beginDate)} ~ ${DateFormat.yMd().format(endDate)}',
                    iconData: MdiIcons.calendarOutline,
                  ),
                )
              else
                Spacing.height(1),

            ],
          ),
        ));
  }
}

class SingleIconChip extends StatelessWidget {
  const SingleIconChip(
      {super.key,
      required this.iconData,
      required this.text,
      });

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: themeData.colorScheme.primary,
      avatar: Icon(iconData,
          size: 16,
          color: Colors.white,
      ),
      label: Text(text,
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: 0,
            wordSpacing: 0,
          ),),
      padding: Spacing.fromLTRB(12, 6, 12, 6),
    );
  }
}

class DateRange extends StatelessWidget {
  DateRange({ Key? key }) : super(key: key);
   
 

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
