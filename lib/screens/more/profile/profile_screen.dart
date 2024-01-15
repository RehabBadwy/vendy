import 'package:flutter/material.dart';
import 'package:vendy_station/screens/more/profile/save_profile.dart';
import 'package:vendy_station/util/color_manager.dart';
import 'package:vendy_station/util/constant.dart';

import '../../../base_widgit/custom_button.dart';
import '../../../base_widgit/custom_password_textfield.dart';
import '../../../base_widgit/custom_textfield.dart';
import '../../../util/dimensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FocusNode _fNameFocus = FocusNode();
  final FocusNode _lNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Center(
                //   child:  Stack(
                //     alignment: AlignmentDirectional.bottomStart,
                //     children: [
                //       CircleAvatar(
                //         backgroundImage: AssetImage("assets/images/Oval.png"),
                //         radius: 50,
                //         backgroundColor: Colors.transparent,
                //       ),
                //
                //
                //     ],
                //   ),
                // ),
                Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                    SizedBox(width: 30,),
                    Center(
                        child:  Text(name!,
                        overflow:TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1E232C)
                          ),
                        ),),

                  ],
                ),

                Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.marginSizeDefault,
                      left: Dimensions.marginSizeDefault,
                      right: Dimensions.marginSizeDefault),
                  child: Column(
                    children: [
                      Row(children: [
                        Icon(Icons.person, color: ColorManager.brown, size: 20),
                        SizedBox(width: Dimensions.marginSizeExtraSmall),
                        Text(AppLocalizations.of(context)!.name,
                          //style: titilliumRegular
                        )
                      ],),
                      SizedBox(height: Dimensions.marginSizeExtraSmall),
                      TextFormField(
                        decoration: InputDecoration(
                          enabled: false,
                          hintText: name,
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

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.marginSizeDefault,
                      left: Dimensions.marginSizeDefault,
                      right: Dimensions.marginSizeDefault),
                  child: Column(
                    children: [
                      Row(children: [
                        Icon(Icons.email_outlined, color: ColorManager.brown, size: 20),
                        SizedBox(width: Dimensions.marginSizeExtraSmall),
                        Text(AppLocalizations.of(context)!.email,
                          //style: titilliumRegular
                        )
                      ],
                      ),
                      SizedBox(height: Dimensions.marginSizeExtraSmall),

                      TextFormField(
                        decoration: InputDecoration(
                          enabled: false,
                          hintText: email,
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
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: Dimensions.marginSizeDefault,
                      left: Dimensions.marginSizeDefault,
                      right: Dimensions.marginSizeDefault),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.phone,
                              color: ColorManager.brown,
                              size: 20),
                          const SizedBox(
                              width:
                              Dimensions.marginSizeExtraSmall),
                          Text(AppLocalizations.of(context)!.phone,

                          )
                        ],
                      ),
                      const SizedBox(
                          height: Dimensions.marginSizeSmall),
                      TextFormField(
                        decoration: InputDecoration(
                          enabled: false,
                          hintText: userPhone,
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
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.marginSizeDefault,
                      left: Dimensions.marginSizeDefault,
                      right: Dimensions.marginSizeDefault),
                  child: Column(
                    children: [
                      Row(children: [
                        Icon(Icons.password, color: ColorManager.brown, size: 20),
                        SizedBox(width: Dimensions.marginSizeExtraSmall),
                        Text(AppLocalizations.of(context)!.password,
                          //style: titilliumRegular
                        )
                      ],
                      ),
                      SizedBox(height: Dimensions.marginSizeExtraSmall),

                      TextFormField(
                        decoration: InputDecoration(
                          enabled: false,
                          hintText: pass,
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
                    ],
                  ),
                ),
                // Center(
                //   child: Column(
                //
                //     children: [
                //       Text(name!,
                //         style: TextStyle(
                //             fontSize: 30,
                //             fontWeight: FontWeight.w700,
                //             color: Color(0xff1E232C)
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                SizedBox(height: 20,),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: CustomButton(
                //     onTap: (){
                //       Navigator.push(context, MaterialPageRoute(builder: (context)=>SaveProfile()));
                //     },
                //     buttonText: 'Save', ),
                // ),
                // SizedBox(height: 2,),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: CustomButton(
                //     isBuy: true,
                //     isBorder: true,
                //     onTap: (){
                //       Navigator.pop(context);
                //     },
                //
                //     buttonText: 'Back', ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
