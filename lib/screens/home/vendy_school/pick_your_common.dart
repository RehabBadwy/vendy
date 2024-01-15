import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/school_provider.dart';
import 'package:vendy_station/screens/home/vendy_school/find_family_number.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'add_school.dart';
import 'machine_school.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PickYourCommon extends StatefulWidget {
  const PickYourCommon({Key? key}) : super(key: key);

  @override
  State<PickYourCommon> createState() => _PickYourCommonState();
}

class _PickYourCommonState extends State<PickYourCommon> {
  @override
  Widget build(BuildContext context) {
    Provider.of<AddSchoolUserProvider>(context, listen: false).getAddSchoolList(context);
    var mdw = MediaQuery.of(context).size.width;
    var  mdh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Consumer<AddSchoolUserProvider>(
          builder: (context,school,child){
            return school.schoolListModel!=null?

              SingleChildScrollView(
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
                              AppLocalizations.of(context)!.pickyourschool,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff1E232C)
                              ),
                              textAlign: TextAlign.center,
                            )),

                      ],
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSchoolScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12),),
                          border: Border.all(width: 1,color: Colors.brown),

                        ),
                        child: Row(
                          children: [
                            Icon(Icons.add),
                            SizedBox(width: 10,),
                            Text(AppLocalizations.of(context)!.addyourschool,),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // ListView.separated(
                          //   shrinkWrap: true,
                          //   physics: NeverScrollableScrollPhysics(),
                          //   itemBuilder: (context,index){
                          //     return InkWell(
                          //       onTap: (){
                          //
                          //         // Navigator.push(context, MaterialPageRoute(builder: (context)=>MachineSchool(
                          //         //     schoolName: school.schoolListModel!.schools![index].schoolName!,
                          //         //     schoolId: school.schoolListModel!.schools![index].schoolId!
                          //         // )));
                          //
                          //
                          //         Navigator.push(context, MaterialPageRoute(builder: (context)=>FindFamilyNumber(
                          //
                          //           schoolName: school.schoolListModel!.schools![index].schoolName!,
                          //           schoolId: school.schoolListModel!.schools![index].schoolId!,
                          //         index: index,
                          //         )));
                          //
                          //       },
                          //       child: Container(
                          //         decoration: BoxDecoration(
                          //
                          //           borderRadius: BorderRadius.all(Radius.circular(12),),
                          //           border: Border.all(width: 1,color: Colors.brown),
                          //
                          //         ),
                          //         child: Row(
                          //           children: [
                          //             CircleAvatar(
                          //               backgroundColor: Colors.transparent,
                          //               child: Image.network(
                          //                   "${school.schoolListModel!.schools![index].logo}"
                          //                   ,width: 20,height: 20,
                          //                   fit:BoxFit.cover
                          //               ),
                          //             ),
                          //             SizedBox(width: 10,),
                          //             Text("${school.schoolListModel!.schools![index].schoolName}"),
                          //             Spacer(),
                          //             Icon(Icons.arrow_right)
                          //           ],
                          //         ),
                          //       ),
                          //     );
                          //   },
                          //   itemCount: school.schoolListModel!.schools!.length, separatorBuilder: (BuildContext context, int index) {
                          //     return SizedBox(height: 20,);
                          // },
                          // ),
                          // SizedBox(height: 16,),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20
                            ),
                            itemCount: school.schoolListModel!.schools!.length,
                            itemBuilder: (context,index){
                              return InkWell(
                                onTap: (){

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>MachineSchool(
                                  //     schoolName: school.schoolListModel!.schools![index].schoolName!,
                                  //     schoolId: school.schoolListModel!.schools![index].schoolId!
                                  // )));


                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FindFamilyNumber(

                                    schoolName: school.schoolListModel!.schools![index].schoolName!,
                                    schoolId: school.schoolListModel!.schools![index].schoolId!,
                                    index: index,
                                  )));

                                },
                                child: Container(
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.all(Radius.circular(12),),
                                    border: Border.all(width: 1,color: Colors.brown),

                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Container(
                                            width: 80,
                                            height: 80,
                                            decoration: new BoxDecoration(
                                                // borderRadius:
                                                // BorderRadius.all(
                                                //     Radius.circular(
                                                //         50)),
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage("${school.schoolListModel!.schools![index].logo}"),
                                                ))),
                                      ),
                                      // CircleAvatar(
                                      //   radius: 25,
                                      //   backgroundColor: Colors.transparent,
                                      //   child: Image.network(
                                      //       "${school.schoolListModel!.schools![index].logo}"
                                      //       ,width: 50,height: 50,
                                      //       fit:BoxFit.cover
                                      //   ),
                                      // ),
                                      SizedBox(height: 10,),
                                      Text("${school.schoolListModel!.schools![index].schoolName}"),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),

                    )
                  ],
                ),
            ),
              ):Center(child: CircularProgressIndicator(),);
          },
        )
      ),
    );
  }
}
