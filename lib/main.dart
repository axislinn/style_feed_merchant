import 'package:flutter/material.dart';
import 'package:flutter_application_1/nav/nav.dart';
import 'package:flutter_application_1/sec/profile.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/profile': (context) => UserProfileScreen(
      ProfileUser(
        name: 'SISBURMA',
        email: 'sisburma@example.com',
        phone: '123-456-7890',
        description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et nisl nec sapien venenatis lacinia in eu nulla. Sed bibendum viverra ante, quis fringilla nunc ultrices vel.',
      ),
          (editedUser) {
        // Implement the logic to save the edited user data in your original page.
      },/**/
    ),

      },
      home: test(),
    );
  }
}
