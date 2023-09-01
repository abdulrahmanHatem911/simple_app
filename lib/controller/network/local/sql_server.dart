import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService {
// creating database table
  Future<Database> initializeDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'database.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute(
      "CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,email TEXT NOT NULL,password TEXT NOT NULL,count INTEGER)",
    )
        .then((value) {
      print('Created table🎉');
    });
  }

  Future<int> userLogin(String email, String password) async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('users');
    bool isExist = false;
    for (var item in maps) {
      if (item['email'] == email && item['password'] == password) {
        isExist = true;
        break;
      }
    }
    if (isExist) {
      //update count
      await db.rawUpdate(
          'UPDATE users SET count = count + 1 WHERE email = ?', [email]);
      print("🚨count updated");
      return 1;
    } else {
      await db
          .insert(
        'users',
        {
          'email': email,
          'password': password,
          'count': 1,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      )
          .then((value) {
        print('inserted item✅');
      });
      return 1;
    }
  }

  //get all user data
  Future<List<Map<String, dynamic>>> getAllUser() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('users');
    return maps;
  }
}
