import 'package:e_store/controller_binder.dart';
import 'package:e_store/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: EAppTheme.lightTheme,
      darkTheme: EAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        backgroundColor: EColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      initialBinding: ControllerBinder(),
    );
  }
}
