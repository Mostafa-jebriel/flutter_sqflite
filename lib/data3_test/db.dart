
import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLDB{

  static Database? _db;

  Future<Database?> get database async{
    if(_db==null){
      _db=await intialDB();
      return _db;
    }
    else{
      return _db;
    }
  }

  intialDB() async{
    String DBPath=await getDatabasesPath();
    String db_name="data3.db";
    String path=join(DBPath,db_name);
    Database mydb=await openDatabase(path, onCreate:_onCreate,version: 3,onUpgrade: _onUpgrade);

    return mydb;
  }

  _onCreate(Database db, int version) async{
    print('db created');
    await db.execute("CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,body TEXT)");
    print('table 1 created');
    // await db.execute('''
    // CREATE TABLE "body" (
    // id INTEGER PRIMARY KEY AUTOINCREMENT,
    // name TEXT
    // ''');
    // print('table 2 created');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async{
    print("onUpgrade===========================");
    await db.execute("CREATE TABLE data (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)");
    print('table 2 created');
  }

  readData()async{
    Database? mydb=await database;
    List<Map> res= await mydb!.rawQuery("SELECT  * FROM notes");
    return res;
  }

  insertData({required String name,required String body})async{
    Database? mydb=await database;
    int res= await mydb!.rawInsert('INSERT INTO notes(name,body) VALUES("$name","$body")');
    return res;
  }

  updataData({required int id,required String name,required String body})async{
    Database? mydb=await database;
    int res= await mydb!.rawUpdate('UPDATE notes SET name = ?, body = ? WHERE id = "$id"',['$name','$body'],);
    return res;
  }

  deleteData({required int id})async{
    Database? mydb=await database;
    int res= await mydb!.rawDelete('DELETE FROM notes WHERE id = "$id"');
    return res;
  }

  readData2()async{
    Database? mydb=await database;
    List<Map> res= await mydb!.rawQuery("SELECT  * FROM data");
    return res;
  }
  readDataW({required int id})async{
    Database? mydb=await database;
    List<Map> res= await mydb!.rawQuery("SELECT  * FROM data ");
    return res;
  }

  insertData2({required String name})async{
    Database? mydb=await database;
    int res= await mydb!.rawInsert('INSERT INTO data(name) VALUES("$name")');
    return res;
  }
// لاضافه اكتر من جدول
  _onCreate2(Database db, int version) async{
    Batch b=db.batch();
    b.execute("CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,body TEXT)");
    print('table 1 created');
    b.execute('''
    CREATE TABLE "body" (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
    ''');
    print('table 2 created');
    await b.commit();
  }
  //  Shortcuts Method SQFLITE
  read(String t)async{
    Database? mydb=await database;
    List<Map> res= await mydb!.query(t);
    return res;
  }

  insert(String table,Map<String, Object?> values)async{
    Database? mydb=await database;
    int res= await mydb!.insert(table, values);
    return res;
  }

  updata(String table,Map<String, Object?> values,String where)async{
    Database? mydb=await database;
    int res= await mydb!.update(table, values,where:where );
    return res;
  }

  delete(String table,String id)async{
    Database? mydb=await database;
    int res= await mydb!.delete(table,where:id);
    return res;
  }
}