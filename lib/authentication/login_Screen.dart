import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  final FirebaseAuth auth;

  LoginPage({required this.auth});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email;
  late String _password;

  void _signInWithEmailAndPassword() async {
    if (_email.isEmpty) {
      Fluttertoast.showToast(
          msg: "Enter Email", toastLength: Toast.LENGTH_SHORT);
      return;
    } else if (_password.isEmpty) {
      Fluttertoast.showToast(
          msg: "Enter Password", toastLength: Toast.LENGTH_SHORT);
      return;
    }
    try {
      print('before User signed in: $_email and $_password');
      UserCredential userCredential = await widget.auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      print('User signed in: ${userCredential.user!.uid}');
      Navigator.pushNamed(context, '/chat_screen');
    } catch (e) {
      print('Error: $e');
    }
  }

  void _createUserWithEmailAndPassword() async {
    if (_email.isEmpty) {
      Fluttertoast.showToast(
          msg: "Enter Email", toastLength: Toast.LENGTH_SHORT);
      return;
    } else if (_password.isEmpty) {
      Fluttertoast.showToast(
          msg: "Enter Password", toastLength: Toast.LENGTH_SHORT);
      return;
    }
    try {
      UserCredential userCredential = await widget.auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      print('New user registered: ${userCredential.user!.uid}');
      Navigator.pushNamed(context, '/chat_screen');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => _email = value,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              onChanged: (value) => _password = value,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _signInWithEmailAndPassword,
                  child: Text('Login'),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: _createUserWithEmailAndPassword,
                  child: Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}