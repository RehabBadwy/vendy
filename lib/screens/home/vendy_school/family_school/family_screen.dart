import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/school_provider.dart';
import 'package:vendy_station/screens/home/vendy_school/family_school/family_details.dart';
import 'package:vendy_station/screens/home/vendy_school/pick_your_common.dart';
import 'package:vendy_station/util/constant.dart';

import '../../../../util/color_manager.dart';
import 'family_setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class FamilyScreen extends StatefulWidget {
  const FamilyScreen({Key? key}) : super(key: key);

  @override
  State<FamilyScreen> createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Provider.of<AddSchoolUserProvider>(context, listen: false).getPreviewMyFamily(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<AddSchoolUserProvider>(
            builder: (context,family,child){
              return family.previewMyFamily!=null ?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                  //  color: Colors.black,
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.blue,
                            Colors.red,
                          ],
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                          SizedBox(height: 20,),

                          Column(
                            children: [
                              Text(name!,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white
                                ),
                              ),
                              Text(AppLocalizations.of(context)!.goodmorning,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  // SizedBox(
                  //   width: 100,
                  //   height: 40,
                  //   child: ElevatedButton(
                  //     onPressed: (){},
                  //     style: ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.brown,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(12)
                  //       )
                  //     ),
                  //
                  //     child:Text(
                  //       "Balance",
                  //       style: TextStyle(
                  //           color: ColorManager.white
                  //       ),
                  //     ),
                  //
                  //   ),
                  // ),
                  // SizedBox(height: 15,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSchoolScreen()));
                      },
                      child: Container(
                        width: 150,
                        height: height/6,
                        //120,
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add),
                              SizedBox(width: 10,),
                              Text(AppLocalizations.of(context)!.addfamily,),

                            ],
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PickYourCommon()));
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Center(
                    child: Column(
                      children: [
                        Text(AppLocalizations.of(context)!.allmyfamily,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8391A1)
                          ),
                        ),
                        SizedBox(height: 15,),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 100
                                ),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          /// sub wallet
                                          Provider.of<AddSchoolUserProvider>(context, listen: false).getStudentTransic(context,
                                              family.previewMyFamily!.myfamily![index].id!,
                                              family.previewMyFamily!.myfamily![index].schoolId!);
                                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>FamilyDetails()));
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FamilySetting()));
                                        },
                                        child: Container(
                                          width: 120,
                                          height: 120,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12.0),
                                              topRight: Radius.circular(12.0),
                                              bottomLeft: Radius.circular(12.0),
                                              bottomRight: Radius.circular(12.0),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                spreadRadius: 1,
                                                blurRadius: 15,
                                                offset: Offset(0, 3), // changes position of shadow
                                              ),
                                            ],
                                          ),

                                          child: Center(
                                            child: Text(

                                              "${family.previewMyFamily!.myfamily![index].studentName}",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                // separatorBuilder: (context,index){
                                //   return SizedBox(height: 15,);
                                // },
                                itemCount: family.previewMyFamily!.myfamily!.length)
                        ),
                        SizedBox(height: 16,),

                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ListView.separated(
                  //       shrinkWrap: true,
                  //       physics: NeverScrollableScrollPhysics(),
                  //       itemBuilder: (context,index){
                  //         return Container(
                  //           height: 100,
                  //           width: double.infinity,
                  //           decoration: const BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius: BorderRadius.only(
                  //               topLeft: Radius.circular(12.0),
                  //               topRight: Radius.circular(12.0),
                  //               bottomLeft: Radius.circular(12.0),
                  //               bottomRight: Radius.circular(12.0),
                  //             ),
                  //             boxShadow: [
                  //               BoxShadow(
                  //                 color: Colors.grey,
                  //                 spreadRadius: 1,
                  //                 blurRadius: 15,
                  //                 offset: Offset(0, 3), // changes position of shadow
                  //               ),
                  //             ],
                  //           ),
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: InkWell(
                  //               onTap: (){
                  //               },
                  //               child: Row(
                  //                 children: [
                  //                   CircleAvatar(
                  //                     backgroundImage: AssetImage("assets/images/Oval.png"),
                  //                     radius: 20,
                  //                     backgroundColor: Colors.transparent,
                  //                   ),
                  //                   SizedBox(width: 20,),
                  //                   Expanded(
                  //                     child: Column(
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Text("VendyStation",
                  //                           style: TextStyle(
                  //                               fontSize: 16,
                  //                               fontWeight: FontWeight.w700,
                  //                               color: Color(0xff8391A1)
                  //                           ),
                  //                         ),
                  //                         Text(
                  //                           "The new V-Touch service has been added to help you share information easily. Try it now",
                  //                           style: TextStyle(
                  //                               fontSize: 16,
                  //                               fontWeight: FontWeight.w400,
                  //                               color: Color(0xff8391A1)
                  //                           ),
                  //
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //       separatorBuilder: (context,index){
                  //         return SizedBox(height: 20,);
                  //       },
                  //       itemCount: 2),
                  // )
                ],
              ):Center(child: CircularProgressIndicator(color: Colors.transparent,),);
            },
          )
        ),
      ),
    );
  }
}
