import 'package:flutter/material.dart';
import 'package:sql_db/pages/home_page.dart';
import 'package:sql_db/services/root_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RootService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
