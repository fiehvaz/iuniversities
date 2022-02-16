import 'package:iuniversities/database/app_database.dart';

import 'package:iuniversities/models/post_model.dart';

import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String _tableName = 'universities';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _stateprovince = 'stateprovince';
  //static const String _domains = 'domains';
  static const String _webPagesF = 'webPagesF';
  static const String _countrie = 'countrie';
  static const String _fav = 'fav';

  static const String createTable = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_stateprovince TEXT, '
      '$_countrie TEXT, '
      '$_webPagesF TEXT, '
      '$_fav INTEGER)';
//'$_web_pageF TEXT)';'$_web_pageF TEXT)'
  insert(List<PostModel> post) async {
    final Database db = await openDb();
    post.forEach((element) {
      db.insert(_tableName, _toMap(element),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<List<PostModel>> getAll(countrie) async {
    final Database db = await openDb();
    final List<Map<String, dynamic>> result = await db.rawQuery(
        'SELECT * FROM $_tableName WHERE countrie = ?', ['$countrie']);

    return (result).map((e) => PostModel.fromBson(e)).toList();
  }

  Future<String> getCount(countrie) async {
    Database db = await openDb();
    var z = await db.rawQuery(
        'SELECT COUNT(*) FROM $_tableName WHERE countrie = ?', ['$countrie']);
    int? count = Sqflite.firstIntValue(z);
    String h = count.toString();
    return h;
  }

  makefav(id, isfav) async {
    Database db = await openDb();
    await db
        .rawUpdate('UPDATE $_tableName SET fav = ? WHERE id = ?', [isfav, id]);
  }

  Map<String, dynamic> _toMap(PostModel post) {
    final Map<String, dynamic> contactMap = <String, dynamic>{};
    contactMap[_name] = post.name;
    contactMap[_stateprovince] = post.stateProvince;
    contactMap[_webPagesF] = post.webPagesF;
    contactMap[_countrie] = post.country;
    contactMap[_fav] = post.fav;

    return contactMap;
  }
}
