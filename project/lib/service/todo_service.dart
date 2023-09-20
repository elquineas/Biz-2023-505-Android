// import 'dart:async';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:todolist/models/todo.dart';

// // ignore: constant_identifier_names
// const String TBL_TODO = "tbl_todoList";

// /// 안드로이드 ios 공통으로 SQLite 라는 RDBMS 가 내장되어 있다.
// /// 규모는 매우 작지만 phone 에서 DB를 SQL을 사용하여 관리할수 있도록 여러가지 명령어를 제공한다
// /// 기본적인 기능만으로는 다소 불편하여 sqflite.dart를 사용하여 관리한다.

// class TodoService {
//   late Database _database;
//   final String createTable = """
//   CREATE TABLE $TBL_TODO (
//     id INTEGER PRIMARY KEY AUTOINCREMENT,
//     sdate TEXT,
//     stime TEXT,
//     content TEXT,
//     complete INTEGER
//   )
//   """;

//   Future<void> onCreateTable(Database db, int version) {
//     return db.execute(createTable);
//   }

//   Future<void> onUpgradeTable(db, oldVersion, newVersion) async {
//     if (newVersion > oldVersion) {
//       final db = await database;
//       final batch = db.batch();
//       batch.execute("DROP TABLE $TBL_TODO");
//       batch.execute(createTable);
//       await batch.commit();
//     }
//   }

//   Future<Database> initdatabase() async {
//     // 실제 phone 의 DB 가 저장되는 경로 가져오기
//     var dbPath = await getDatabasesPath();
//     // 저장될 database 파일을 설정
//     var dbFile = join(dbPath, "todo.dbf");
//     return await openDatabase(
//       dbFile,
//       onCreate: onCreateTable,
//       onUpgrade: onUpgradeTable,
//       version: 3,
//     );
//     // Future<Database> get database async {}
//   }

//   Future<Database> get database async {
//     _database = await initdatabase();
//     return _database;
//   }

//   Future<int> insert(Todo todo) async {
//     final db = await database;
//     return await db.insert(
//       TBL_TODO,
//       todo.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<int> delete(int id) async {
//     final db = await database;
//     return await db.delete(
//       TBL_TODO,
//       where: "id = ?",
//       whereArgs: [id],
//     );
//   }

//   Future<int> update(Todo todo) async {
//     final db = await database;
//     return db.update(
//       TBL_TODO,
//       todo.toMap(),
//       where: "id = ?",
//       whereArgs: [todo.id],
//     );
//   }

//   Future<List<Todo>> selectAll() async {
//     final db = await database;
//     final List<Map<String, dynamic>> todoList = await db.query(TBL_TODO);

//     return List.generate(
//       todoList.length,
//       (index) => Todo(
//         id: todoList[index]["id"],
//         sdate: todoList[index]["sdate"],
//         stime: todoList[index]["stime"],
//         content: todoList[index]["content"],
//         complete: todoList[index]["complete"] == 1 ? true : false,
//       ),
//     );
//   }
// }
