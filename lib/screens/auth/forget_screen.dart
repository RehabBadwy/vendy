import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/auth/signIn_Screen.dart';

import '../../base_widgit/custom_button.dart';
import '../../base_widgit/custom_textfield.dart';
import '../../data/datasource/remote/dio/cash.dart';
import '../../provider/auth_provider.dart';
import '../../util/constant.dart';
import 'otp_verification_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> _formKeyForget = GlobalKey<FormState>();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKeyForget,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                  SizedBox(height: 20,),
                  Text(
                    AppLocalizations.of(context)!.forget,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    AppLocalizations.of(context)!.dontworry,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      color: Color(0xff8391A1)
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20,),
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
                          borderRadius: BorderRadius.circular(
                              12)),
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
                  //   hintText: AppLocalizations.of(context)!.email,
                  //   textInputType: TextInputType.name,
                  //   focusNode: _emailNode,
                  //   nextNode: _passNode,
                  //   controller: _emailController,
                  //   fillColor:  Color(0xffE8ECF4),
                  // ),
                  SizedBox(height: 20,),
                  CustomButton(
                    onTap: ()async{
                      if (_formKeyForget.currentState!.validate()==true) {
                        String email = _emailController.text.trim();
                        if (email.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(AppLocalizations.of(context)!.emailmust),
                            backgroundColor: Colors.red,
                          ));
                        }else{
                          await Provider.of<AuthProvider>(context, listen: false).forgetPassword(
                              _emailController.text.trim());
                          CacheHelper.saveData(key: "updateEmail", value: _emailController.text);
                          updateEmail = CacheHelper.getData(key: 'updateEmail');
                          print(updateEmail);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationScreen()));
                        }
                      }
                    },
                    buttonText: AppLocalizations.of(context)!.send, ),
                  SizedBox(height: 20,),
                  Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: AppLocalizations.of(context)!.rememberpassword,
                              style: TextStyle(
                                  color: Color(0xff6A707C),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15
                              ),
                            ),
                            TextSpan(text: AppLocalizations.of(context)!.login,
                              style: TextStyle(
                                  color: Color(0xffC3AA94),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),
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
          )
      ),
    );
  }
}
