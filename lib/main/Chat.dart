import 'package:flutter/material.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF31496B),
        title: Text('Chat'),
      ),
      body: Center(
        child: Text('This is the Add page content.'),
      ),
    );
  }
}