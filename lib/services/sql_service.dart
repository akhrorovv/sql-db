import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_db/models/credit_card_model.dart';

class SqlService {
  static const _databaseName = "my_sql.db";
  static const _databaseVersion = 1;

  static Database? _database;

  static Future<void> init() async {
    _database = await _initDatabase();
  }

  static _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  static Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
        CREATE TABLE creditCard (
          cardNumber TEXT NOT NULL,
          expiredDate TEXT NOT NULL,
          cardType TEXT NOT NULL,
          cardImage TEXT NOT NULL
         )''',
    );
  }

  static Future<CreditCard> createCreditCard(CreditCard creditCard) async {
    Database db = _database!;
    await db.insert("creditCard", creditCard.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return creditCard;
  }

  static Future<List<CreditCard>> fetchCreditCards() async {
    Database db = _database!;
    List<Map<String, dynamic>> results = await db.query("creditCard");

    List<CreditCard> cards = [];
    results.forEach((result) {
      CreditCard creditCard = CreditCard.fromMap(result);
      cards.add(creditCard);
    });
    return cards;
  }

  // static Future<CreditCard> fetchCreditCard(int id) async {
  //   Database db = _database!;
  //   List<Map> results =
  //   await db.query("creditCard", where: "id = ?", whereArgs: [id]);
  //
  //   CreditCard creditCard = CreditCard.fromMap(results[0]);
  //   return creditCard;
  // }

  static Future<int> deleteCreditCard(int id) async {
    Database db = _database!;
    return await db.delete("creditCard", where: "id = ?", whereArgs: [id]);
  }
}
