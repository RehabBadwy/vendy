import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState(); 
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                  SizedBox(width: 30,),
                  Center(
                      child: Text(
                        AppLocalizations.of(context)!.vendy,
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xff1E232C)
                        ),
                        textAlign: TextAlign.center,
                      )),

                ],
              ),
              SizedBox(height: 20,),
              Text(AppLocalizations.of(context)!.service,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Color(0xff8391A1)
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
