import 'dart:io';


import 'package:database/datacubit/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(con)=> BlocProvider.of(con);

  Database? database;
  List<Map> data=[];


  void createDB() {
    openDatabase(
        'test.db',
        version: 1,
        onCreate: (db,v){
          print('db created');
          db.execute('CREATE TABLE Person (id INTEGER PRIMARY KEY, name TEXT)')
              .then((value){
            print('table created');
          }).catchError((e){
            print('error in table${e.toString()}');
          });
        },
        onOpen: (db){
          print('db Open');
          GetData(db).then((value){
            data=value;
            emit(AppgetState());
            print(data);
          });
        }
    ).then((value){
      database=value;
      emit(AppCreateDBState());
    }).catchError((e){

    });

  }

   insertData({required String name})async{
    await database!.transaction((txn) => txn.rawInsert('INSERT INTO Person(name) VALUES("$name")')
          .then((value){
        print('inserted: $value');
        emit(AppInsertState());
        GetData(database).then((value){
          data=value;
          emit(AppgetState());
          print(data);
        });
      }).catchError((e){
        print('error in inserted data ${e.toString()}');
      }));


  }

  Future<List<Map>> GetData(db)  async{
    return await db.rawQuery('SELECT  * FROM Person');
  }
  // void updateDate({required String status,required int id}) async{
  //   db!.rawUpdate(
  //     'UPDATE Tasks set status = ? WHERE id = ?',
  //     ['$status',id],
  //   ).then((value){
  //     GetPersonData(db);
  //     emit(AppUpdateDBState());
  //   });
  //
  //
  // }
  //
  // void deleteDate({required int id}){
  //   db!.rawDelete('DELETE FROM  Tasks WHERE id = ?',
  //       [id]).then((value) {
  //     GetPersonData(db);
  //     emit(AppDeleteDBState());
  //   });
  // }

}