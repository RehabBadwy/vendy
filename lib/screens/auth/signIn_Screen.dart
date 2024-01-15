import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/auth/forget_screen.dart';
import 'package:vendy_station/screens/auth/register_screen.dart';
import 'package:vendy_station/screens/auth/terms_auth.dart';
import 'package:vendy_station/screens/onBoarding/onboard_screen.dart';

import '../../base_widgit/custom_button.dart';
import '../../base_widgit/custom_password_textfield.dart';
import '../../base_widgit/custom_textfield.dart';
import '../../data/datasource/remote/dio/cash.dart';
import '../../provider/auth_provider.dart';
import '../../util/constant.dart';
import '../dashboard/dashboard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();
  GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  final FocusNode focusNode = FocusNode();
  final FocusNode nextNode = FocusNode();
  TextInputAction? textInputAction;
  bool? _isChecked = false;

  void loginUser() async {
    if (_formKeyLogin!.currentState!.validate()) {
      _formKeyLogin!.currentState!.save();

      String email = _phoneController!.text.trim();
      String password = _passwordController!.text.trim();

      if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('EMAIL_MUST_BE_REQUIRED'),
          backgroundColor: Colors.red,
        ));
      } else if (password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('PASSWORD_MUST_BE_REQUIRED'),
          backgroundColor: Colors.red,
        ));
      } else {
        // if (Provider.of<AuthProvider>(context, listen: false).isRemember!) {
        //   Provider.of<AuthProvider>(context, listen: false).saveUserEmail(email, password);
        // } else {
        //   Provider.of<AuthProvider>(context, listen: false).clearUserEmailAndPassword();
        // }
        //
        // loginBody.email = email;
        // loginBody.password = password;
        // await Provider.of<AuthProvider>(context, listen: false).login(loginBody, route);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKeyLogin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnBoardingScreen()));
                      // Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/images/back.png",
                      width: 40,
                      height: 40,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.welcome,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 20,
                ),
                // CustomTextField(
                //   hintText: 'Phone',
                //   textInputType: TextInputType.phone,
                //   focusNode: _emailNode,
                //   nextNode: _passNode,
                //   // isPhoneNumber: false,
                //   // capitalization: TextCapitalization.words,
                //   controller: _phoneController,
                //   fillColor:  Color(0xffE8ECF4),
                // ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _phoneController,
                  validator: (val) {
                    if ((val!.isEmpty) ||
                        val.length != 11 ||
                        !(val.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)) {
                      return AppLocalizations.of(context)!.phonemust;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.phone,
                    // labelText: "labelText",
                    // suffixIcon: suffixIcon,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(12)),
                    hintStyle: TextStyle(color: Colors.black, fontSize: 12),
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(12)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  controller: _passwordController,
                  obscureText: _obscureText,
                  focusNode: focusNode,
                  textInputAction: textInputAction ?? TextInputAction.next,
                  onFieldSubmitted: (v) {
                    setState(() {
                      textInputAction == TextInputAction.done
                          ? FocusScope.of(context).consumeKeyboardToken()
                          : FocusScope.of(context).requestFocus(nextNode);
                    });
                  },
                  //  validator: (value) {
                  //    return null;
                  //  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return AppLocalizations.of(context)!.passmust;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(12)),
                    hintStyle: TextStyle(color: Colors.black, fontSize: 12),
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(12)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: _toggle),
                    hintText: AppLocalizations.of(context)!.password,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 15),
                  ),
                ),
                // CustomPasswordTextField(
                //   hintTxt: 'Enter Your Password',
                //   textInputAction: TextInputAction.done,
                //   focusNode: _passNode,
                //   controller: _passwordController,
                // ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPasswordScreen()));
                  },
                  child: Text(
                    AppLocalizations.of(context)!.forget,
                    style: TextStyle(
                        color: Color(0xff6A707C),
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsAuth()));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.terms,
                        style: TextStyle(
                            color: Color(0xff6A707C),
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                    Spacer(),
                    Checkbox(
                      value: _isChecked,
                      onChanged: (newValue) {
                        setState(() {
                          _isChecked = newValue;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                  ],
                ),
                // CheckboxListTile(
                //   title: Text("Terms Condition",
                //     style: TextStyle(
                //         color: Color(0xff6A707C),
                //         fontWeight: FontWeight.w600,
                //         fontSize: 14
                //     ),
                //   ),
                //   value: _isChecked,
                //   onChanged: (newValue){
                //     setState(() {
                //       _isChecked =newValue;
                //     });
                //   },
                //   activeColor: Colors.green,
                //   checkColor: Colors.grey,
                //
                // ),
                CustomButton(
                    onTap: () async {
                      if (_formKeyLogin.currentState!.validate() == true) {
                        String email = _phoneController.text.trim();
                        String password = _passwordController.text.trim();

                        if (email.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('EMAIL_MUST_BE_REQUIRED'),
                            backgroundColor: Colors.red,
                          ));
                        } else if (password.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('PASSWORD_MUST_BE_REQUIRED'),
                            backgroundColor: Colors.red,
                          ));
                        } else if (_isChecked == false) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('isChecked_MUST_BE_REQUIRED'),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          Provider.of<AuthProvider>(context, listen: false)
                              .login(context, _phoneController.text.trim(),
                                  _passwordController.text.trim());

                          //  CacheHelper.saveData(key: "token", value:
                          // Provider.of<AuthProvider>(context, listen: false).loginModel!.status!.token);
                          // token = CacheHelper.getData(key: 'token');

                          CacheHelper.saveData(
                              key: "userPhone",
                              value: Provider.of<AuthProvider>(context,
                                      listen: false)
                                  .loginModel!
                                  .status!
                                  .phone);
                          userPhone = CacheHelper.getData(key: 'userPhone');

                          CacheHelper.saveData(
                              key: "mac",
                              value: Provider.of<AuthProvider>(context,
                                      listen: false)
                                  .loginModel!
                                  .status!
                                  .userMac);
                          mac = CacheHelper.getData(key: 'mac');

                          CacheHelper.saveData(
                              key: "mac2",
                              value: Provider.of<AuthProvider>(context,
                                      listen: false)
                                  .loginModel!
                                  .status!
                                  .userMac2);
                          mac2 = CacheHelper.getData(key: 'mac2');

                          CacheHelper.saveData(
                              key: "email",
                              value: Provider.of<AuthProvider>(context,
                                      listen: false)
                                  .loginModel!
                                  .status!
                                  .email);
                          email = CacheHelper.getData(key: 'email');

                          CacheHelper.saveData(
                              key: "name",
                              value: Provider.of<AuthProvider>(context,
                                      listen: false)
                                  .loginModel!
                                  .status!
                                  .name);
                          name = CacheHelper.getData(key: 'name');

                          CacheHelper.saveData(
                              key: "pass",
                              value: Provider.of<AuthProvider>(context,
                                      listen: false)
                                  .loginModel!
                                  .status!
                                  .password);
                          pass = CacheHelper.getData(key: 'pass');
                        }
                      } else if (Provider.of<AuthProvider>(context,
                                  listen: false)
                              .loginModel!
                              .status!
                              .email ==
                          null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("fail")));
                      }
                    },
                    buttonText: AppLocalizations.of(context)!.login),
                SizedBox(
                  height: 30,
                ),

                // Center(
                //   child: Text("Or Login With",
                //     style: TextStyle(
                //         color: Color(0xff6A707C),
                //         fontWeight: FontWeight.w600,
                //         fontSize: 14
                //     ),
                //   ),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //   TextButton(onPressed: (){
                //
                //   }, child: Image.asset(
                //       "assets/images/Facebook.png",width: 80,)),
                //   TextButton(onPressed: (){
                //
                //   }, child: Image.asset(
                //       "assets/images/Google.png",width: 80,)),
                //   TextButton(onPressed: (){
                //
                //   }, child: Image.asset(
                //       "assets/images/Apple.png",width: 80,)),
                // ],),
                // SizedBox(height: 30,),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: AppLocalizations.of(context)!.account,
                            style: TextStyle(
                                color: Color(0xff6A707C),
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                          TextSpan(
                            text: AppLocalizations.of(context)!.registernow,
                            style: TextStyle(
                                color: Color(0xffC3AA94),
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
