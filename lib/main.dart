import 'package:flutter/material.dart';
import 'package:memory_usage/provider/data_provider.dart';
import 'package:memory_usage/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dataPath = await getApplicationDocumentsDirectory();
  Hive.init(dataPath.path);
  await Hive.openBox('dataContact');

  runApp(
    ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    RoutesPage routesPage = RoutesPage();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) => routesPage.getRoutes(settings),
    );
  }
}
