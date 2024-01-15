import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/auth/signIn_Screen.dart';
import 'package:vendy_station/screens/auth/terms_auth.dart';
import 'package:vendy_station/screens/dashboard/dashboard.dart';

import '../../base_widgit/custom_button.dart';
import '../../base_widgit/custom_password_textfield.dart';
import '../../base_widgit/custom_textfield.dart';
import '../../data/datasource/remote/dio/cash.dart';
import '../../data/model/regester_model.dart';
import '../../provider/auth_provider.dart';
import '../../util/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../onBoarding/onboard_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool? _isChecked = false;
  bool isEmailVerified = false;
  final FocusNode focusNode = FocusNode();
  final FocusNode nextNode = FocusNode();
  TextInputAction? textInputAction;
  final FocusNode focus = FocusNode();
  final FocusNode next = FocusNode();
  TextInputAction? textAction;
  RegisterModel register = RegisterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const OnBoardingScreen()));
                          //   Navigator.pop(context);
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
                      AppLocalizations.of(context)!.hello,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // CustomTextField(
                    //   hintText: 'Name',
                    //   textInputType: TextInputType.name,
                    //
                    //   controller: _firstNameController,
                    //   fillColor:  Color(0xffE8ECF4),
                    // ),
                    TextFormField(
                      controller: _firstNameController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return AppLocalizations.of(context)!.namemust;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.name,
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

                    ///email
                    TextFormField(
                      validator: (val) {
                        if ((val!.isEmpty) ||
                            !(val.isEmpty) &&
                                !RegExp(r"^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)$")
                                    .hasMatch(val)) {
                          return AppLocalizations.of(context)!.emailmust;
                        }
                        return null;
                      },
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.email,
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
                    // CustomTextField(
                    //   hintText: 'Enter Your Email',
                    //   textInputType: TextInputType.name,
                    //
                    //   controller: _emailController,
                    //   fillColor:  Color(0xffE8ECF4),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    // CustomTextField(
                    //   hintText: 'Phone Number',
                    //   textInputType: TextInputType.number,
                    //
                    //   controller: _phoneController,
                    //   fillColor:  Color(0xffE8ECF4),
                    // ),
                    ///phone
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _phoneController,
                      validator: (val) {
                        if ((val!.isEmpty) ||
                            val.length != 11 ||
                            !(val.isEmpty) &&
                                !RegExp(r"^(\d+)*$").hasMatch(val)) {
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
                    // CustomPasswordTextField(
                    //   hintTxt: 'Enter Your Password',
                    //
                    //   controller: _passwordController,
                    // ),
                    TextFormField(
                      cursorColor: Theme.of(context).primaryColor,
                      controller: _passwordController,
                      obscureText: _obscureText,
                      focusNode: focus,
                      textInputAction: textAction ?? TextInputAction.next,
                      onFieldSubmitted: (v) {
                        setState(() {
                          textAction == TextInputAction.done
                              ? FocusScope.of(context).consumeKeyboardToken()
                              : FocusScope.of(context).requestFocus(next);
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
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      cursorColor: Theme.of(context).primaryColor,
                      controller: _confirmPasswordController,
                      obscureText: _obscureOne,
                      focusNode: focusNode,
                      textInputAction: textInputAction ?? TextInputAction.next,
                      onFieldSubmitted: (v) {
                        setState(() {
                          textInputAction == TextInputAction.done
                              ? FocusScope.of(context).consumeKeyboardToken()
                              : FocusScope.of(context).requestFocus(nextNode);
                        });
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return AppLocalizations.of(context)!.passconfirmmust;
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
                            icon: Icon(_obscureOne
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: _toggleOne),
                        hintText: AppLocalizations.of(context)!.confirmpassword,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 15),
                      ),
                    ),

                    SizedBox(
                      height: 30,
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
                    CustomButton(
                      onTap: () async {
                        if (_formKey.currentState!.validate() == true) {
                          String firstName = _firstNameController.text.trim();
                          String email = _emailController.text.trim();
                          String phone = _phoneController.text.trim();
                          String password = _passwordController.text.trim();
                          String confirmPassword =
                              _confirmPasswordController.text.trim();

                          if (firstName.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('first_name_field_is_required'),
                              backgroundColor: Colors.red,
                            ));
                          } else if (email.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('EMAIL_MUST_BE_REQUIRED'),
                              backgroundColor: Colors.red,
                            ));
                          } else if (phone.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('PHONE_MUST_BE_REQUIRED'),
                              backgroundColor: Colors.red,
                            ));
                          } else if (password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'PASSWORD_MUST_BE_REQUIRED',
                              ),
                              backgroundColor: Colors.red,
                            ));
                          } else if (confirmPassword.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('CONFIRM_PASSWORD_MUST_BE_REQUIRED'),
                              backgroundColor: Colors.red,
                            ));
                          } else if (_isChecked == false) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('isChecked_MUST_BE_REQUIRED'),
                              backgroundColor: Colors.red,
                            ));
                          } else if (password != confirmPassword) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('PASSWORD_DID_NOT_MATCH'),
                              backgroundColor: Colors.red,
                            ));
                          } else {
                            Provider.of<AuthProvider>(context, listen: false)
                                .registration(
                                    context,
                                    _firstNameController.text.trim(),
                                    _phoneController.text.trim(),
                                    _emailController.text.trim(),
                                    _passwordController.text.trim());
                            // CacheHelper.saveData(key: "token", value:
                            // Provider.of<AuthProvider>(context, listen: false).loginModel!.status!.token);
                            // token = CacheHelper.getData(key: 'token');
                            // await Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
                          }
                        }
                      },
                      buttonText: AppLocalizations.of(context)!.register,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // Center(
                    //   child: Text("Or Register With",
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
                    //     TextButton(onPressed: (){
                    //
                    //     }, child: Image.asset(
                    //       "assets/images/Facebook.png",width: 80,)),
                    //     TextButton(onPressed: (){
                    //
                    //     }, child: Image.asset(
                    //       "assets/images/Google.png",width: 80,)),
                    //     TextButton(onPressed: (){
                    //
                    //     }, child: Image.asset(
                    //       "assets/images/Apple.png",width: 80,)),
                    //   ],),
                    // SizedBox(height: 30,),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context)!.already,
                                style: TextStyle(
                                    color: Color(0xff6A707C),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              ),
                              TextSpan(
                                text: AppLocalizations.of(context)!.loginnow,
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

  bool _obscureOne = true;

  void _toggleOne() {
    setState(() {
      _obscureOne = !_obscureOne;
    });
  }
}
