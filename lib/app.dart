import 'package:e_store/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: EAppTheme.lightTheme,
      darkTheme: EAppTheme.darkTheme,
    );
  }
}
