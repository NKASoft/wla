import 'package:wla/api/api.dart';
import 'package:wla/api_impl/mock_api/mock_api.dart';

class DI {
  static late final Api api;

  static Future<void> init({int artificialCallDelayMSec = 1000}) async {
    await Future.delayed(Duration(milliseconds: artificialCallDelayMSec));

    api = MockApi(artificialCallDelayMSec: 500);
  }
}
