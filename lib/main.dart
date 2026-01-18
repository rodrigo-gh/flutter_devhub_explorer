import 'package:dev_hub_explorer/features/search_repos/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevHub Explorer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SearchPage(),
    );
  }
}
