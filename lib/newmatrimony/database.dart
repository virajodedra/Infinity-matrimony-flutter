// import 'dart:async';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'user_class.dart';
//
// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._init();
//   static Database? _database;
//
//   DatabaseHelper._init();
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB('users.db');
//     return _database!;
//   }
//
//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);
//
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createDB,
//     );
//   }
//
//   Future<void> _createDB(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE users (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT NOT NULL,
//         gender TEXT,
//         dob TEXT,
//         maritalStatus TEXT,
//         country TEXT,
//         state TEXT,
//         city TEXT,
//         religion TEXT,
//         caste TEXT,
//         subCaste TEXT,
//         education TEXT,
//         occupation TEXT,
//         email TEXT,
//         phone TEXT,
//         isFavorite INTEGER NOT NULL DEFAULT 0
//       )
//     ''');
//   }
//
//   Future<int> insertUser(User user) async {
//     final db = await database;
//     return await db.insert('users', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
//   }
//
//   Future<List<User>> fetchUsers() async {
//     final db = await database;
//     final result = await db.query('users');
//     return result.map((json) => User.fromMap(json)).toList();
//   }
//
//   Future<int> updateUser(User user) async {
//     final db = await database;
//     return await db.update('users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
//   }
//
//   Future<int> deleteUser(int id) async {
//     final db = await database;
//     return await db.delete('users', where: 'id = ?', whereArgs: [id]);
//   }
// }
