import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/di/locator.dart' as di;
import 'core/navigation/app_router.dart';
import 'data/model/responses/login_response.dart';
import 'data/model/local/crossword_cell_data.dart';
import 'data/model/responses/quizz_questions.dart';
import 'data/model/responses/crossword_questions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(LoginResponseAdapter());
  Hive.registerAdapter(QuizzQuestionsAdapter());
  Hive.registerAdapter(CrosswordQuestionsAdapter());

  await Hive.openBox<LoginResponse>('playerBox');
  await Hive.openBox('quizBox');
  await Hive.openBox('crosswordBox');

  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'KSTU Quiz Game',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),

      routerConfig: _appRouter.config(),
    );
  }
}