import 'package:flutter/material.dart';

class EmailScreen extends StatefulWidget {
  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: yellowBar(),
        body: Container(
          color: Colors.indigo[700],
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: SingleChildScrollView(child: setEmailScreenBody()),
          ),
        ),
      )
    );
  }

//---------Navbar----------------

  AppBar yellowBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.amber[600],
      title: const Text('Change Username',  
        style: TextStyle(
          color: Colors.black
        ), 
      ),
      actions: <Widget> [
      ]
    );
  }
  
//---------Body----------------

  Column setEmailScreenBody() {
    return Column(
      children: [
        title(" Change Email"),
        note("temp.email@email.com"),
        whiteDivider(),
        message("Confirm your changes to your email address."),
        whiteDivider(),
        Column(
          children: [
            confirmButton('Confirm'),
            cancelButton('Cancel'),
          ],
        ),
      ],
    );
  }
  
  Container whiteDivider() {
    return Container(
            padding: EdgeInsets.fromLTRB(70, 0, 70, 10),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: Colors.white)
            );
  }

  Container title(var string) {
    return Container(
      margin: EdgeInsets.fromLTRB(35, 20, 40, 5),
      child: Row(children: [
        Container(
          child: const Icon(
            Icons.edit,
            size: 50,
            color: Colors.white
          ),
        ),
        Text(string,
          style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              height: 1.25,
              fontStyle: FontStyle.italic
          )
        ),
      ],)
    );
  }

  Container message(var string) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Text(string,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              height: 1,
              fontStyle: FontStyle.italic)),
    );
  }
  
  Card note(var username) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 25),
      elevation: 12,
      child: Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end:
                Alignment(0.2, 0.0), // 10% of the width, so there are ten blinds.
            colors: [
              const Color(0xffb2ebf2),
              const Color(0xff82b1ff),
            ], // red to yellow
            tileMode: TileMode.clamp
          ),
        ),
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
              noteTitle(),
              noteUsername(username),
            ],)
          ),
        ],)
      )
    );
  }

  Container noteTitle(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(15, 25, 15, 0),
      height: 30,
      child: Container(
        alignment: Alignment.centerLeft,
        width: 175,
        height: 30,
        child: Text("Email",
          style: TextStyle(
              color: Colors.brown[900],
              fontSize: 18,
              height: 1,
              fontStyle: FontStyle.italic)
        )
      ),
    );
  }

  Container noteUsername(var email){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(20,16,20,0),
      width: 270,
      height: 70,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        initialValue: email,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 3, color: Colors.purpleAccent[200]),
            ),
            prefixIcon: Container(
              child: Icon(Icons.email, color: Colors.black),
            ),
            fillColor: Colors.white,
            focusColor: Colors.purpleAccent[200],
            filled: true,
            labelText: "Email",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      )
    );
  }

  Container confirmButton(var menuName){
  return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
      height: 50.0,
      width: 500.0, 
      
      child: Builder(builder: (editScreenContext) => ElevatedButton(

        child: Text(
          menuName, style: TextStyle(color: Colors.black, fontSize: 18)
        ),

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.amber[600])
        ),
        onPressed:() {
          Navigator.pop(editScreenContext);
        }
      ))
    );
  }

  Container cancelButton(var menuName){
  return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
      height: 50.0,
      width: 500.0, 
      
      child: Builder(builder: (usernameScreenContext) => ElevatedButton(

        child: Text(
          menuName, style: TextStyle(color: Colors.black, fontSize: 18)
        ),

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[200])
        ),
        onPressed:() {
          Navigator.pop(usernameScreenContext);
        }
      ))
    );
  }
}