import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shusekibo/app/widget/dashboard/home_attendance_model.dart';
import 'package:shusekibo/app/widget/dashboard/home_attendance_provider.dart';
import 'package:shusekibo/app/widget/dashboard/home_health_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class DashboardSummaryTab extends StatefulWidget {
  const DashboardSummaryTab({super.key});

  @override
  State<DashboardSummaryTab> createState() => _DashboardSummaryTabState();
}

class _DashboardSummaryTabState extends State<DashboardSummaryTab>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final tabController = TabController(length: 2, vsync: this);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          TabBar(
              controller: tabController,
              isScrollable: true,
              //labelPadding: Spacing.x(24),
              labelColor: Theme.of(context).colorScheme.primary,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Theme.of(context).colorScheme.primary,
              //indicator: CircleTabIndicator(color: Colors.red, radius: 5),
              tabs: const [
                Tab(child: Text( '出席簿', style: TextStyle(fontFamily: 'NotoSansJP'))),
                Tab(child: Text('健康観察簿', style: TextStyle(fontFamily: 'NotoSansJP'))),
              ],),
          // tab container
          SizedBox(
            height: 500,
            child: TabBarView(
              controller: tabController,
              children: const [
                AttendanceSummary(),
                HealthSummary(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HealthSummary extends ConsumerWidget {
  const HealthSummary({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeHealthListProvider);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (AppException e){ return Text(e.toString()); },
      loaded: (healthList){
        return SingleChildScrollView(
          child: Column(
            children: healthList.map((e){
              String inputStates;
              var inputColor = Colors.pink[100];

              if (e.shusseki! > 0) {
                inputStates = '　済　';
                inputColor = Colors.greenAccent[100];
              } else {
                inputStates = '　未　';
                inputColor = Colors.pink[100];
              }


              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacing.height(4),
                  SizedBox(width: 520, child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    alignment: Alignment.center,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,  children: [
                      Spacing.height(8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacing.width(12),
                          FaIcon(FontAwesomeIcons.stethoscope, size: 16,),
                          Spacing.width(8),
                          Text('${e.className}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          Spacing.width(16),
                          Container(
                              decoration: BoxDecoration(
                                color: inputColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text('$inputStates'),
                          ),
                        ],
                      ),
                      Spacing.height(8),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,   children: [
                        Column(
                          children: [
                            Text('出席'),Spacing.height(4),
                            Text('${e.shusseki}', style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Container(color:Colors.grey, height: 45, child: VerticalDivider(width: 1)),
                        Column(
                          children: [
                            Text('遅刻' ),Spacing.height(4),
                            Text('${e.tikoku}', style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Container(color:Colors.grey, height: 45, child: VerticalDivider(width: 1)),
                        Column(
                          children: [
                            Text('早退' ),Spacing.height(4),
                            Text('${e.sotai}', style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Container(color:Colors.grey, height: 45, child: VerticalDivider(width: 1)),
                        Column(
                          children: [
                            Text('欠席・出停等' ),Spacing.height(4),
                            Text('${e.kessekiShuttei}', style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Container(color:Colors.grey, height: 45, child: VerticalDivider(width: 1)),
                        Column(
                          children: [
                            Text('インフルエンザ' ),Spacing.height(4),
                            Text('${e.influenza}', style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],)
                      
                    ]),
                  )),
                ]
              );
              //return HealthSummaryWidget(model: e,);
            }).toList(),
          ),
        );
      }
    );
  }
}

class AttendanceSummary extends ConsumerWidget {
  const AttendanceSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeAttendanceListProvider);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (AppException e){ return Container(child: Text('${e.toString()}'),); },
      loaded: (attendanceList){
        return SingleChildScrollView(
          child: Column(
            children: attendanceList.map((e){
              
              String inputStates;
              Color? inputColor = Colors.pink[100];
              
              if (e.shusseki! > 0){
                inputStates = '　済　';
                inputColor = Colors.greenAccent[100];
              }else{
                inputStates = '　未　';
                inputColor = Colors.pink[100];
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacing.height(4),
                  SizedBox(
                    height: 94,
                    width: 520,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow[100],
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacing.height(8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Spacing.width(12),
                                FaIcon(FontAwesomeIcons.clipboard, size: 16, ),
                                Spacing.width(8),
                                Text(
                                  '${e.className}',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Spacing.width(16),
                                Container(
                                  decoration: BoxDecoration(
                                    color: inputColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text('$inputStates'),
                                ),
                              ],
                            ),
                            Spacing.height(8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    const Text('出席'),
                                    Spacing.height(4),
                                    Text('${e.shusseki}', style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Container(
                                    color: Colors.grey,
                                    height: 45,
                                    child: VerticalDivider(width: 1)),
                                Column(
                                  children: [
                                    const Text('遅刻'),
                                    Spacing.height(4),
                                    Text('${e.tikoku}', style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Container(
                                    color: Colors.grey,
                                    height: 45,
                                    child: VerticalDivider(width: 1)),
                                Column(
                                  children: [
                                    const Text('早退'),
                                    Spacing.height(4),
                                    Text('${e.sotai}', style: TextStyle(fontWeight: FontWeight.bold),),
                                    Spacing.height(4),
                                  ],
                                ),
                                Container(
                                    color: Colors.grey,
                                    height: 45,
                                    child: VerticalDivider(width: 1)),
                                Column(
                                  children: [
                                    const Text('欠席・出停等'),
                                    Spacing.height(4),
                                    Text('${e.kessekiShuttei}', style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
    ); 
  }
}

class AttendanceSummaryWidget extends StatelessWidget {
  const AttendanceSummaryWidget({super.key, required this.model});

  final HomeAttendanceModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacing.height(12),
        SizedBox(
          height: 90,
          width: 520,
          child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(3),
              ),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacing.height(4),
                  Row(
                    children: [
                      Spacing.width(12),
                      const FaIcon(
                        FontAwesomeIcons.clipboard,
                        size: 16,
                      ),
                      Spacing.width(8),
                      Text(
                        '${model.className}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                  Spacing.height(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('出席'),
                          Spacing.height(4),
                          Text('${model.shusseki}', style: const TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Container(
                          color: Colors.grey,
                          height: 45,
                          child: const VerticalDivider(width: 1),),
                      Column(
                        children: [
                          const Text('遅刻'),
                          Spacing.height(4),
                          Text('${model.tikoku}', style: const TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Container(
                          color: Colors.grey,
                          height: 45,
                          child: const VerticalDivider(width: 1),),
                      Column(
                        children: [
                          const Text('早退'),
                          Spacing.height(4),
                          Text('${model.sotai}', style: const TextStyle(fontWeight: FontWeight.bold),),
                          Spacing.height(4),
                        ],
                      ),
                      Container(
                          color: Colors.grey,
                          height: 45,
                          child: const VerticalDivider(width: 1),),
                      Column(
                        children: [
                          const Text('欠席・出停等'),
                          Spacing.height(4),
                          Text('${model.kessekiShuttei}', style: const TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Container(
                          color: Colors.grey,
                          height: 45,
                          child: VerticalDivider(width: 1)),
                      Column(
                        children: [
                          const Text('インフルエンザ'),
                          Spacing.height(4),
                          Text('${model.influenza}', style: const TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  )
                ],
              )),
        ),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }
}
