import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/common/widget/base_scaffold_widget.dart';
import 'package:shusekibo/app/feature/health/widget/health_filter_widget.dart';
import 'package:shusekibo/app/feature/health/widget/health_footer_bar.dart';
import 'package:shusekibo/app/feature/health/widget/health_search_widget.dart';
import 'package:shusekibo/app/feature/health/widget/health_seat_widget.dart';
import 'package:shusekibo/app/feature/health/widget/health_stamp_reason_widget.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/common/header_bar.dart';
import 'package:shusekibo/app/widget/health/health_meibo_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class HealthSeatsRoute extends PageRouteInfo {
  const HealthSeatsRoute() : super(name, path: '/healthseats');
  static const String name = 'HealthSeatsRoute';
}       

class HealthSeatsPage extends ConsumerWidget {
  HealthSeatsPage({super.key, this.screenTitle = ''});

  final String screenTitle;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffoldWidget(
      scaffoldKey: scaffoldKey,
      filter: HealthFilterWidget(),
      child: Container(
        padding: Spacing.all(12),
        //decoration: BoxDecoration(color: Colors.red),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // header
            const HeaderBar(),

            Spacing.height(8),
            // search bar
            HealthSearchWidget(scaffoldKey: scaffoldKey),

            // screen
            Spacing.height(8),
            Expanded(
                child: Column(children: [
              // Icon Bar
              const HealthStampReasonWidget(),
              Spacing.height(16),

              Expanded(
                //child: Container(),
                child: Container(
                  color: Colors.grey[100],
                  padding: Spacing.all(16),
                  child: const HealthSeatsGridView(),
                ),
              ),
              // tools bar
            ],),),

            // footer
            Spacing.height(8),
            const HealthFooterBar(
              buttnoName: '一覧',
              menuId: 31,
            ),
            Spacing.height(8),
          ],
        ),
      ),
    );
  }
}

class HealthSeatsGridView extends ConsumerWidget {
  const HealthSeatsGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(healthMeiboInitProvider);

    return state.when(
      blank:  Container.new,
      loading: () => const Center(child: CircularProgressIndicator(),), 
      error: (AppException e){
          print('${e.toString()}');
          
          return Container();
      },
      loaded: (){
        final meibosmap = ref.watch(healthMeibosCache);
        
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 2,
          ),
          itemCount: meibosmap.length,
          itemBuilder: (BuildContext context, int index) {
            return HealthSeatWidget(
              index: index,
              meibo: meibosmap.values.elementAt(index),
            );
          },
        );
      }, 
    );
  }
}
