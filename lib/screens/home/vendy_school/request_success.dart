import 'package:flutter/material.dart';
import 'package:vendy_station/screens/auth/signIn_Screen.dart';
import 'package:vendy_station/screens/dashboard/dashboard.dart';
import 'package:vendy_station/screens/home/home_page.dart';

import '../../../util/color_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'family_school/family_screen.dart';


class RequestSuccessScreen extends StatefulWidget {
  const RequestSuccessScreen({Key? key}) : super(key: key);

  @override
  State<RequestSuccessScreen> createState() => _RequestSuccessScreenState();
}

class _RequestSuccessScreenState extends State<RequestSuccessScreen> {
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
                AppLocalizations.of(context)!.successfully,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8391A1)
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FamilyScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child:Text(
                    AppLocalizations.of(context)!.home,
                    style: TextStyle(
                        color: ColorManager.white
                    ),
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
