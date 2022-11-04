

import 'package:database/data3_test/db.dart';
import 'package:flutter/material.dart';

import 'maindata3.dart';

class EditNotes extends StatefulWidget {
  final notes;
  final title;
  final id;
  EditNotes({this.notes,this.title,this.id});
  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  TextEditingController name = TextEditingController();
  TextEditingController body = TextEditingController();
  SQLDB dataB=SQLDB();
  var id;
  @override
  void initState() {
    name.text=widget.title;
    body.text=widget.notes;
    id=widget.id;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Page'),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
              int response= await dataB.updataData(id: id,name: name.text,body:body.text);
              print("update done=======================");
              print("${response}");
              if(response>0){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => MainData3()),(r)=>false);
              }
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Edit Notes'),
          ),
          MaterialButton(
            onPressed: () async{
              int response= await dataB.updata("notes",{
            "name": name.text,"body":body.text
            },"id=${id}");
              print("update done=======================");
              print("${response}");
              if(response>0){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => MainData3()),(r)=>false);
              }
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Edit Notes Shortcuts'),
          ),
        ],
      ),
    );
  }
}
