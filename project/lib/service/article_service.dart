import 'package:path/path.dart';
import 'package:project/models/article_model.dart';
import 'package:sqflite/sqflite.dart';

const String TBL_ARTICLE = "tbl_aricleList";

class ArticleService {
  late Database _database;
  final String createTable = """
  CREATE TABLE $TBL_ARTICLE (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    aName TEXT,
    aCount TEXT,
    aDate TEXT
  )
  """;

  Future<void> onCreateTable(Database db, int version) {
    return db.execute(createTable);
  }

  Future<Database> initdatabase() async {
    // 실제 phone 의 DB 가 저장되는 경로 가져오기
    var dbPath = await getDatabasesPath();
    // 저장될 database 파일을 설정
    var dbFile = join(dbPath, "article.dbf");
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
      batch.execute("DROP TABLE $TBL_ARTICLE");
      batch.execute(createTable);
      await batch.commit();
    }
  }

  Future<int> insert(Article article) async {
    final db = await database;
    return await db.insert(
      TBL_ARTICLE,
      article.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(
      TBL_ARTICLE,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> deleteAll() async {
    final db = await database;
    return await db.delete(
      TBL_ARTICLE,
    );
  }

  Future<int> update(Article article) async {
    final db = await database;
    return db.update(
      TBL_ARTICLE,
      article.toMap(),
      where: "id = ?",
      whereArgs: [article.id],
    );
  }

  Future<List<Article>> selectAll() async {
    final db = await database;
    final List<Map<String, dynamic>> articleList = await db.query(TBL_ARTICLE);

    return List.generate(
      articleList.length,
      (index) => Article(
        id: articleList[index]["id"],
        aName: articleList[index]["aName"],
        aDate: articleList[index]["aDate"],
        aCount: articleList[index]["aCount"],
      ),
    );
  }
}
