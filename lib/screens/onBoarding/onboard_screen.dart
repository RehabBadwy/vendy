import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/auth/register_screen.dart';
import 'package:vendy_station/screens/auth/signIn_Screen.dart';

import '../../base_widgit/custom_button.dart';
import '../../data/datasource/remote/dio/cash.dart';
import '../../provider/lang_provider.dart';
import '../../util/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../more/language.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

// bool isLast = false;
class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LangProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          // width: MediaQuery.of(context).size.width,

          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/onboard.png"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  onTap: () {
                    // CacheHelper.saveData(key: 'onBoarding', value: true);
                    // openedFirstTime =
                    //     CacheHelper.getData(key: 'onBoarding');
                    //
                    // print("object");
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  },
                  buttonText: AppLocalizations.of(context)!.login,
                ),
                SizedBox(
                  height: 2,
                ),
                CustomButton(
                  isBuy: true,
                  isBorder: true,
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  buttonText: AppLocalizations.of(context)!.register,
                ),
                ElevatedButton(
                  onPressed: () {
                    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
                    showDialogBottom();
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Row(
                    children: [
                      Icon(
                        Icons.language,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        AppLocalizations.of(context)!.language,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Text(provider.appLang == "en" ? "English" : "العربيه")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDialogBottom() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actions: [LaunguageScreen()],
            ));
  }
}
