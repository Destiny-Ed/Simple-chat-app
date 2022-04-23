import 'package:cryto/Screens/main_activity.dart';
import 'package:cryto/Styles/color.dart';
import 'package:flutter/material.dart';

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
          appBarTheme:
              AppBarTheme(color: white, elevation: 0, centerTitle: false),
          scaffoldBackgroundColor: white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: black, unselectedItemColor: grey)),
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        return Builder(
          builder: (context) {
            return MediaQuery(
              data: data.copyWith(
                textScaleFactor: data.textScaleFactor.clamp(0.85, 0.90),
              ),
              child: child!,
            );
          },
        );
      },
      home: const MainActivity(),
    );
  }
}
