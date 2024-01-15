import 'package:flutter/material.dart';
import 'package:vendy_station/screens/auth/signIn_Screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../base_widgit/custom_button.dart';

class PasswordChangeScreen extends StatefulWidget {
  const PasswordChangeScreen({Key? key}) : super(key: key);

  @override
  State<PasswordChangeScreen> createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Successmark.png"),
              SizedBox(height: 15,),

              Text(
                  AppLocalizations.of(context)!.passwordchanged,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                AppLocalizations.of(context)!.passwordchang,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8391A1)
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              CustomButton(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                },
                buttonText: AppLocalizations.of(context)!.backtologin ),
            ],
          ),
        ),
      ),
    );
  }
}
