
import 'package:flutter/material.dart';

import 'db.dart';


class Data3 extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data3"),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () async{
                int response= await dataB.insertData(name: "mostafa 8",body: "note 8");
                print("inserted done:${response}");
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Insert Data'),
            ),
            MaterialButton(
              onPressed: () async{
                List<Map> response= await dataB.readData();
                print(response);
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Read Data'),
            ),
            MaterialButton(
              onPressed: () async{
                int response= await dataB.deleteData(id: 4);
                print("Delete record:${response}");
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Delete Data'),
            ),
            MaterialButton(
              onPressed: () async{
                int response= await dataB.updataData(id: 5,name: "mostafa 5",body: "note 5");
                print("update record:${response}");
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('update Data'),
            ),
            MaterialButton(
              onPressed: () async{
                int response= await dataB.insertData2(name: "bbbbb");
                print("inserted table 2 done:${response}");
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Insert Data 2'),
            ),
            MaterialButton(
              onPressed: () async{
                List<Map> response= await dataB.readData2();
                print(response);
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Read Data 2'),
            ),
          ],
        ),
      ),
    );
  }
}