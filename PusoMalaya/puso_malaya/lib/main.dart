import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puso_malaya/login/login_screen.dart';
import 'package:puso_malaya/login/signup_screen.dart';
import 'package:puso_malaya/model/base_app_user.dart';
import 'package:puso_malaya/screens/nav_root.dart';

Color defaultColor = Color(0xFF061A2C);
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
  BaseAppUser? loginUser;
  // var loginUser = '';
  var isNewUser = false;
  var successfulRegistration = false;
  String successMessage = '';

  void switchTheme() {
    setState(() {
      if (themeMode == ThemeMode.light) {
        themeMode = ThemeMode.dark;
      } else {
        themeMode = ThemeMode.light;
      }
    });
  }
  void logout() {
    setState(() {
      loginUser = null;
      // loginUser = '';
      successfulRegistration = false;
    });
  }

  void goToHome(BaseAppUser currentUser) {
    setState(() {
      loginUser = currentUser;
    });
  }

  // void goToHome() {
  //   setState(() {
  //     loginUser = 'yes';
  //   });
  // }

  void goToRegister() {
    setState(() {
      isNewUser = true;
    });
  }

  void cancelRegister() {
    setState(() {
      isNewUser = false;
      successfulRegistration = false;
    });
  }

  void successRegister(String message) {
    setState(() {
      successMessage = message;
      isNewUser = false;
      successfulRegistration = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = LoginScreen(
      successfulRegistration,
      successMessage,
      goToHome: goToHome,
      goToRegister: goToRegister,
    );

    if (loginUser != null) {
    // if (loginUser != '') {
      content = NavRoot(
        successfulRegistration,
        successMessage,
        goToHome: goToHome,
        goToRegister: goToRegister,
        currentUser: loginUser!,
        logout: logout,
      );
    } else if (isNewUser) {
      content = SignupScreen(
        successRegister: (String message) {
          successRegister(message);
        },
        cancelRegister: cancelRegister,
      );
    }                         
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: defaultColor,
        colorScheme: darkScheme,
        appBarTheme: AppBarTheme().copyWith(
          elevation: 0,
          backgroundColor: defaultColor,
          foregroundColor: darkScheme.onPrimaryContainer,
        ),
        navigationBarTheme: NavigationBarThemeData().copyWith(
          backgroundColor: darkScheme.primaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkScheme.primaryContainer,
            foregroundColor: darkScheme.onPrimaryContainer,
            textStyle: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily)
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: darkScheme.onSecondaryContainer,
            fontSize: 30,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.normal,
            color: darkScheme.onSecondaryContainer,
            fontSize: 16,
            fontFamily: GoogleFonts.poppins().fontFamily
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.normal,
            color: darkScheme.onSecondaryContainer,
            fontSize: 14,
            fontFamily: GoogleFonts.poppins().fontFamily
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
            textStyle: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily)
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: lightScheme.onSecondaryContainer,
            fontSize: 30,
            fontFamily: GoogleFonts.poppins().fontFamily
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.normal,
            color: lightScheme.onSecondaryContainer,
            fontSize: 16,
            fontFamily: GoogleFonts.poppins().fontFamily
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.normal,
            color: lightScheme.onSecondaryContainer,
            fontSize: 14,
            fontFamily: GoogleFonts.poppins().fontFamily
          ),
        ),
      ),
      themeMode: themeMode,
      home: content,
    );
  }
}
