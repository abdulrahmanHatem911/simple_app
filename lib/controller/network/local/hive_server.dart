import 'package:hive_flutter/hive_flutter.dart';

class HiveServer {
  static Future<void> initializeDB() async {
    await Hive.initFlutter();
  }

  Future<void> insertOrUpdateUser(String email, String password) async {
    final userBox = await Hive.openBox('users');

    if (userBox.containsKey(email)) {
      // User exists, update count.
      final dynamic user = userBox.get(email);
      final int currentCount = user['count'];
      userBox.put(email, {
        'email': email,
        'password': password,
        'count': currentCount + 1,
      });
      //close box
      await userBox.close();
    } else {
      userBox.put(email, {
        'email': email,
        'password': password,
        'count': 1,
      });
      //close box
      await userBox.close();
    }
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final userBox = await Hive.openBox('users');
    final List<Map<String, dynamic>> users = [];
    for (var key in userBox.keys) {
      final user = userBox.get(key) as Map<String, dynamic>;
      users.add(user);
    }
    await userBox.close();
    return users;
  }
}
