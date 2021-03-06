import 'package:flutter/material.dart';
import 'package:midterm_project/services/auth.dart';
import 'package:midterm_project/shared/loading.dart';

class RegisterScreen extends StatefulWidget {
  // RegisterScreen({
  //   final Function toggleView,
  // });
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //textfield state
  String email = '';
  String password = '';
  String username = '';
  String confirmpassword = '';
  String error = '';
  //Map
  Map data;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
            appBar: yellowBar(),
            body: Container(
              color: Colors.indigo[700],
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: SingleChildScrollView(child: registerScreenBody()),
              ),
            ),
          ));
  }

  AppBar yellowBar() {
    return AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.amber[600],
        title: const Text(
          'Register',
          style: TextStyle(color: Colors.black),
        ),
        // actions: <Widget> [
        //   loginButton()
        // ]
      );
  }
  
  // Builder loginButton(){
  //   return Builder(builder: (loginScreenContext) => IconButton(
  //     icon: const Icon(Icons.login),
  //     iconSize: 34,
  //     tooltip: 'Login',
  //     onPressed: () {
  //       Navigator.pushReplacementNamed(loginScreenContext, '/login');
  //     },
  //   ));
  // }

  //------------Body-----

  Column registerScreenBody() {
    return Column(
      children: [
        avatar(),
        astellas('Astellas'),
        whiteDivider(),
        Form(
            key: _formKey,
            child: Column(children: [
              usernameFormField(),
              emailFormField(),
              passwordFormField(),
              confirmFormField(),
              registerButton(),
              SizedBox(
                height: 12.0,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ])),
      ],
    );
  }

  Container astellas(String title) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 20, 0.0, 5),
      child: Text(title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              height: 1,
              fontStyle: FontStyle.italic)),
    );
  }

  Container avatar() {
    return Container(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Image.asset('assets/images/avatar.jpg',
          width: 130.0, height: 130.0, fit: BoxFit.cover),
    ));
  }

  Container whiteDivider() {
    return Container(
        padding: EdgeInsets.fromLTRB(70, 0, 70, 10),
        child: Divider(color: Colors.white));
  }

  Container usernameFormField() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          validator: (val) => val.isEmpty ? 'Enter a username' : null,
          onChanged: (val) {
            setState(() => username = val);
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide:
                    BorderSide(width: 3, color: Colors.purpleAccent[200]),
              ),
              fillColor: Colors.white,
              focusColor: Colors.purpleAccent[200],
              filled: true,
              prefixIcon: Container(
                child: Icon(Icons.person, color: Colors.black),
              ),
              labelText: "Username",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ));
  }

  Container emailFormField() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
          onChanged: (val) {
            setState(() => email = val);
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide:
                    BorderSide(width: 3, color: Colors.purpleAccent[200]),
              ),
              fillColor: Colors.white,
              focusColor: Colors.purpleAccent[200],
              filled: true,
              prefixIcon: Container(
                child: Icon(Icons.email, color: Colors.black),
              ),
              labelText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ));
  }

  Container passwordFormField() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          validator: (val) => val.isEmpty ? 'Enter 6+ characters long' : null,
          obscureText: true,
          onChanged: (val) {
            setState(() => password = val);
          },
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide:
                    BorderSide(width: 3, color: Colors.purpleAccent[200]),
              ),
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Container(
                child: Icon(Icons.lock, color: Colors.black),
              ),
              labelText: "Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ));
  }

  Container confirmFormField() {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: TextFormField(
          validator: (val) =>
              val != password ? 'Password does not match' : null,
          onChanged: (val) {
            setState(() => confirmpassword = val);
          },
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide:
                    BorderSide(width: 3, color: Colors.purpleAccent[200]),
              ),
              fillColor: Colors.white,
              focusColor: Colors.purpleAccent[200],
              filled: true,
              prefixIcon: Container(
                child: Icon(Icons.lock, color: Colors.black),
              ),
              labelText: "Confirm Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ));
  }

  Container registerButton() {
    return Container(
        margin: EdgeInsets.fromLTRB(25, 20, 25, 10),
        height: 50.0,
        width: 500.0,
        child: Builder(
            builder: (registerScreenContext) => ElevatedButton(
                child: Text('Register',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber[600])),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    // setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Please supply valid email and password.';
                        // setState(() => loading = false);
                      });
                    }else{
                      Navigator.pop(registerScreenContext);     
                    }
                  }
                })));
  }
}
