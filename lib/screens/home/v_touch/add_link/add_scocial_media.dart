import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/dashboard/dashboard.dart';

import '../../../../provider/add_link_provider.dart';
import '../../../../provider/auth_provider.dart';
import '../../../../util/color_manager.dart';
import '../vtouch_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddSocialMediaScreen extends StatefulWidget {
  const AddSocialMediaScreen({Key? key}) : super(key: key);

  @override
  State<AddSocialMediaScreen> createState() => _AddSocialMediaScreenState();
}

class _AddSocialMediaScreenState extends State<AddSocialMediaScreen> {
  final TextEditingController _phoneController = TextEditingController();
  GlobalKey<FormState> _whats = GlobalKey<FormState>();

  bool _light = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const vTouchScreen()));
                        // Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/images/back.png",
                        width: 40,
                        height: 40,
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  Center(
                      child: Text(
                    AppLocalizations.of(context)!.whatsapp,
                    style: TextStyle(fontSize: 30, color: Color(0xff1E232C)),
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
              Center(
                  child: Image.asset(
                "assets/images/wapp.png",
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.whats,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1E232C),
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Row(
              //   children: [
              //   Text("Highlighted Link",
              //   style: TextStyle(
              //     color: Color(0xff8391A1),
              //     fontSize: 18
              //   ),
              //   ),
              //     Spacer(),
              //     Switch.adaptive(
              //       activeColor: Colors.green,
              //         value: _light,
              //         onChanged: (bool value){
              //           setState(() {
              //             _light=value;
              //           });
              //         })
              // ],
              // ),
              // SizedBox(height: 10,),
              Text(
                AppLocalizations.of(context)!.number,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xffC3AA94),
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _whats,
                child: IntlPhoneField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.phone,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        //  borderSide: BorderSide()
                      )),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (_whats.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _phoneController.text,
                                "Social Media", "Whatsapp");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                  child: Text(
                    AppLocalizations.of(context)!.add,
                    style: TextStyle(color: ColorManager.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primary),
                  child: Text(
                    AppLocalizations.of(context)!.back,
                    style: TextStyle(color: ColorManager.white),
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
