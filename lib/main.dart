import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:simple_app/modules/screens/auth/login_screen.dart';

import 'controller/network/local/hive_server.dart';
import 'controller/network/local/sql_server.dart';
import 'controller/services/cache_helper.dart';
import 'controller/services/services_locator.dart';
import 'core/routes/app_routers.dart';
import 'core/style/theme.dart';
import 'core/translate/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  if (kIsWeb) {
    print('web🚨');
    await HiveServer.initializeDB();
  } else {
    await SqliteService().initializeDB();
  }
  await CacheHelper.init();
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
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      locale: L10n.all[1],
      supportedLocales: L10n.all,
      onGenerateRoute: RoutersGenerated.onGenerateRoute,
      initialRoute: Routers.INITIAL,
      home: const LoginScreen(),
    );
  }
}
