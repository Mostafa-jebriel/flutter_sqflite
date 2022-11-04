

import 'package:database/data3_test/db.dart';
import 'package:flutter/material.dart';

import 'maindata3.dart';

class ShowNotes extends StatefulWidget {
  final notes;
  final title;
  final id;
  ShowNotes({required this.notes,required this.title,required this.id});
  @override
  State<ShowNotes> createState() => _ShowNotesState();
}

class _ShowNotesState extends State<ShowNotes> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Notes Page'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue),),
          Text(widget.notes,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue),),
          Text("${widget.id}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue),),
        ],
      ),
    );
  }
}
