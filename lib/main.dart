import 'package:database/data2_test/data1_.dart';
import 'package:database/datacubit/database_cubit.dart';
import 'package:flutter/material.dart';

import 'Shortcuts.dart';
import 'data1_test/data2.dart';
import 'data3_test/data3.dart';
import 'data3_test/maindata3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Base"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => DataBaseCubit()));
            },
            color: Colors.brown,
            textColor: Colors.white,
            child: Text('Data Base Cubit'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => DataBase1()));
            },
            color: Colors.red,
            textColor: Colors.white,
            child: Text('Data Base 1'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => DataBase2()));
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Data Base 2'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Data3()));
            },
            color: Colors.black,
            textColor: Colors.white,
            child: Text('Data Base 3'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MainData3()));
            },
            color: Colors.black,
            textColor: Colors.white,
            child: Text('Main Data Base 3'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MainData4()));
            },
            color: Colors.black,
            textColor: Colors.white,
            child: Text('Shortcuts Method SQFLITE'),
          ),
        ],
      ),
    );
  }
}
