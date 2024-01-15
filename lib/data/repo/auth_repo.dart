import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constant.dart';
import '../datasource/remote/dio/cash.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/regester_model.dart';
import 'base/api_response.dart';

class AuthRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  AuthRepo({required this.dioClient, required this.sharedPreferences});
  var random = Random();
    int min = 1000; // Minimum 4-digit number
    int max = 9999; // Maximum 4-digit number

  ///
    String characters = "Abcdefghijk123456789LMNOPQrszXD";


  Future<ApiResponse> registration(String name,phone,email,password) async {
    try {
      int random4DigitNum = min + random.nextInt(max - min);
      String randomString = generateRandomString(characters, 15);
      //   var random = Random();
    //
    //   // Generate a random 4-digit number
    //   int min = 1000; // Minimum 4-digit number
    //   int max = 9999; // Maximum 4-digit number
    //   int random4DigitNum = min + random.nextInt(max - min);
    //   print('Random 4-digit number: $random4DigitNum');
    //
    //
    //   ///
    //   String characters = "Abcdefghijk123456789LMNOPQrszXD";
    // String randomString = generateRandomString(characters, 15);
    // print('Random string: $randomString');
    //
    // ///
    //   int number= 9999;
    //   int qr = int.parse(userPhone!);
    //   int fin = random4DigitNum*number*qr*int.parse(randomString);
    //   print("qrrrrr$fin");
     var platformvar;
      if (Platform.isIOS) {
        platformvar = "ios";
      } else if (Platform.isAndroid) {
        platformvar = "android";
      } else {
        platformvar = "other";
      }
      print(platformvar);
      Response response = await dioClient!.post(
        AppConstants.registrationUri,
        data: {
          "name":name,
          "phone" : phone,
          "email" : email,
          "password" : password,
          "token" :
          CacheHelper.getData(key: 'firebase_token'),
         // _getDeviceToken,
          "random" : random4DigitNum.toString(),
          "random2" : randomString.toString(),
          "platform" : platformvar,

      },
      );
      return ApiResponse.withSuccess(response);

    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  void randomm(){
    var random = Random();

    // Generate a random 4-digit number
    int min = 1000; // Minimum 4-digit number
    int max = 9999; // Maximum 4-digit number
    int random4DigitNum = min + random.nextInt(max - min);
    print('Random 4-digit number: $random4DigitNum');

    int number= 9999;
    int qr = int.parse(userPhone!);
    print("${random4DigitNum*number*qr}");
  }

  void randomTwo(){
    String characters = "Abcdefghijk123456789LMNOPQrszXD";
    String randomString = generateRandomString(characters, 15);
    print('Random string: $randomString');
  }

  void qr(){
    int number= 9999;
    int qr = int.parse(userPhone!);
    print("${number*qr}");
  }



  String generateRandomString(String characters, int length) {
    final random = Random();
    String result = '';
    for (int i = 0; i < length; i++) {
      result += characters[random.nextInt(characters.length)];
    }
    return result;
  }
  ///
  Future<ApiResponse> updateToken() async {
    try {
      String? deviceToken = await _getDeviceToken();
      FirebaseMessaging.instance.subscribeToTopic(AppConstants.topic);
      Response response = await dioClient!.post(
        AppConstants.tokenUri,
        data: {
          "_method": "put",
          "cm_firebase_token":
          deviceToken
        },
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<String?> _getDeviceToken() async {

    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      CacheHelper.saveData(key: 'firebase_token', value: value);
      CacheHelper.getData(key: 'firebase_token');
    });
    print('FIRBASE TOKEN::: ${CacheHelper.getData(key: 'firebase_token')}');

    // String? deviceToken;
    // if(Platform.isIOS) {
    //   deviceToken = await FirebaseMessaging.instance.getAPNSToken();
    // }else {
    //   deviceToken = await FirebaseMessaging.instance.getToken();
    // }
    //
    //
    // if (deviceToken != null) {
    //   if (kDebugMode) {
    //     print('--------Device Token---------- $deviceToken');
    //   }
    // }
    return CacheHelper.getData(key: 'firebase_token');
  }

  String getUserToken() {
    return sharedPreferences!.getString(AppConstants.linkStudentUrl) ?? "";
  }
  // Future<void> saveAuthToken(String token) async {
  //   dioClient!.token = token;
  //   dioClient!.dio!.options.headers = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization': 'Bearer $token'
  //   };
  //
  //   try {
  //     await sharedPreferences!.setString(AppConstants.token, token);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  String getAuthToken() {
    return sharedPreferences!.getString(AppConstants.linkStudentUrl) ?? "";
  }


  ///login
  Future<ApiResponse> login(String phoneUs,String password) async {
    try {
      // CacheHelper.saveData(key: "token", value: token);
      // CacheHelper.saveData(key: "userPhone", value: userPhone);
   //   userPhone = CacheHelper.getData(key: 'userPhone');
      Response response = await dioClient!.post(
        AppConstants.loginUri,
        data: {
          "phone" : phoneUs,
          "password" : password,
        },

      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
     return ApiResponse.withError(e) ;
     // return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  bool isLoggedIn() {
    print("fcghbj${AppConstants.linkStudentUrl}");
    return sharedPreferences!.containsKey(AppConstants.linkStudentUrl);

  }
  // Future<void> saveUserToken(String token) async {
  //   dioClient!.updateHeader(token);
  //
  //   try {
  //     await sharedPreferences!.setString(AppConstants.token, token);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  ///forget password
  Future<ApiResponse> forgetPassword(String email) async {
    try {
      var random = Random();

      // Generate a random 4-digit number
      int min = 1000; // Minimum 4-digit number
      int max = 9999; // Maximum 4-digit number
      int random4DigitNum = min + random.nextInt(max - min);
      Response response = await dioClient!.post(
        AppConstants.forgetPassword,
        data: {
          "otp" : random4DigitNum,
          "email" : email,
        },
      );
      // randomForget();

      print('Random 4-digit number: $random4DigitNum');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e) ;
      // return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> upadatePassword(String newPass) async {
    try {

      Response response = await dioClient!.post(
        AppConstants.updatePassword,
        data: {
          "newpass" : newPass,
          "email" :
            updateEmail,
        },
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e) ;
      // return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  void randomForget(){
    var random = Random();

    // Generate a random 4-digit number
    int min = 1000; // Minimum 4-digit number
    int max = 9999; // Maximum 4-digit number
    int random4DigitNum = min + random.nextInt(max - min);
    print('Random 4-digit number: $random4DigitNum');
  }
}

