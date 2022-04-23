import 'package:cryto/Screens/main_activity.dart';
import 'package:cryto/Styles/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: white, elevation: 0, centerTitle: false),
          scaffoldBackgroundColor: white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: black, unselectedItemColor: grey)),
      home: const MainActivity(),
    );
  }
}
