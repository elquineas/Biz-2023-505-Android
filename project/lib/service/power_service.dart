import 'package:path/path.dart';
import 'package:project/models/power_model.dart';
import 'package:sqflite/sqflite.dart';

const String TBL_POWER = "tbl_power";

class PowerService {
  late Database _database;
  final String createTable = """
  CREATE TABLE $TBL_POWER (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    power INTEGER
  )
  """;

  Future<void> onCreateTable(Database db, int version) {
    return db.execute(createTable);
  }

  Future<Database> initdatabase() async {
    // 실제 phone 의 DB 가 저장되는 경로 가져오기
    var dbPath = await getDatabasesPath();
    // 저장될 database 파일을 설정
    var dbFile = join(dbPath, "power.dbf");
    return await openDatabase(
      dbFile,
      onCreate: onCreateTable,
      onUpgrade: onUpgradeTable,
      version: 3,
    );
    // Future<Database> get database async {}
  }

  Future<Database> get database async {
    _database = await initdatabase();
    return _database;
  }

  Future<void> onUpgradeTable(db, oldVersion, newVersion) async {
    if (newVersion > oldVersion) {
      final db = await database;
      final batch = db.batch();
      batch.execute("DROP TABLE $TBL_POWER");
      batch.execute(createTable);
      await batch.commit();
    }
  }

  Future<int> insert(Power power) async {
    final db = await database;
    return await db.insert(
      TBL_POWER,
      power.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(
      TBL_POWER,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> deleteAll() async {
    final db = await database;
    return await db.delete(
      TBL_POWER,
    );
  }

  Future<int> update(Power power) async {
    final db = await database;
    return db.update(
      TBL_POWER,
      power.toMap(),
      where: "id = ?",
      whereArgs: [power.id],
    );
  }

  Future<List<Power>> selectAll() async {
    final db = await database;
    final List<Map<String, dynamic>> powerList = await db.query(TBL_POWER);

    return List.generate(
      powerList.length,
      (index) => Power(
        id: powerList[index]["id"],
        power: powerList[index]["power"],
      ),
    );
  }
}
