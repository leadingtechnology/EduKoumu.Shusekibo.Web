import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_clip_widget.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_clip_widget.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/shared/util/spacing.dart';


class HealthFilterWidget extends ConsumerWidget {
  HealthFilterWidget({super.key});

  int selectedLocation = 0;
  int electedDate = 2;
  int selectedTOD = 1;

  _pickDate(BuildContext context, WidgetRef ref) async {
    
    final selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022, 4, 1),
        lastDate: DateTime(2023, 3, 31))
    ;
    
    if (selected != null){
      ref.read(healthFilterDateProvider.notifier).state = selected;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetDate = ref.watch(healthFilterDateProvider);
    
    final themeData = Theme.of(context);

    return Container(
        width: 300,
        margin: Spacing.y(16),
        padding: Spacing.xy(24, 16),
        decoration: const BoxDecoration(
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
                      ref
                          .read(filterInitProvider.notifier)
                          .updateFilter(targetDate: targetDate);
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
              // -- 3 --
              const Text('対象日'),
              Spacing.height(8),
              Container(
                padding: Spacing.left(32),
                child: InkWell(
                  onTap: () {
                    _pickDate(context, ref);
                  },                  
                  child: SingleIconChip(
                      isSelected: false,
                      text: DateFormat.yMd().format(targetDate),
                      iconData: MdiIcons.calendarOutline,),
                ),

              ),
         
            ],
          ),
        ),);
  }
}

class SingleIconChip extends StatelessWidget {
  const SingleIconChip(
      {super.key,
      required this.iconData,
      required this.text,
      required this.isSelected,});

  final IconData iconData;
  final String text;
  final bool isSelected;

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
