import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'authentication/login_Screen.dart';
import 'dashboard/chat_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(/*options: DefaultFirebaseOptions.currentPlatform*/);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // final FirebaseAuth _auth = FirebaseAuth.instance;
    return MaterialApp(
      title: 'Firebase Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(auth: _auth),
      routes: {
        '/chat_screen': (context) => ChatScreen(),
      },
    );
  }
}

