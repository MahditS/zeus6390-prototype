import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zeus/db_helper/constants.dart';
import 'package:zeus/pages/dashboard.dart';
import 'package:zeus/pages/splash_screen.dart';

Future main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(url: SUPABASE_URL, anonKey: ANON_KEY);
  // await MongoDatabase.connect();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zeus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SplashScreen(child: Dashboard(),),
    );
  }
}

