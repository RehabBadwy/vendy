import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/school_provider.dart';
import 'package:vendy_station/screens/home/vendy_school/request_success.dart';

import '../../../provider/auth_provider.dart';
import '../../../util/color_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddSchoolScreen extends StatefulWidget {
  const AddSchoolScreen({Key? key}) : super(key: key);

  @override
  State<AddSchoolScreen> createState() => _AddSchoolScreenState();
}

class _AddSchoolScreenState extends State<AddSchoolScreen> {
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  GlobalKey<FormState> _school= GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
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
                          AppLocalizations.of(context)!.addyourschool,
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff1E232C)
                          ),
                          textAlign: TextAlign.center,
                        )),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _school,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _schoolNameController,
                          decoration:  InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: ColorManager.brown),
                              borderRadius: BorderRadius.all(Radius.circular(12),),
                              //<-- SEE HERE
                            ),
                            labelText: AppLocalizations.of(context)!.schoolname,
                            hintText: AppLocalizations.of(context)!.schoolname,
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return AppLocalizations.of(context)!.schoolname;
                            }
                          },
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: _studentNameController,
                          decoration:  InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: ColorManager.brown),
                              borderRadius: BorderRadius.all(Radius.circular(12),),
                              //<-- SEE HERE
                            ),
                            labelText: AppLocalizations.of(context)!.studentname,
                            hintText: AppLocalizations.of(context)!.studentname,
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return AppLocalizations.of(context)!.studentname;
                            }
                          },
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: _idNumberController,
                          decoration:  InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: ColorManager.brown),
                              borderRadius: BorderRadius.all(Radius.circular(12),),

                            ),
                            labelText: "Id Number",
                            hintText: "Id Number",
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Id Number";
                            }
                          },
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 16,),

                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: (){
                              if (_school.currentState!.validate()==true) {
                                if((!Provider.of<AuthProvider>(context, listen: false).isLoading)){
                                  Provider.of<AddSchoolUserProvider>(context, listen: false).getAddSchoolUser(
                                      context,
                                      _idNumberController.text,
                                      _schoolNameController.text,
                                      _studentNameController.text);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RequestSuccessScreen()));

                                }
                              }

                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorManager.brown,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child:Text(
                              AppLocalizations.of(context)!.submit,
                              style: TextStyle(
                                  color: ColorManager.white
                              ),
                            ),

                          ),
                        ),
                      ],
                    ),
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
