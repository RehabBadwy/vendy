import 'package:flutter/material.dart';

import '../../../base_widgit/custom_button.dart';

class SaveProfile extends StatefulWidget {
  const SaveProfile({Key? key}) : super(key: key);

  @override
  State<SaveProfile> createState() => _SaveProfileState();
}

class _SaveProfileState extends State<SaveProfile> {
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
                "Password Changed!",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "Your Profile has been changed \n successfully.",
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
                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                },
                buttonText: 'Back To Profile', ),
            ],
          ),
        ),
      ),
    );
  }
}
