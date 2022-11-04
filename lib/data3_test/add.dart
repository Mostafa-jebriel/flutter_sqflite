

import 'package:database/data3_test/db.dart';
import 'package:flutter/material.dart';

import 'maindata3.dart';

class AddNotes extends StatefulWidget {
  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  var name = TextEditingController();
  var body = TextEditingController();
  SQLDB dataB=SQLDB();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: ("Full Name"),
                labelStyle: Theme.of(context).textTheme.bodyText1,
                hintText: ("Enter Your Name"),
                hintStyle: Theme.of(context).textTheme.bodyText1,
                icon: Icon(Icons.drive_file_rename_outline),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextField(
              controller: body,
              decoration: InputDecoration(
                labelText: ("body"),
                labelStyle: Theme.of(context).textTheme.bodyText1,
                hintText: ("Enter Your body"),
                hintStyle: Theme.of(context).textTheme.bodyText1,
                icon: Icon(Icons.drive_file_rename_outline),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          MaterialButton(
            onPressed: () async{
              if(name.text.isNotEmpty ||body.text.isNotEmpty){
                int response= await dataB.insertData(name: name.text,body:body.text);
                print("inserted done=======================");
                print("${response}");
                if(response>0){
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => MainData3()),(r)=>false);
                }
              }
              else{
                print("enter data");
              }

            },
            color: Colors.black,
            textColor: Colors.white,
            child: Text('Add Notes'),
          ),
          MaterialButton(
            onPressed: () async{
              if(name.text.isNotEmpty ||body.text.isNotEmpty){
                int response= await dataB.insert("notes",{
                  "name": name.text,"body":body.text
                });
                print("inserted done=======================");
                print("${response}");
                if(response>0){
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => MainData3()),(r)=>false);
                }
              }
              else{
                print("enter data ");
              }

            },
            color: Colors.black,
            textColor: Colors.white,
            child: Text('Add Notes Shortcuts'),
          ),
        ],
      ),
    );
  }
}
