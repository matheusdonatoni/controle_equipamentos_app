import 'package:controle_equipamentos/app/routes/pages.dart';
import 'package:controle_equipamentos/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/bindings/initial_bindings.dart';
import 'app/data/providers/local_storage.dart';
import 'app/ui/android/themes/swift_theme.dart';

void main() async {
  await dotenv.load();
  await Get.putAsync(() => LocalStorage.init(), permanent: true);

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      initialBinding: InitialBinding(),
      getPages: pages,
      themeMode: Get.find<LocalStorage>().findThemeMode(),
      theme: SwiftTheme.light,
      darkTheme: SwiftTheme.dark,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
    );
  }
}
