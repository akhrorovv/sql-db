import 'package:sql_db/services/sql_service.dart';

class RootService {
  static Future<void> init() async {
    await SqlService.init();
  }
}