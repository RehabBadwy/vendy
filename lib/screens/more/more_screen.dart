import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vendy_station/data/datasource/remote/dio/cash.dart';
import 'package:vendy_station/screens/auth/signIn_Screen.dart';
import 'package:vendy_station/screens/more/language.dart';
import 'package:vendy_station/screens/more/profile/profile_screen.dart';
import 'package:vendy_station/screens/more/terms/terms.dart';
import 'package:vendy_station/screens/notification/notification_screen.dart';
import 'package:vendy_station/screens/vocher/vocher_screen.dart';
import 'package:vendy_station/util/constant.dart';
import 'package:vendy_station/util/image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io';

import '../../provider/lang_provider.dart';
import '../wallet/view/home_view.dart';
import 'about/about_screen.dart';
import 'help/get_help.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LangProvider>(context);
    return Scaffold(
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              // CircleAvatar(
              //   backgroundImage: AssetImage("assets/images/Oval.png"),
              //   radius: 50,
              //   backgroundColor: Colors.transparent,
              // ),
              // InkWell(
              //   onTap: () {
              //     // takePhoto(ImageSource.camera);
              //   },
              //   child: const CircleAvatar(
              //     backgroundColor: Color(0xffC3AA94),
              //     child: Icon(
              //       Icons.camera_enhance_outlined,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: Column(
            children: [
              Text(
                name!,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1E232C)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.discover,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff838BA1)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 21,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // TextButton(
              //   onPressed: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageView()));
              //   },
              //   child: Row(
              //     children: [
              //       Image.asset(Images.wallet,
              //         color: Colors.black,
              //         width: 20,
              //       ),
              //       SizedBox(width: 15,),
              //       Text(AppLocalizations.of(context)!.wallet,
              //         style: TextStyle(
              //             fontWeight: FontWeight.w500,
              //             fontSize: 18,
              //             color: Color(0xff838BA1)
              //         ),
              //       )
              //     ],
              //   ),),

              //    Divider(height: 2,color: Color(0xffE8ECF4),),
              //   SizedBox(height: 15,),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/notification.png",
                      color: Colors.black,
                      width: 20,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.notification,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff838BA1)),
                    )
                  ],
                ),
              ),
              // InkWell(
              //   onTap: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
              //   },
              //   child: Row(
              //     children: [
              //       Image.asset("assets/images/notification.png",
              //         color: Colors.black,
              //         width: 20,
              //       ),
              //       SizedBox(width: 15,),
              //       Text("Notification",
              //         style: TextStyle(
              //             fontWeight: FontWeight.w500,
              //             fontSize: 18,
              //             color: Color(0xff838BA1)
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              //    SizedBox(height: 15,),
              ///
              // Divider(height: 2,color: Color(0xffE8ECF4),),
              //
              // TextButton(
              //   onPressed: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>VoucherScreen()));
              //   },
              //   child:  Row(
              //     children: [
              //       Image.asset("assets/images/vocher.png",
              //         color: Colors.black,
              //         width: 20,
              //       ),
              //       SizedBox(width: 15,),
              //       Text("Vocher",
              //         style: TextStyle(
              //             fontWeight: FontWeight.w500,
              //             fontSize: 18,
              //             color: Color(0xff838BA1)
              //         ),
              //       )
              //     ],
              //   ),),
              Divider(
                height: 2,
                color: Color(0xffE8ECF4),
              ),
              TextButton(
                onPressed: () {
                  //  Share.share("https://play.google.com/st..");
                  sharemethod();
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/share.png",
                      color: Colors.black,
                      width: 20,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.app,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff838BA1)),
                    )
                  ],
                ),
              ),

              Divider(
                height: 2,
                color: Color(0xffE8ECF4),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GetHelp()));
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/help.png",
                      color: Colors.black,
                      width: 20,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.help,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff838BA1)),
                    )
                  ],
                ),
              ),
              Divider(
                height: 2,
                color: Color(0xffE8ECF4),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutScreen()));
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/about.png",
                      color: Colors.black,
                      width: 20,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.vendy,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff838BA1)),
                    )
                  ],
                ),
              ),
              Divider(
                height: 2,
                color: Color(0xffE8ECF4),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TermsCondition()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.terminal_sharp,
                      size: 20,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.terms,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff838BA1)),
                    )
                  ],
                ),
              ),

              Divider(
                height: 2,
                color: Color(0xffE8ECF4),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/setting.png",
                      color: Colors.black,
                      width: 20,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.setting,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff838BA1)),
                    )
                  ],
                ),
              ),

              Divider(
                height: 2,
                color: Color(0xffE8ECF4),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text(AppLocalizations.of(context)!.exit),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(AppLocalizations.of(context)!.cancel),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              CacheHelper.removeData(key: 'token');
                              CacheHelper.removeData(key: 'pass');
                              CacheHelper.removeData(key: 'name');
                              CacheHelper.removeData(key: 'email');
                              CacheHelper.removeData(key: 'mac');
                              CacheHelper.removeData(key: 'mac2');
                              CacheHelper.removeData(key: 'userPhone');
                              CacheHelper.removeData(key: 'company');
                              Navigator.of(context).pop();

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen()));

                              // .then((value) {
                              //   if (value) {
                              //     token = CacheHelper.getData(key: 'token');
                              //     print(
                              //         '0000000000000000${CacheHelper.getData(key: 'token')}');
                              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                              //
                              //   }
                              // });
                              print('0000000000000000');
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                            });
                          },
                          child: Text(AppLocalizations.of(context)!.agree),
                        ),
                      ],
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 20,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.out,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff838BA1)),
                    )
                  ],
                ),
              ),
              Divider(
                height: 2,
                color: Color(0xffE8ECF4),
              ),
              TextButton(
                onPressed: () {
                  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
                  showDialogBottom();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      size: 20,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.language,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff838BA1)),
                    ),
                    Spacer(),
                    Text(provider.appLang == "en" ? "English" : "العربيه")
                  ],
                ),
              ),
            ],
          ),
        )
      ])),
    );
  }

  // void showLanguageBottom(){
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (buildContext){
  //         return LaunguageScreen();
  //       });
  // }
  void showDialogBottom() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actions: [LaunguageScreen()],
            ));
  }

  void sharemethod() async {
    if (Platform.isIOS) {
      final Uri _url =
          Uri.parse("https://apps.apple.com/eg/app/vendy-station/id1664512350");
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
      // _launchInBrowser(
      //     "https://apps.apple.com/eg/app/vendy-station/id1664512350");
    } else if (Platform.isAndroid) {
      final Uri _url = Uri.parse(
          "https://play.google.com/store/apps/details?id=com.vndystation.vendystationpayment");
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
      // _launchInBrowser(
      //     "https://play.google.com/store/apps/details?id=com.vndystation.vendystationpayment");
    }
  }
}
