
import 'package:database/data3_test/shownote.dart';
import 'package:flutter/material.dart';

import 'add.dart';
import 'db.dart';
import 'edit.dart';


class MainData3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyAppState();
}

class _MyAppState extends State<MyHome> {
  SQLDB dataB=SQLDB();

  List notes=[];
  bool load=true;
  Future GetData()async{
    List<Map> response= await dataB.readData();
    notes.addAll(response);
    load=false;
    if(this.mounted){
      setState(() {

      });

    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data3"),
      ),
      body: Container(
        child: ListView(
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => AddNotes()));
              },
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Add Notes'),
            ),
            ListView.builder(
              itemCount: notes.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (c,i){
                return Card(
                  child: ListTile(
                    title:Text(notes[i]['name']),
                    subtitle: Text(notes[i]['body']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit,color: Colors.blue,),
                          onPressed:()async{
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) => EditNotes(
                              notes: notes[i]['body'],
                              title: notes[i]['name'],
                              id: notes[i]['id'],
                            )));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete,color: Colors.red,),
                          onPressed:()async{
                            int response= await dataB.deleteData(id:notes[i]['id']);
                            print("Delete record:${response}");
                            if(response>0){
                              notes.removeWhere((element) => element['id']==notes[i]['id']);
                              setState(() {});
                            }
                          },
                        )
                      ],
                    ),
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => ShowNotes(
                        notes: notes[i]['body'],
                        title: notes[i]['name'],
                        id: notes[i]['id'],
                      )));
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}