import 'package:flutter/material.dart';
// import 'package:flutter_application_1/nav/nav.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/sec/profile.dart';
import 'package:flutter_application_1/auth/signInScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://hgffmysoarchwlcibjre.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhnZmZteXNvYXJjaHdsY2lianJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTc0Nzk1NjcsImV4cCI6MjAxMzA1NTU2N30.1565G9rSqemAw3UV4tgBdYp9zWqIP7yrGrG2NWKyaKc',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      home: SignInScreen(),
    );
  }
}
