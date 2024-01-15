import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vendy_station/screens/auth/signIn_Screen.dart';
import '../data/datasource/remote/dio/cash.dart';
import '../data/model/login_fail.dart';
import '../data/model/login_model.dart';
import '../data/model/regester_model.dart';
import '../data/repo/auth_repo.dart';
import '../data/repo/base/api_response.dart';
import '../data/repo/base/error_response.dart';
import '../screens/dashboard/dashboard.dart';
import '../util/constant.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo? authRepo;
  AuthProvider({required this.authRepo});
  bool _isLoading = false;
  bool get isLoading => _isLoading;


  RegisterModel? _registerModel;
  RegisterModel? get registerModel => _registerModel;
  Future registration(BuildContext context,String name,String phone,String email,String password) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo!.registration(name, phone, email, password);
    _isLoading = false;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _registerModel = RegisterModel.fromJson(apiResponse.response!.data);
      if(registerModel!.message=="success"){

        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("success")));
        // CacheHelper.saveData(key: "token", value: loginModel!.status!.token);
       // token = CacheHelper.getData(key: 'token');
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(registerModel!.message!)));
        notifyListeners();
      }
    }
    // if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
    //   // if(RegisterModel.fromJson(apiResponse.response!.data).message!=null){
    //   //   RegisterModel.fromJson(apiResponse.response!.data).message!;
    //   // };
    //   print(apiResponse.response!.data);
    // }

    ///
    // if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
    //   Map map = apiResponse.response!.data;
    //   String? temporaryToken = '';
    //   String? token = '';
    //   String? message = '';
    //  // String token = map["token"];
    //
    //   try{
    //     message = map["message"];
    //
    //   }catch(e){
    //
    //     if (kDebugMode) {
    //       print(e);
    //     }
    //   }
    //   try{
    //     token = map["token"];
    //
    //   }catch(e){
    //     if (kDebugMode) {
    //       print(e);
    //     }
    //   }
    //   try{
    //     temporaryToken = map["temporary_token"];
    //
    //   }catch(e){
    //     if (kDebugMode) {
    //       print(e);
    //     }
    //   }
    //
    //   if(token != null && token.isNotEmpty){
    //   //  authRepo!.saveUserToken(token);
    //     await authRepo!.updateToken();
    //   }
    //
    // } else {
    //   String? errorMessage;
    //   if (apiResponse.error is String) {
    //     if (kDebugMode) {
    //       print(apiResponse.error.toString());
    //     }
    //     errorMessage = apiResponse.error.toString();
    //   } else {
    //     ErrorResponse errorResponse = apiResponse.error;
    //     if (kDebugMode) {
    //       print(errorResponse.errors![0].message);
    //     }
    //     errorMessage = errorResponse.errors![0].message;
    //   }
    // }
    notifyListeners();
  }
  ///token
  Future<void> updateToken(BuildContext context) async {
    CacheHelper.saveData(key: 'token', value: token);


    // ApiResponse apiResponse = await authRepo!.updateToken();
    // if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
    //
    // } else {
    //   print("fghj");
    // //  ApiChecker.checkApi( apiResponse);
    // }
  }
  bool isLoggedIn() {
    // CacheHelper.saveData(key: "token", value: token);
    // return authRepo!.isLoggedIn();

    CacheHelper.saveData(key: "token", value: loginModel!.status!.token);
  return  token = CacheHelper.getData(key: 'token');
  }
  // Future authToken(String authToken ) async{
  //   authRepo!.saveAuthToken(authToken);
  //   notifyListeners();
  // }
  String getUserToken() {
    return authRepo!.getUserToken();
  }
  ///login


  LoginModel? _loginModel;
  LoginModel? get loginModel => _loginModel;
  LoginFail? _loginFail;
  LoginFail? get loginFail => _loginFail;
  Future login(BuildContext context,String phoneUs,String password) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo!.login(phoneUs, password);
    _isLoading = false;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _loginModel = LoginModel.fromJson(apiResponse.response!.data);
      if(loginModel!.status!.status=="0"){

        CacheHelper.saveData(key: "token", value: loginModel!.status!.token);
        token = CacheHelper.getData(key: 'token');

        String user = jsonEncode(LoginModel.fromJson(apiResponse.response!.data));
        CacheHelper.saveData(key: 'userData', value: user);
        Map json = jsonDecode(CacheHelper.getData(key: 'userData'));
        print(json);

        CacheHelper.saveData(
            key: 'userPhone', value: loginModel!.status!.phone);
        userPhone = CacheHelper.getData(key: 'userPhone');

        CacheHelper.saveData(
            key: 'mac', value: loginModel!.status!.userMac);
        mac = CacheHelper.getData(key: 'mac');


        CacheHelper.saveData(
            key: 'mac2', value: loginModel!.status!.userMac2);
        mac2 = CacheHelper.getData(key: 'mac2');


        CacheHelper.saveData(
            key: 'email', value: loginModel!.status!.email);
        email = CacheHelper.getData(key: 'email');


        CacheHelper.saveData(
            key: 'name', value: loginModel!.status!.name);
        name = CacheHelper.getData(key: 'name');

        CacheHelper.saveData(
            key: 'pass', value: loginModel!.status!.password);
        pass = CacheHelper.getData(key: 'pass');

        // Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
     //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("success")));
      } else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Something")));
        notifyListeners();
      }
      //   Map map = apiResponse.response!.data;
      //   String? temporaryToken = '';
      //   String? token = '';
      //   String? message = '';
      //   // String token = map["token"];
      //
      //   try{
      //     message = map["message"];
      //
      //   }catch(e){
      //
      //     if (kDebugMode) {
      //       print(e);
      //     }
      //   }
      //   try{
      //     token = map["token"];
      //
      //   }catch(e){
      //     if (kDebugMode) {
      //       print(e);
      //     }
      //   }
      //   try{
      //     temporaryToken = map["temporary_token"];
      //
      //   }catch(e){
      //     if (kDebugMode) {
      //       print(e);
      //     }
      //   }
      //
      //   if(token != null && token.isNotEmpty){
      //    // authRepo!.saveUserToken(token);
      //     await authRepo!.updateToken();
      //   }
      //
      //   // callback(true, token, temporaryToken, message);
      //   // notifyListeners();
      // } else {
      //   String? errorMessage;
      //   if (apiResponse.error is String) {
      //     if (kDebugMode) {
      //       print(apiResponse.error.toString());
      //     }
      //     errorMessage = apiResponse.error.toString();
      //   }
      //   // else {
      //   //  // ErrorResponse errorResponse = apiResponse.error;
      //   //   if (kDebugMode) {
      //   //     print(errorResponse.errors![0].message);
      //   //   }
      //   //   errorMessage = errorResponse.errors![0].message;
      //   // }
      //  // callback(false, '', '' , errorMessage);
      //   notifyListeners();
      // }
    }
    notifyListeners();
  }
///forgetpass
  Future forgetPassword(String email) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo!.forgetPassword(email);
    _isLoading = false;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      CacheHelper.saveData(key: 'updateEmail', value: email);
    //  updateEmail = CacheHelper.getData(key: 'updateEmail');
      // if(ForgetPassword.fromJson(apiResponse.response!.data).email!=null){
      //   ForgetPassword.fromJson(apiResponse.response!.data);
      // };
      notifyListeners();
    }
  }


  Future updatePassword(String newPass) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo!.upadatePassword(newPass);
    _isLoading = false;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      updateEmail = CacheHelper.getData(key: 'updateEmail');
      print(updateEmail);
      // if(ForgetPassword.fromJson(apiResponse.response!.data).email!=null){
      //   ForgetPassword.fromJson(apiResponse.response!.data);
      // };
      notifyListeners();
    }
  }



}
class ErrorModel {
  String? code;
  String? message;

  ErrorModel({this.code, this.message});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }
}