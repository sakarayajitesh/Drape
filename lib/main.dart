import 'package:drape/database/database_provider.dart';
import 'package:drape/routes/home_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'controllers/coach_marks_controller.dart';
import 'controllers/home_controller.dart';

final databaseProvider = DatabaseProvider();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final path = join(await getDatabasesPath(), 'item_database.db');
  await databaseProvider.open(path);
  Get.lazyPut(() => CoachMarksController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return GetMaterialApp(
      title: 'Drape',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
        textTheme: GoogleFonts.kalamTextTheme(),
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith(
            (states) => TextStyle(
              fontWeight: states.contains(MaterialState.selected)
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        ),
      ),
      home: HomeRoute(),
    );
  }
}
