import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/home/vendy_school/family_school/family_setting.dart';
import 'package:vendy_station/util/constant.dart';

import '../../../../provider/school_provider.dart';
import '../../../../util/color_manager.dart';
import '../machine_school.dart';

class FamilyDetails extends StatefulWidget {
  const FamilyDetails({Key? key}) : super(key: key);

  @override
  State<FamilyDetails> createState() => _FamilyDetailsState();
}

class _FamilyDetailsState extends State<FamilyDetails> {

  @override
  Widget build(BuildContext context) {
    Provider.of<AddSchoolUserProvider>(context, listen: false).getAddSchoolList(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<AddSchoolUserProvider>(
            builder: (context,schoolTransic,child){
              return schoolTransic.schoolTransiction!=null?

                Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  // Center(
                  //   child:  Stack(
                  //     alignment: AlignmentDirectional.bottomStart,
                  //     children: [
                  //       CircleAvatar(
                  //         backgroundImage: AssetImage("assets/images/Oval.png"),
                  //         radius: 50,
                  //         backgroundColor: Colors.transparent,
                  //       ),
                  //       InkWell(
                  //         onTap: () {
                  //           // takePhoto(ImageSource.camera);
                  //         },
                  //         child: const CircleAvatar(
                  //           backgroundColor: Color(0xffC3AA94),
                  //           child: Icon(
                  //             Icons.camera_enhance_outlined,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //       ),
                  //
                  //     ],
                  //   ),
                  // ),

                  Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                            SizedBox(width: 15,),
                            Text(name!,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff1E232C)
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FamilySetting()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),

                      child:Text(
                        "Setting",
                        style: TextStyle(
                            color: ColorManager.white
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 15,),
                  ///

                  Column(
                    children: [
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return Container(
                              height: 60,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffEDEDED),
                                    spreadRadius: 1,
                                    blurRadius: 15,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      children: [
                                        Text("${schoolTransic.schoolTransiction!.transaction![index].item}"),
                                        Spacer(),
                                        Text("${schoolTransic.schoolTransiction!.transaction![index].price}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.red
                                        ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context,index){
                            return SizedBox(height: 15,);
                          },
                          itemCount: schoolTransic.schoolTransiction!.transaction!.length)

                    ],
                  ),
                  SizedBox(height: 15,),
                  Center(child: Text("School"),),
                  SizedBox(height: 15,),
                  schoolTransic.schoolListModel!=null ?
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){

                          Provider.of<AddSchoolUserProvider>(context, listen: false).getMachinesSchool(
                              context,
                              schoolTransic.schoolListModel!.schools![index].schoolName!,
                              schoolTransic.schoolListModel!.schools![index].schoolId!);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MachineSchool(
                           //   schoolName: schoolTransic.schoolListModel!.schools![index].schoolName!,
                          //    schoolId: schoolTransic.schoolListModel!.schools![index].schoolId!
                          )));
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>FindFamilyNumber(
                          //
                          //   schoolName: school.schoolListModel!.schools![index].schoolName!,
                          //   schoolId: school.schoolListModel!.schools![index].schoolId!,
                          //   index: index,
                          // )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12),),
                            border: Border.all(width: 1,color: Colors.brown),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Image.network(
                                    "${schoolTransic.schoolListModel!.schools![index].logo}"
                                    ,width: 20,height: 20,
                                    fit:BoxFit.cover
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text("${schoolTransic.schoolListModel!.schools![index].schoolName}"),
                              Spacer(),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: schoolTransic.schoolListModel!.schools!.length,
                  ):Center(child: CircularProgressIndicator(color: Colors.transparent,),),
                  // Consumer<AddSchoolUserProvider>(
                  //   builder: (context,schoolTransiction,child){
                  //     return
                  //       schoolTransiction.schoolTransiction!=null ?
                  //       Column(
                  //
                  //         children: [
                  //           ListView.separated(
                  //               shrinkWrap: true,
                  //               physics: NeverScrollableScrollPhysics(),
                  //               itemBuilder: (context,index){
                  //                 return Container(
                  //                   height: 50,
                  //                   width: double.infinity,
                  //                   decoration: const BoxDecoration(
                  //                     color: Colors.white,
                  //                     borderRadius: BorderRadius.only(
                  //                       topLeft: Radius.circular(20.0),
                  //                       topRight: Radius.circular(20.0),
                  //                       bottomLeft: Radius.circular(20.0),
                  //                       bottomRight: Radius.circular(20.0),
                  //                     ),
                  //                     boxShadow: [
                  //                       BoxShadow(
                  //                         color: Color(0xffEDEDED),
                  //                         spreadRadius: 1,
                  //                         blurRadius: 15,
                  //                         offset: Offset(0, 3), // changes position of shadow
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   child: Column(
                  //                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                     mainAxisAlignment: MainAxisAlignment.center,
                  //                     children: [
                  //                       Padding(
                  //                         padding: const EdgeInsets.all(8.0),
                  //                         child: Text("${schoolTransiction.schoolTransiction!.transaction![index].item}"),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 );
                  //               },
                  //               separatorBuilder: (context,index){
                  //                 return SizedBox(height: 15,);
                  //               },
                  //               itemCount: schoolTransiction.schoolTransiction!.transaction!.length)
                  //         ],
                  //       ):Center(child: CircularProgressIndicator(),);
                  //   }),
                  ///
                  // Image.asset("assets/images/Chart.png"),
                  // Text("Purchases",
                  //   style: TextStyle(
                  //       fontSize: 30,
                  //       fontWeight: FontWeight.w700,
                  //       color: Color(0xff1E232C)
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Column(
                  //     children: [
                  //       InkWell(
                  //         onTap: (){
                  //          // Navigator.push(context, MaterialPageRoute(builder: (context)=>FamilyDetails()));
                  //
                  //         },
                  //         child: Container(
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
                  //           child: Row(
                  //             children: [
                  //               Image.asset("assets/images/inter.png"),
                  //               SizedBox(width: 10,),
                  //               Text("Belgian Waffle With Chocolate"),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(height: 16,),
                  //       InkWell(
                  //         onTap: (){
                  //           // Navigator.push(context, MaterialPageRoute(builder: (context)=>FamilyDetails()));
                  //
                  //         },
                  //         child: Container(
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
                  //           child: Row(
                  //             children: [
                  //               Image.asset("assets/images/inter.png"),
                  //               SizedBox(width: 10,),
                  //               Text("Juice Box Or Milk Box"),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 15,),
                  // SizedBox(
                  //   width: 150,
                  //   height: 40,
                  //   child: ElevatedButton(
                  //     onPressed: (){},
                  //     style: ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.black,
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(12)
                  //         )
                  //     ),
                  //
                  //     child:Text(
                  //       "View Full Schedule",
                  //       style: TextStyle(
                  //           color: ColorManager.white
                  //       ),
                  //     ),
                  //
                  //   ),
                  // ),
                  // SizedBox(height: 15,),
                  // Center(
                  //   child: Column(
                  //     children: [
                  //       Text("School",
                  //         style: TextStyle(
                  //             fontSize: 30,
                  //             fontWeight: FontWeight.w700,
                  //             color: Color(0xff1E232C)
                  //         ),
                  //       ),
                  //
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: InkWell(
                  //     onTap: (){
                  //     //  Navigator.push(context, MaterialPageRoute(builder: (context)=>FindFamilyNumber()));
                  //
                  //     },
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //
                  //         borderRadius: BorderRadius.all(Radius.circular(12),),
                  //         border: Border.all(width: 1,color: Colors.brown),
                  //
                  //       ),
                  //       child: Row(
                  //         children: [
                  //           Image.asset("assets/images/inter.png"),
                  //           SizedBox(width: 10,),
                  //           Text("American Internationsal Schoil .. "),
                  //           Spacer(),
                  //           Icon(Icons.arrow_right)
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ):Center(child: CircularProgressIndicator(),);
            },
          )
        ),
      ),
    );
  }
}