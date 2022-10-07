import 'package:flutter/material.dart';
import 'package:flutter_chat_app_ui/screens/chats_list_screen.dart';
import 'package:flutter_chat_app_ui/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        hintColor: Color(0xff4D63D5),
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      // home: LoginScreen(),
      home: ChatsList(),
    );
  }
}
