import 'package:shusekibo/gen/assets.gen.dart';
import 'package:shusekibo/start.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: Assets.env.envProduction);
  await start();
}
