import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/feature/common/widget/base_scaffold_widget.dart';
import 'package:shusekibo/shared/util/spacing.dart';
import 'package:shusekibo/widget/health/health_reason_widget.dart';
import 'package:shusekibo/widget/health/health_stamp_widget.dart';

class DashboardRoute extends PageRouteInfo {
  const DashboardRoute() : super(name, path: '/dashboard');
  static const String name = 'DashboardRoute';
}  

class DashboardPage extends ConsumerWidget {
  DashboardPage({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffoldWidget(
      scaffoldKey: scaffoldKey,
      filter: Container(),
      child: Container(
        padding: Spacing.all(12),
        //decoration: BoxDecoration(color: Colors.red),
        child:Column(
          children: const [
            //DantaiWidget(),
            //GakunenWidget(),
            //ShozokuWidget(),
            HealthStampWidget(),
            HealthReasonWidget(),
          ],
        ),
         
      ),
    );
  }
}

  
