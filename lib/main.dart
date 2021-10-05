import 'package:blood_donation/screens/home_screen.dart';
import 'package:blood_donation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'router.dart' as router;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: CustomColors.baseColor,
          appBarTheme: AppBarTheme(backgroundColor: CustomColors.primaryColor)),
      home: const HomeScreen(),
      onGenerateRoute: router.generateRoute,
    );
  }
}
