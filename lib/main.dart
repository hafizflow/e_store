import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

import 'app.dart';

/// -- Entry point of flutter app
void main() async {
  /// Widget Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// -- GetX Local Storage
  await GetStorage.init();

  /// -- Await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// -- Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  // Todo: Initialize Authentication

  runApp(const App());
}
