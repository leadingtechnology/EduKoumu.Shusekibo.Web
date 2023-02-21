import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/awareness/widget/awareness_search_widget.dart';
import 'package:shusekibo/app/feature/awareness/widget/awareness_seat_widget.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class AwarenessSeatsRoute extends PageRouteInfo {
  const AwarenessSeatsRoute() : super(name, path: '/awarenessseats');
  static const String name = 'AwarenessSeatsRoute';
}       

class AwarenessSeatPage extends ConsumerWidget {
  const AwarenessSeatPage({Key? key, required this.scaffoldKey})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacing.height(8),
        // search bar
        AwarenessSearchWidget(scaffoldKey: scaffoldKey),

        // screen
        Spacing.height(8),
        Expanded(
            child: Column(children: [
          Expanded(
            child: Container(
                color: Colors.grey[100],
                padding: Spacing.all(16),
                child: AwarenessSeats()),
          ),
          // tools bar
        ])),
      ],
    );
  }
}

class AwarenessSeats extends ConsumerWidget {
  AwarenessSeats({Key? key}) : super(key: key);

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
          
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 2,
            ),
            itemCount: meibos.length,
            itemBuilder: (BuildContext context, int index) {
              return AwarenessSeatWidget(
                meibo: meibos[index],
              );
            },
          );


    });
  }
}
