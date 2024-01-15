import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/home/vendy_school/machine_school.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../provider/school_provider.dart';
import '../../../util/color_manager.dart';
import 'family_school/family_screen.dart';
import 'family_school/pick_digital_id.dart';

class FindFamilyNumber extends StatefulWidget {
  final String schoolName;
  final String schoolId;
  int index;
   FindFamilyNumber({Key? key,required this.schoolName,required this.schoolId,required this.index}) : super(key: key);

  @override
  State<FindFamilyNumber> createState() => _FindFamilyNumberState();
}

class _FindFamilyNumberState extends State<FindFamilyNumber> {
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _StudentNameController = TextEditingController();
  //final TextEditingController _StudentNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  //  Provider.of<AddSchoolUserProvider>(context, listen: false).getMachinesSchool(context, widget.schoolName, widget.schoolId);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<AddSchoolUserProvider>(
            builder: (context,confirmSchool,child){
              return SingleChildScrollView(
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
                              confirmSchool.schoolListModel!.schools![widget.index].schoolName!,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                        //  Text(confirmSchool.schoolListModel!.schools![widget.index].schoolName!),
                          SizedBox(height: 20,),
                          TextFormField( 
                            controller: _idNumberController,
                            decoration:  InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: ColorManager.brown),
                                borderRadius: BorderRadius.all(Radius.circular(12),),

                              ),
                              labelText: "id",
                             // hintText:" ${schoolId}",
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(height: 20,), 
                          TextFormField(
                            controller: _StudentNameController,
                            decoration:  InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: ColorManager.brown),
                                borderRadius: BorderRadius.all(Radius.circular(12),),

                              ),
                              labelText: "name",
                             // hintText:" ${schoolId}",
                            ),
                            keyboardType: TextInputType.name,
                          ),
                          Image.asset("assets/images/notfound.png"),
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: ()async{

                                ///soon
                                Provider.of<AddSchoolUserProvider>(context, listen: false).getStudentData(context,
                                    confirmSchool.schoolListModel!.schools![widget.index].schoolName!,
                                    ///school id
                                    confirmSchool.schoolListModel!.schools![widget.index].schoolId!,
                                    ///student id
                                    _idNumberController.text,
                                    ///Student name
                                    _StudentNameController.text,
                                );

                                ///
                                // if(confirmSchool.schoolListModel!.schools![widget.index].schoolId==_idNumberController.text
                                // &&confirmSchool.schoolListModel!.schools![widget.index].schoolName==
                                //        // _StudentNameController.text
                                //        widget.schoolName
                                // ){
                                //
                                //
                                //   Provider.of<AddSchoolUserProvider>(context, listen: false).getMachinesSchool(
                                //       context,
                                //       confirmSchool.schoolListModel!.schools![widget.index].schoolName!,
                                //       confirmSchool.schoolListModel!.schools![widget.index].schoolId!);
                                //
                                //
                                //   Provider.of<AddSchoolUserProvider>(context, listen: false).getStudentData(context,
                                //    confirmSchool.schoolListModel!.schools![widget.index].schoolName!,
                                //     confirmSchool.schoolListModel!.schools![widget.index].schoolId!,
                                //     _idNumberController.text,
                                //     _StudentNameController.text,
                                //   );
                                // ///
                                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>PickDigitalScreen()));
                                //   ///
                                //   // Navigator.push(context, MaterialPageRoute(builder: (context)=>MachineSchool(
                                //   //     schoolName: confirmSchool.schoolListModel!.schools![widget.index].schoolName!)));
                                // }else{
                                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ID Wrong")));
                                // }
                                ///fake
                                // Provider.of<AddSchoolUserProvider>(context, listen: false).getLinkSt(context,
                                // "${_idNumberController.text}",
                                //   confirmSchool.schoolListModel!.schools![widget.index].schoolId!,);
                            //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
                           //   await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FamilyScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorManager.brown,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child:Text(
                                AppLocalizations.of(context)!.confirm,
                                style: TextStyle(
                                    color: ColorManager.white
                                ),
                              ),

                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ),
      ),
    );
  }
}
