import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puso_malaya/login/login_screen.dart';

Color defaultColor = const Color.fromARGB(255, 69, 105, 28);
var lightScheme = ColorScheme.fromSeed(
  seedColor: defaultColor,
);

var darkScheme = ColorScheme.fromSeed(
  seedColor: defaultColor,
  brightness: Brightness.dark,
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;

  void switchTheme() {
    setState(() {
      if (themeMode == ThemeMode.light) {
        themeMode = ThemeMode.dark;
      } else {
        themeMode = ThemeMode.light;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: darkScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: darkScheme.onPrimaryContainer,
          foregroundColor: darkScheme.primaryContainer,
        ),
        navigationBarTheme: NavigationBarThemeData().copyWith(
          backgroundColor: darkScheme.onPrimaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkScheme.primaryContainer,
            foregroundColor: darkScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: darkScheme.onSecondaryContainer,
            fontSize: 30,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.normal,
            color: darkScheme.onSecondaryContainer,
            fontSize: 16,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.normal,
            color: darkScheme.onSecondaryContainer,
            fontSize: 14,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: lightScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: lightScheme.onPrimaryContainer,
          foregroundColor: lightScheme.primaryContainer,
        ),
        navigationBarTheme: NavigationBarThemeData().copyWith(
          backgroundColor: lightScheme.onPrimaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: lightScheme.primaryContainer,
            foregroundColor: lightScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: lightScheme.onSecondaryContainer,
            fontSize: 30,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.normal,
            color: lightScheme.onSecondaryContainer,
            fontSize: 16,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.normal,
            color: lightScheme.onSecondaryContainer,
            fontSize: 14,
          ),
        ),
      ),
      themeMode: themeMode,
      home: LoginScreen(),
    );
  }
}
