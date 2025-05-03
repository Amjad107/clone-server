
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://your-supabase-url.supabase.co',
    anonKey: 'your-anon-key',
  );
  runApp(HomeworkHelperApp());
}

class HomeworkHelperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Homework Helper',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Supabase.instance.client.auth.currentSession != null ? HomePage() : LoginPage(),
    );
  }
}
