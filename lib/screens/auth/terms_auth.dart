import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsAuth extends StatefulWidget {
  const TermsAuth({Key? key}) : super(key: key);

  @override
  State<TermsAuth> createState() => _TermsAuthState();
}

class _TermsAuthState extends State<TermsAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            AppLocalizations.of(context)!.terms,
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff1E232C)
                          ),
                          textAlign: TextAlign.center,
                        )),

                  ],
                ),
                SizedBox(height: 20,),
                Text("PLEASE READ THESE TERMS CAREFULLY BEFORE ACCESSING OR USING THE APPLICATION. YOU ACKNOWLEDGE THAT THE TERMS ARE SUBJECT TO CONTINOUS MODIFICATIONS, PLEASE REVIEW FREQUENTLY. BY ACCESS AND USE YOU AGREE TO THE TERMS AS MODIFIED."
                    "The present terms of use (the “Terms”) represent the mutual understanding and binding agreement between yourself (and any person you choose to associate with your account) (“you” and/or “the user”) and vendy L.L.C. (“vendy”) governing the access to and the usage of vendy website, mobile, tablet or other smart devices applications in addition to such software stored on servers whether owned or used by us (collectively “Application”) and any associated vendy Digital ID or wearable accessory of any kind."
                    "Your installation, maintenance on your device and/or use of the Application is on the premise and pursuant to the provisions of these present Terms as may be unilaterally amended from time to time."
                    "Your installation, maintenance on your device and/or use of the Application is on the premise and pursuant to the provisions of these present Terms as may be unilaterally amended from time to time."
                    "By using the services offered by vendy you acknowledge that (i) you have unconditionally and irrevocably agreed to be legally bound by the provisions of the Terms, and (ii) you declare that you are a natural person with full capacity to enter into this agreement."
                    "vendy has developed a smart payment and information solution whereby the user will use the Application and digital IDs supplied by vendy as a substitute for cash and an attendance logging system, in a way that the digital ID will be linked to the user’s app and the user shall be able to use the Application and/or Digital ID as a means of payment with the agreed upon third parties service providers, recharging by credit card in-app or by cash on school premises or using other recharge methods."
                    "vendy hereby may not be held responsible for any wrongful, mistaken, invalid or erroneous information, damages, lost data, and software viruses, resulting from or in connection with the use or inability to use the services of vendy. Moreover vendy may not be held responsible for the theft, loss of, damage to the digital ID or any wearable accessory used to operate the vendy Application. In case the digital ID is lost, stolen or damaged in any way whatsoever, the user shall purchase a new digital ID in full price."
                    "vendy shall not incur any liability for any damages, including but not limited to, direct, indirect, special, or consequential damages arising out of, resulting from, or any way connected to the use of their services."
                    "You understand that your user name and pin code, any passwords do exclusively belong to you, thus, you should not disclose them to any third party and that you accept that any transactions made by any third party using your username and passwords shall be your sole responsibility. Furthermore, vendy will not be held liable for any transactions made by a third party if the “Require PIN” feature is disabled."
                    "vendy may alter, amend, delete any of the present Terms at any given time, the new Terms will be published on the website, all transactions will adhere to the then enforceable and applicable Terms, therefore, we urge you to check the Terms as often as possible to verify whether any changes have been made to the extent that may alter your use and/or responsibility with respect to our services."

                ),
                SizedBox(height: 15,),
                Text("Round Policy",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  "- Users must contact customer support within 14 days of the recharge date to request a refund."
                      "\n- Refund requests must be submitted in writing, providing transaction details and a clear explanation."
                      "\n- Approved refunds will be initiated within 21 business days."
                      "\n- Refunds will only be considered for registered members of the closed community who have utilized the Provider's payment services."
                      "\n- You agree and understand that the Provider has the final decision on refund requests, except in cases where the closed community management has the final say."
                      "\n- Refunds may be denied for incomplete information, fraudulent requests, or violations of terms of service."
                      "\n- The Provider will engage with the closed community management in cases of disputes to reach a resolution.",
                  style: TextStyle(

                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
