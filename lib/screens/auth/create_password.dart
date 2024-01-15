import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/auth/password_change.dart';

import '../../base_widgit/custom_button.dart';
import '../../base_widgit/custom_password_textfield.dart';
import '../../base_widgit/custom_textfield.dart';
import '../../data/datasource/remote/dio/cash.dart';
import '../../provider/auth_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreatePasswordScreen> createState() => _CreeatePasswordScreenState();
}

class _CreeatePasswordScreenState extends State<CreatePasswordScreen> {
 // TextEditingController? _passwordController;
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
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
                      AppLocalizations.of(context)!.createnewpassword,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                        AppLocalizations.of(context)!.unique,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8391A1)
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 20,),
                    // CustomTextField(
                    //   hintText: 'email',
                    //   textInputType: TextInputType.phone,
                    //   // focusNode: _emailNode,
                    //   // nextNode: _passNode,
                    //   // isPhoneNumber: false,
                    //   // capitalization: TextCapitalization.words,
                    //   controller: _emailController,
                    //   fillColor:  Color(0xffE8ECF4),
                    // ),
                    // SizedBox(height: 20,),
                    CustomPasswordTextField(
                      hintTxt: AppLocalizations.of(context)!.password,
                      // textInputAction: TextInputAction.done,
                      // focusNode: _passNode,
                      controller: _passwordController,
                    ),
                    SizedBox(height: 20,),
                    CustomPasswordTextField(
                      hintTxt: AppLocalizations.of(context)!.confirmpassword,
                      textInputAction: TextInputAction.done,
                      // focusNode: _passNode,
                      controller: _confirmPasswordController,
                    ),
                    SizedBox(height: 30,),
                    CustomButton(
                      onTap: (){
                        if (_formKey.currentState!.validate()==true) {
                        //  String email = _emailController.text.trim();
                          String password = _passwordController.text.trim();
                          // if (email.isEmpty) {
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text('EMAIL_MUST_BE_REQUIRED'),
                          //     backgroundColor: Colors.red,
                          //   ));
                          // }
                           if (password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('PASSWORD_MUST_BE_REQUIRED'),
                              backgroundColor: Colors.red,
                            ));
                          }else{
                            Provider.of<AuthProvider>(context, listen: false).updatePassword(
                             //   _emailController.text.trim(),
                              //  CacheHelper.getData(key: 'updateEmail'),
                                _passwordController.text.trim());
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PasswordChangeScreen()));

                          }
                        }
                      },
                      buttonText: AppLocalizations.of(context)!.resetpassword, ),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
