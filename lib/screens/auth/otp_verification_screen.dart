import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../base_widgit/custom_button.dart';
import '../../data/datasource/remote/dio/cash.dart';
import '../../provider/auth_provider.dart';
import '../../util/constant.dart';
import '../../util/dimensions.dart';
import 'create_password.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class VerificationScreen extends StatefulWidget {
  // final String tempToken;
  // final String mobileNumber;
  // final String? email;
  final bool fromForgetPassword;
  const VerificationScreen(/*this.tempToken, this.mobileNumber, this.email,*/ {Key? key, this.fromForgetPassword = false}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  Timer? _timer;
  int? _seconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
  //  _seconds = Provider.of<AuthProvider>(context, listen: false).resendTime;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds = _seconds! - 1;
      if(_seconds == 0) {
        timer.cancel();
        _timer?.cancel();
      }
      setState(() {});
    });
  }



  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    int minutes = (_seconds! / 60).truncate();
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');




    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: SizedBox(
                  width: 1170,
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
                          AppLocalizations.of(context)!.verification,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                          AppLocalizations.of(context)!.verificationcode,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff8391A1)
                        ),
                        textAlign: TextAlign.start,
                      ),
                     // const SizedBox(height:20),


                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 50),
                      //   child: Center(child: Text(widget.email == ''?
                      //   '${Text('please_enter_4_digit_code')}\n${widget.mobileNumber}':
                      //   '${Text('please_enter_4_digit_code')}\n${widget.email}',
                      //     textAlign: TextAlign.center,)),),


                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 35),
                          child: PinCodeTextField(
                            controller: _otpController,
                            length: 4,
                            appContext: context,
                            obscureText: false,
                            showCursor: true,
                            keyboardType: TextInputType.number,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              fieldHeight: 63,
                              fieldWidth: 55,
                              borderWidth: 1,
                              borderRadius: BorderRadius.circular(10),
                              selectedColor: Colors.black,
                              selectedFillColor: Colors.white,
                              inactiveFillColor: Colors.white,
                              inactiveColor: Colors.black,
                              activeColor: Colors.black,
                              activeFillColor: Colors.white,
                            ),
                            animationDuration: const Duration(milliseconds: 300),
                            backgroundColor: Colors.transparent,
                            enableActiveFill: true,
                          //  onChanged: authProvider.updateVerificationCode,
                            beforeTextPaste: (text) {
                              return true;
                            }, onChanged: (String value) {  },
                          ),
                        ),
                      ),


                      if(_seconds! <= 0)
                        Column(children: [
                       //   Center(child: Text('i_didnt_receive_the_code',)),

                          Center(
                            child: InkWell(
                              onTap: () {


                                // if(widget.fromForgetPassword){
                                //   Provider.of<AuthProvider>(context, listen: false).forgetPassword(widget.mobileNumber).then((value) {
                                //     if (value.isSuccess) {
                                //       _startTimer();
                                //       showCustomSnackBar('Resent code successful', context, isError: false);
                                //     } else {
                                //       showCustomSnackBar(value.message, context);
                                //     }
                                //   });
                                //
                                // }
                                // else if(widget.email!.isNotEmpty){
                                //   Provider.of<AuthProvider>(context, listen: false).checkEmail(widget.email!, widget.tempToken, resendOtp: true).then((value) {
                                //     if (value.isSuccess) {
                                //       _startTimer();
                                //       showCustomSnackBar('Resent code successful', context, isError: false);
                                //     } else {
                                //       showCustomSnackBar(value.message, context);
                                //     }
                                //   });
                                //
                                // }else{
                                //   Provider.of<AuthProvider>(context, listen: false).checkPhone(widget.mobileNumber,widget.tempToken, fromResend: true).then((value) {
                                //     if (value.isSuccess) {
                                //       _startTimer();
                                //       showCustomSnackBar('Resent code successful', context, isError: false);
                                //     } else {
                                //       showCustomSnackBar(value.message, context);
                                //     }
                                //   });
                                // }

                              },
                              child: Padding(
                                padding:  EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                                child: CustomButton(
                                  onTap: ()async{
                                    if (_formKey.currentState!.validate()==true) {
                                      String otp = _otpController.text.trim();
                                      if (otp.isEmpty) {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text('otp_MUST_BE_REQUIRED'),
                                          backgroundColor: Colors.red,
                                        ));
                                      }else{
                                        await Provider.of<AuthProvider>(context, listen: false).forgetPassword(
                                            _emailController.text.trim(),);
                                        // CacheHelper.saveData(key: "updateEmail", value: _emailController.text);
                                        // updateEmail = CacheHelper.getData(key: "updateEmail");
                                        // print(updateEmail);
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CreatePasswordScreen()));
                                      }
                                    }
                                  },
                                  buttonText: AppLocalizations.of(context)!.confirm,
                            ),
                          ),
                            )
                          )
                        ],
                            ),





                      // if(_seconds! > 0)
                      //   Text('${getTranslated('resend_code', context)} ${getTranslated('after', context)} ${_seconds! > 0 ? '$minutesStr:${_seconds! % 60}' : ''} ${'Sec'}'),
                      //


                      const SizedBox(height: 48),


                    //  authProvider.isEnableVerificationCode ? !authProvider.isPhoneNumberVerificationButtonLoading ?
                    //   Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
                    //     child: CustomButton(
                    //       backgroundColor: Colors.red,
                    //       buttonText: getTranslated('verify', context),
                    //
                    //       onTap: () {
                    //         bool phoneVerification = Provider.of<SplashProvider>(context,listen: false).configModel!.forgetPasswordVerification =='phone';
                    //         if(phoneVerification && widget.fromForgetPassword){
                    //           Provider.of<AuthProvider>(context, listen: false).verifyOtp(widget.mobileNumber).then((value) {
                    //             if(value.isSuccess) {
                    //               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    //                   builder: (_) => ResetPasswordWidget(mobileNumber: widget.mobileNumber,
                    //                       otp: authProvider.verificationCode)), (route) => false);
                    //             }else {
                    //               ScaffoldMessenger.of(context).showSnackBar(
                    //                   SnackBar(content: Text(getTranslated('input_valid_otp', context)!),
                    //                     backgroundColor: Colors.red,)
                    //               );
                    //             }
                    //           });
                    //         }else{
                    //           if(Provider.of<SplashProvider>(context,listen: false).configModel!.phoneVerification!){
                    //             Provider.of<AuthProvider>(context, listen: false).verifyPhone(widget.mobileNumber,widget.tempToken).then((value) {
                    //               if(value.isSuccess) {
                    //                 ScaffoldMessenger.of(context).showSnackBar(
                    //                     SnackBar(content: Text(getTranslated('sign_up_successfully_now_login', context)!),
                    //                       backgroundColor: Colors.green,)
                    //                 );
                    //                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    //                     builder: (_) => const AuthScreen(initialPage: 0)), (route) => false);
                    //               }else {
                    //                 showCustomSnackBar(value.message, context);
                    //               }
                    //             });
                    //           }
                    //           else{
                    //             Provider.of<AuthProvider>(context, listen: false).verifyEmail(widget.email!,widget.tempToken).then((value) {
                    //               if(value.isSuccess) {
                    //                 ScaffoldMessenger.of(context).showSnackBar(
                    //                     SnackBar(content: Text(getTranslated('sign_up_successfully_now_login', context)!),
                    //                       backgroundColor: Colors.green,)
                    //                 );
                    //                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    //                     builder: (_) => const AuthScreen(initialPage: 0)), (route) => false);
                    //               }else {
                    //                 ScaffoldMessenger.of(context).showSnackBar(
                    //                     SnackBar(content: Text(value.message!),backgroundColor: Colors.red)
                    //                 );
                    //               }
                    //             });
                    //           }
                    //         }
                    //
                    //
                    //
                    //
                    //
                    //       },
                    //     ),
                    //   ):  Center(child: CircularProgressIndicator(
                    //       valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)))
                    //       : const SizedBox.shrink(),

                      // Consumer<AuthProvider>(builder: (context,authProvider,child)=>
                      //     InkWell(
                      //       onTap: (){
                      //
                      //         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignInWidget()), (route) => true);
                      //       },
                      //       child: Center(
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Text(getTranslated("backTo", context)!,
                      //               style: titleRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Colors.grey),
                      //             ),
                      //             Text(getTranslated("SignIn", context)!,
                      //               style: titleRegular.copyWith(fontSize: Dimensions.fontSizeLarge,decoration: TextDecoration.underline),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //),
                      Center(
                        child: InkWell(
                          onTap: (){
                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: AppLocalizations.of(context)!.receivedcode,
                                  style: TextStyle(
                                      color: Color(0xff6A707C),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15
                                  ),
                                ),
                                TextSpan(text: AppLocalizations.of(context)!.resend,
                                  style: TextStyle(
                                      color: Color(0xffC3AA94),
                                      fontWeight: FontWeight.w600,
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
