import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';



class DataBase2 extends StatefulWidget {
  @override
  State<DataBase2> createState() => _MyAppState();
}

class _MyAppState extends State<DataBase2> {
  Database? database;

  var name = TextEditingController();
  List<Map> data=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createDB();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Base Cubit"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Data Base Cubit"),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: ("name"),
                  labelStyle: Theme.of(context).textTheme.bodyText1,
                  hintText: ("Enter Your name"),
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                  icon: Icon(Icons.drive_file_rename_outline),
                ),
              ),
            ),
            MaterialButton(onPressed: (){
              insertData(name: name.text);
            },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('insertData'),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 300,
              child: ListView.separated(
                  itemBuilder: (c,i)=>item(m: data[i]),
                  separatorBuilder: (c,i)=>SizedBox(height: 10,),
                  itemCount: data.length),
            )
          ],
        ),
      ),
    );
  }


  void createDB() async{
    database=await openDatabase(
        'DataBase2.db',
        version: 1,
        onCreate: (db,v){
          print('db created');
          db.execute('CREATE TABLE data (id INTEGER PRIMARY KEY, name TEXT)')
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
            print(data);
          });
        }
    );

  }

  Future insertData({required String name})async{
    return await database!.transaction((txn) async {
      txn.rawInsert('INSERT INTO data(name) VALUES("$name")')
          .then((value){
        print('inserted: $value') ;
      }).catchError((e){
        print('error in inserted data ${e.toString()}');
      });
    });


  }

  Future<List<Map>> GetData(db)  async{
    return await db.rawQuery('SELECT  * FROM data');
  }

  Widget item({required Map m}){
    return Container(
      width: double.infinity,
      child: Center(child: Text('${m['name']}',style: TextStyle(fontSize: 20),)),
    );
  }
}