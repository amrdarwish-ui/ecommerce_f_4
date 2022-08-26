import 'package:ecommerce1/models/cart_pruduct_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  factory DBHelper() => _instance;
  DBHelper.internal();
  static Database? _db;
  createDatabase() async {
    if (_db != null) {
      return _db;
    }
    String path = join(await getDatabasesPath(), 'cart.db');
    _db = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
          'create table pruducts(id integer primary key autoincrement ,name text , image text, price integer, count integer)');
    });
    return _db;
  }

  Future<int> createPruduct(CartPruductModel model) async {
    Database db = await createDatabase();
    return db.insert('pruducts', model.toMap()).then((value) {
      print('the id is $value');
      return value;
    });
  }

  Future<List<Map<String, Object?>>> allPruducts() async {
    Database db = await createDatabase();
    return db.query('pruducts');
  }

  Future<int> delete(int id) async {
    Database db = await createDatabase();
    return db.delete('pruducts', where: 'id = ?', whereArgs: [id]);
  }

  void clearTable() async {
    Database db = await createDatabase();
    db.execute('delete from pruducts');
  }

  Future<int> update(CartPruductModel model) async {
    Database db = await createDatabase();
    return db.update('pruducts', model.toMap(),
        where: 'id = ?', whereArgs: [model.id]);
  }
}
