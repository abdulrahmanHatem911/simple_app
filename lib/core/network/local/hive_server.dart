// class HiveServer {
//   static const String _boxName = 'hive_server';

//   static Future<void> saveServer(Server server) async {
//     final box = await Hive.openBox<Server>(_boxName);
//     await box.put('server', server);
//   }

//   static Future<Server?> getServer() async {
//     final box = await Hive.openBox<Server>(_boxName);
//     return box.get('server');
//   }

//   static Future<void> deleteServer() async {
//     final box = await Hive.openBox<Server>(_boxName);
//     await box.delete('server');
//   }
// }
// ```