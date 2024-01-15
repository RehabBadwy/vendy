import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
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
                Text(AppLocalizations.of(context)!.termscontent,),
                SizedBox(height: 15,),
                Text(AppLocalizations.of(context)!.roundpolicy,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(height: 15,),
                Text(
                  AppLocalizations.of(context)!.roundcontent,
                   // "- Users must contact customer support within 14 days of the recharge date to request a refund.\n- Refund requests must be submitted in writing, providing transaction details and a clear explanation.\n- Approved refunds will be initiated within 21 business days.\n- Refunds will only be considered for registered members of the closed community who have utilized the Provider's payment services.\n- You agree and understand that the Provider has the final decision on refund requests, except in cases where the closed community management has the final say.\n- Refunds may be denied for incomplete information, fraudulent requests, or violations of terms of service.\n- The Provider will engage with the closed community management in cases of disputes to reach a resolution.",
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
