import 'package:iuniversities/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String databaseName = 'universities.db';
Future<Database> openDb() async {
  final String path = join(await getDatabasesPath(), "core40.db");
  return openDatabase(path, onCreate: (db, version) {
    db.execute(ContactDao.createTable);
  }, version: 1);
}
