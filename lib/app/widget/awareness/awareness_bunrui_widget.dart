import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/widget/awareness/awareness_bunrui_provider.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

class AwarenessBunruiWidget extends ConsumerWidget {
  const AwarenessBunruiWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(awarenessBunruiInitProvider);

    return state.when(
      loading: () {return Container();},
      error: (AppException error) {return Text('$error');},
      loaded: () {
        final token = ref.watch(tokenProvider);
        final bunruiList = ref.watch(bunruiCache)['${token.LoginId}'];
        final gValue = ref.watch(awarenessBunruiProvider);

        return Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          runSpacing: 4,
          children: bunruiList!.map((item) {
            return Container(
              width: 160,
              child: Row(
                children: [
                  Radio(
                    value: item.id ?? 0,
                    groupValue: gValue,
                    onChanged: (selected) {
                      ref.read(awarenessBunruiProvider.notifier).state =
                          item.id ?? 0;
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                        ref.read(awarenessBunruiProvider.notifier).state =
                            item.id ?? 0;
                    },
                    child: Text('${item.name}'),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
