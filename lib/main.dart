
import 'package:flutter/material.dart';
import 'package:todo_v1/my_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_v1/providers/AppConfigProvider.dart';
import 'package:todo_v1/ui/home/home_screen.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';




void main()async {
  await WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create : (context)=>AppConfigProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget{


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);    //provider

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        HomeScreen.routName:(context)=>HomeScreen(),
      },
      initialRoute: HomeScreen.routName,
      theme: MyThemeData.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      themeMode: provider.appMode,

    );
  }
}
