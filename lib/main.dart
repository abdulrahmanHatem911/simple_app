import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/modules/screens/auth/login_screen.dart';

import 'controller/network/local/hive_server.dart';
import 'controller/network/local/sql_server.dart';
import 'controller/services/services_locator.dart';
import 'core/routes/app_routers.dart';
import 'core/style/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();

  await HiveServer.initializeDB();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.light,
      onGenerateRoute: RoutersGenerated.onGenerateRoute,
      initialRoute: Routers.INITIAL,
      home: const LoginScreen(),
    );
  }
}
