import 'package:get_it/get_it.dart';
import 'package:simple_app/core/network/local/sql_server.dart';

class ServiceLocator {
  static final GetIt instance = GetIt.instance;

  static Future<void> init() async {
    //helper
    instance.registerLazySingleton(() => SqliteService());
  }
}
