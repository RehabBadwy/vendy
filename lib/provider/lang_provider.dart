import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendy_station/util/constant.dart';

import '../data/datasource/remote/dio/cash.dart';
import '../data/datasource/remote/dio/dio_client.dart';

class LangProvider extends ChangeNotifier {
  late final SharedPreferences? sharedPreferences;
  final DioClient? dioClient;
  LangProvider({required this.sharedPreferences, required this.dioClient});


  String appLang= "en";
  void changeLang(String LangCode)async{
  //  await CacheHelper.int();
    SharedPreferences pref = await SharedPreferences.getInstance();
    appLang = LangCode;
    pref.setString('language', LangCode);
    lang = CacheHelper.getData(key: 'language');
    notifyListeners();
  }
}