import 'package:flutter/material.dart';
import 'package:midterm_project/note_tileA.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotesListA extends StatefulWidget {
  @override
  _NotesListAState createState() => _NotesListAState();
}

class _NotesListAState extends State<NotesListA> {
  @override
  Widget build(BuildContext context){
    Widget _getNotes(){
      return StreamBuilder(
        stream: Firestore.instance
          .collection('notes')
          .orderBy('timestamp', descending: true)
          .snapshots(),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) => NoteTileA(
                id: snapshot.data.documents[index].documentID,
                question: snapshot.data.documents[index]['question'],
                answer: snapshot.data.documents[index]['answer'],
              ),
              itemCount: snapshot.data.documents.length,
            );
          }else{
            return Container();
          }
        },
      );
    }
    return _getNotes();
  }
}
