// import 'dart:js_interop_unsafe';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:vendy_station/generated/l10n.dart';
import 'package:vendy_station/provider/add_link_provider.dart';
import 'package:vendy_station/provider/auth_provider.dart';
import 'package:vendy_station/provider/clints_provider.dart';
import 'package:vendy_station/provider/lang_provider.dart';
import 'package:vendy_station/provider/localization_provider.dart';
import 'package:vendy_station/provider/notification_provider.dart';
import 'package:vendy_station/provider/school_provider.dart';
import 'package:vendy_station/provider/wallet_provider.dart';
import 'package:vendy_station/screens/splash/splash.dart';
import 'package:vendy_station/util/constant.dart';
import 'data/datasource/remote/dio/cash.dart';
import 'data/datasource/remote/dio/dio_payment.dart';
import 'di_container.dart' as di;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';




void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await CacheHelper.int();
 // mySharedPreferences = await SharedPreferences.getInstance();


  token = CacheHelper.getData(key: 'token');

  userPhone = CacheHelper.getData(key: 'userPhone');
  print('USER phone IS ::::$userPhone');

  updateEmail = CacheHelper.getData(key: 'updateEmail');
  print('USER updateEmail IS ::::$updateEmail');

  mac = CacheHelper.getData(key: 'mac');
  print('USER mac IS ::::$mac');

  mac2 = CacheHelper.getData(key: 'mac2');
  print('USER mac2 IS ::::$mac2');

  fileNAME = CacheHelper.getData(key: 'fileNAME');
  print('USER fileNAME IS ::::$fileNAME');

  email = CacheHelper.getData(key: 'email');
  print('USER email IS ::::$email');
  lang = CacheHelper.getData(key: 'language');
  print('USER lang IS ::::$lang');

  point = CacheHelper.getData(key: 'point');
  // switchOn = CacheHelper.getData(key: 'switchOn');
  // print("switch$switchOn");

  company = CacheHelper.getData(key: 'company');
  imagePath = CacheHelper.getData(key: 'imagePath');
  print('USER image IS ::::$imagePath');
  name = CacheHelper.getData(key: 'name');
  print('USER name IS ::::$name');

  pass = CacheHelper.getData(key: 'pass');
  print('USER pass IS ::::$pass');

  await DioHelperPayment.init();
  print('USER ID IS ::::$token');
  ///

  nameVTouch = CacheHelper.getData(key: "nameVTouch");
  print('USER nameVTouch IS ::::$nameVTouch');

  await Firebase.initializeApp();

  FirebaseMessaging.instance.getToken().then((value) {
    print(value);
    CacheHelper.saveData(key: 'firebase_token', value: value);
    CacheHelper.getData(key: 'firebase_token');
  });

  CacheHelper.saveData(key: 'onBoarding', value: true);
  openedFirstTime = CacheHelper.getData(key: 'onBoarding');

  print('FIRBASE TOKEN::: ${CacheHelper.getData(key: 'firebase_token')}');
  runApp(MultiProvider(
    providers: [

     ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
    //  ChangeNotifierProvider(create: (context) => di.sl<LocalizationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<LangProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ClientsProvider>()),
     ChangeNotifierProvider(create: (context) => di.sl<WalletUserProvider>()),
     ChangeNotifierProvider(create: (context) => di.sl<AddSchoolUserProvider>()),
     ChangeNotifierProvider(create: (context) => di.sl<AddLinkProvider>()),
     ChangeNotifierProvider(create: (context) => di.sl<NotifiactionUserProvider>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

    MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 final token = CacheHelper.getData(key: 'token');

late  LangProvider provider ;
late  SharedPreferences prefs ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  //  var provider = Provider.of<LangProvider>(context);

   provider = Provider.of<LangProvider>(context);
    shared();
  // provider.changeLang( CacheHelper.getData(key: 'language')??"en");
  //   CacheHelper.int();
   // CacheHelper.getData(key: 'language');
   // provider.changeLang( CacheHelper.getData(key: 'language')??"en");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vendystation',
        locale: Locale(provider.appLang),
        localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
             // GlobalMaterialLocalizations.delegate,
             // GlobalCupertinoLocalizations.delegate,
             // GlobalWidgetsLocalizations.delegate,
        //  FallbackLocalizationDelegate()
        ],
        supportedLocales: [
          Locale('en'), // English, no country code
          Locale('ar'), // Arabic, no country code
        ],
      //   localeResolutionCallback: (currentLang, supportLang) {
      //     if (currentLang != null) {
      //       for (Locale locale in supportLang) {
      //         if (locale.languageCode == currentLang.languageCode) {
      //           CacheHelper.saveData( key: 'lang', value: currentLang.languageCode) ;
      //           return currentLang;
      //         }
      //       }
      //     }
      //     return supportLang.first;
      // },
      home:

      //token!=null? SplashScreen() :DashboardScreen()
    SplashScreen()

     // FamilyScreen()
      //VisaScreen()
    );
  }

   void shared()async{
     prefs = await SharedPreferences.getInstance();
   //  var pref=  await CacheHelper.int();
    // await CacheHelper.int();
  provider.changeLang( prefs.getString("language")??"en");
    //  CacheHelper.getData(key: 'language');

    //CacheHelper.getData(key: 'language');
   }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class Get {
  static BuildContext? get context => navigatorKey.currentContext;
  static NavigatorState? get navigator => navigatorKey.currentState;
}