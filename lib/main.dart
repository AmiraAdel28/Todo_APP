import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/providers/app_provider.dart';
import 'package:todo/shard/styles/my_themes.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 // await FirebaseFirestore.instance.disableNetwork();

  runApp(ChangeNotifierProvider (child: MyApp(),
      create: (BuildContext context){
        return AppProvider();
      }
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      locale: Locale(provider.AppLanguage),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routename,
      routes: {
        HomeLayout.routename : (c)=>HomeLayout(),
      },
      theme: MyThemeData.lightTheme,
      themeMode:provider.themeMode,
      darkTheme: MyThemeData.darkTheme,
    );
  }
}
