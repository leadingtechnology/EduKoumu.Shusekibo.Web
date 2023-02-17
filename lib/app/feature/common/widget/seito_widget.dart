
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/shared/util/spacing.dart';

class SeitoWidget extends ConsumerWidget {
  SeitoWidget({
    Key? key,
    required this.studentName, 
    required this.studentId,
    required this.photoUrl,
  }) : super(key: key);
  
  final int studentId;
  final String studentName;
  final String photoUrl;
  final _baseUrl = dotenv.env['BASE_URL']!;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String url = '${_baseUrl}${photoUrl}';
    final accessToken = ref.read(tokenProvider).access_token.toString();

    return Row(
      children: [
        Container(
            height: 32,
            child: ClipOval(
              child: Image.network(
                url,
                headers: {"Authorization": "Bearer " + accessToken},
              ),
            )),
        Spacing.width(2),
        Text('$studentName'),
        Spacing.width(4),
      ],
    );
  }
}
