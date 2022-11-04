import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'cubit.dart';
import 'state.dart';



class DataBaseCubit extends StatelessWidget {
  var name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..createDB(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (con,sta){},
        builder: (co,st){
          var cubit=AppCubit.get(co);
          var list=AppCubit.get(co).data;
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
                    cubit.insertData(name: name.text);
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
                        itemBuilder: (c,i)=>item(m: list[i]),
                        separatorBuilder: (c,i)=>SizedBox(height: 10,),
                        itemCount: list.length),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  Widget item({required Map m}){
    return Container(
      width: double.infinity,
      child: Center(child: Text('${m['name']}',style: TextStyle(fontSize: 20),)),
    );
  }
}



