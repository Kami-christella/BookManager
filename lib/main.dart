import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'services/preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefsService = PreferencesService();
  final isDarkMode = await prefsService.getThemePreference();
  runApp(MyApp(isDarkMode: isDarkMode));
}

class MyApp extends StatefulWidget {
  final bool isDarkMode;

  MyApp({required this.isDarkMode});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
  }

  void toggleTheme(bool isDarkMode) {
    setState(() {
      _isDarkMode = isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Tracker',
      theme: _isDarkMode ? _darkTheme : _lightTheme,
      home: MainScreen(toggleTheme: toggleTheme),
    );
  }

  final ThemeData _lightTheme = ThemeData(
    primaryColor: Color(0xFF1E88E5),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Color(0xFFFFC107),
    ),
    scaffoldBackgroundColor: Color(0xFFF5F5F5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E88E5),
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFC107)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    ),
  );

  final ThemeData _darkTheme = ThemeData.dark().copyWith(
    primaryColor: Color(0xFF1E88E5),
    colorScheme: ColorScheme.dark().copyWith(
      secondary: Color(0xFFFFC107),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E88E5),
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFC107)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    ),
  );
}



