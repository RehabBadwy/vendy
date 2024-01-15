import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/home/vendy_school/family_school/digital_id.dart';
import 'package:vendy_station/screens/home/vendy_school/family_school/manage.dart';
import 'package:vendy_station/screens/home/vendy_school/family_school/pick_digital_id.dart';
import 'package:vendy_station/util/constant.dart';

import '../../../../provider/school_provider.dart';
import '../../../../util/color_manager.dart';

class FamilySetting extends StatefulWidget {
  const FamilySetting({Key? key}) : super(key: key);

  @override
  State<FamilySetting> createState() => _FamilySettingState();
}

class _FamilySettingState extends State<FamilySetting> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dailyController = TextEditingController();
  bool _light = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(
                height: 20,
              ),
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
                    ),

                  ],
                ),
              ),
              SizedBox(height: 15,),
              // SizedBox(
              //   width: 100,
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
              //       "Setting",
              //       style: TextStyle(
              //           color: ColorManager.white
              //       ),
              //     ),
              //
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<AddSchoolUserProvider>(
                  builder: (context,limit,child){
                    return Column(
                      children: [
                        //  InkWell(
                        //    onTap: (){
                        //    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>DigitalIdScreen()));
                        // //     Navigator.push(context, MaterialPageRoute(builder: (context)=>PickDigitalScreen()));
                        //
                        //    },
                        //    child: Container(
                        //      decoration: const BoxDecoration(
                        //        color: Colors.white,
                        //        borderRadius: BorderRadius.only(
                        //          topLeft: Radius.circular(12.0),
                        //          topRight: Radius.circular(12.0),
                        //          bottomLeft: Radius.circular(12.0),
                        //          bottomRight: Radius.circular(12.0),
                        //        ),
                        //        boxShadow: [
                        //          BoxShadow(
                        //            color: Colors.grey,
                        //            spreadRadius: 1,
                        //            blurRadius: 15,
                        //            offset: Offset(0, 3), // changes position of shadow
                        //          ),
                        //        ],
                        //      ),
                        //      child: Padding(
                        //        padding: const EdgeInsets.all(12),
                        //        child: Column(
                        //          children: [
                        //            Row(
                        //              children: [
                        //                Icon(Icons.location_on_outlined,size: 15,color: Colors.black,),
                        //                SizedBox(width: 10,),
                        //                Text("Digital IDs"),
                        //                Spacer(),
                        //                Icon(Icons.add,size: 15,color: Colors.black,),
                        //
                        //              ],
                        //            ),
                        //            SizedBox(height: 20,),
                        //            Text("Here you can find and manage all digital IDs Connected To your family member",
                        //            style: TextStyle(
                        //              fontSize:16,
                        //              color: Color(0xff8391A1)
                        //            ),
                        //            ),
                        //            SizedBox(height: 20,),
                        //            Container(
                        //              decoration:  BoxDecoration(
                        //                borderRadius: BorderRadius.only(
                        //                  topLeft: Radius.circular(12.0),
                        //                  topRight: Radius.circular(12.0),
                        //                  bottomLeft: Radius.circular(12.0),
                        //                  bottomRight: Radius.circular(12.0),
                        //                ),
                        //                border: Border.all(width: 1,color: Colors.brown),
                        //              ),
                        //              child: Padding(
                        //                padding: const EdgeInsets.all(8.0),
                        //                child: Row(
                        //                  children: [
                        //                    Text("850642"),
                        //                    Spacer(),
                        //                    Icon(Icons.more_horiz)
                        //                  ],
                        //                ),
                        //              ),
                        //            ),
                        //          ],
                        //        ),
                        //      ),
                        //    ),
                        //  ),
                        ///limit
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>FamilyDetails()));
                          },
                          child: Container(
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
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.production_quantity_limits,size: 15,color: Colors.black,),
                                        SizedBox(width: 10,),
                                        Text("Spicial Limit"),

                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Text("Enable daily limits to enforce healthy spending habits",
                                      style: TextStyle(
                                          fontSize:16,
                                          color: Color(0xff8391A1)
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Container(
                                      decoration:  BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12.0),
                                          topRight: Radius.circular(12.0),
                                          bottomLeft: Radius.circular(12.0),
                                          bottomRight: Radius.circular(12.0),
                                        ),
                                        //  border: Border.all(width: 1,color: Colors.brown),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            // Text("Daily"),
                                            // Spacer(),
                                            // Icon(Icons.add)
                                            TextFormField(
                                              controller: _dailyController,
                                              decoration: InputDecoration(
                                                //  enabled: false,
                                                hintText: "Daily",
                                                // labelText: "labelText",
                                                // suffixIcon: suffixIcon,
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.brown),
                                                  // borderRadius: BorderRadius.circular(
                                                  //     12)
                                                ),
                                                hintStyle: TextStyle(color: Colors.black, fontSize: 12),
                                                filled: true,
                                                fillColor: Colors.white,
                                                isDense: true,
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.brown),
                                                    borderRadius: BorderRadius.circular(12)),
                                                // border: OutlineInputBorder(
                                                //     borderSide: BorderSide(color: Colors.black),
                                                //    // borderRadius: BorderRadius.circular(15)),
                                                // )
                                              ),
                                            ),
                                            SizedBox(height: 15,),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.green
                                                ),
                                                onPressed: (){
                                                  if (_formKey.currentState!.validate()==true) {
                                                    String daily = _dailyController.text.trim();
                                                    if (daily.isEmpty) {
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                        content: Text('daily_MUST_BE_REQUIRED'),
                                                        backgroundColor: Colors.red,
                                                      ));
                                                    }else{
                                                      Provider.of<AddSchoolUserProvider>(context, listen: false).getLimit(_dailyController.text,
                                                          context,
                                                          limit.previewMyFamily!.myfamily![0].studentId!);
                                                    }
                                                  }
                                                  print("object");
                                                }, child: Text("Add")),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // SizedBox(height: 20,),
                                    // Container(
                                    //   decoration:  BoxDecoration(
                                    //     borderRadius: BorderRadius.only(
                                    //       topLeft: Radius.circular(12.0),
                                    //       topRight: Radius.circular(12.0),
                                    //       bottomLeft: Radius.circular(12.0),
                                    //       bottomRight: Radius.circular(12.0),
                                    //     ),
                                    //     border: Border.all(width: 1,color: Colors.brown),
                                    //   ),
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.all(8.0),
                                    //     child: Row(
                                    //       children: [
                                    //         Text("Weakly"),
                                    //         Spacer(),
                                    //         Icon(Icons.add)
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                    // SizedBox(height: 20,),
                                    // Container(
                                    //   decoration:  BoxDecoration(
                                    //     borderRadius: BorderRadius.only(
                                    //       topLeft: Radius.circular(12.0),
                                    //       topRight: Radius.circular(12.0),
                                    //       bottomLeft: Radius.circular(12.0),
                                    //       bottomRight: Radius.circular(12.0),
                                    //     ),
                                    //     border: Border.all(width: 1,color: Colors.brown),
                                    //   ),
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.all(8.0),
                                    //     child: Row(
                                    //       children: [
                                    //         Text("Monthly"),
                                    //         Spacer(),
                                    //         Icon(Icons.add)
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        ///
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageScreen()));

                          },
                          child: Container(
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
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.pin_drop_rounded,size: 15,color: Colors.black,),
                                      SizedBox(width: 10,),
                                      Text("Manage Restrictions"),

                                    ],
                                  ),

                                  Text("Thess Products have been restricted by yourcommunity for this famliy member. these can only be changed by your community",
                                    style: TextStyle(
                                        fontSize:16,
                                        color: Color(0xff8391A1)
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        ///
                        SizedBox(height: 20,),
                        // InkWell(
                        //   onTap: (){
                        //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>FamilyDetails()));
                        //
                        //   },
                        //   child: Container(
                        //     decoration: const BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.only(
                        //         topLeft: Radius.circular(12.0),
                        //         topRight: Radius.circular(12.0),
                        //         bottomLeft: Radius.circular(12.0),
                        //         bottomRight: Radius.circular(12.0),
                        //       ),
                        //       boxShadow: [
                        //         BoxShadow(
                        //           color: Colors.grey,
                        //           spreadRadius: 1,
                        //           blurRadius: 15,
                        //           offset: Offset(0, 3), // changes position of shadow
                        //         ),
                        //       ],
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(12),
                        //       child: Column(
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Icon(Icons.notifications,size: 15,color: Colors.black,),
                        //               SizedBox(width: 10,),
                        //               Text("Notifiaction"),
                        //             ],
                        //           ),
                        //           SizedBox(height: 20,),
                        //           Text("Enable or disable notifications for your children",
                        //             style: TextStyle(
                        //                 fontSize:16,
                        //                 color: Color(0xff8391A1)
                        //             ),
                        //           ),
                        //
                        //           Container(
                        //
                        //             child: Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Row(
                        //                 children: [
                        //                   Text("Basic Notifiaction"),
                        //                   Spacer(),
                        //                   Switch.adaptive(
                        //                       activeColor: Colors.green,
                        //                       value: _light,
                        //                       onChanged: (bool value){
                        //                         setState(() {
                        //                           _light=value;
                        //                         });
                        //                       })
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //
                        //           Container(
                        //
                        //             child: Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Row(
                        //                 children: [
                        //                   Text("Every Transaction"),
                        //                   Spacer(),
                        //                   Switch.adaptive(
                        //                       activeColor: Colors.green,
                        //                       value: _light,
                        //                       onChanged: (bool value){
                        //                         setState(() {
                        //                           _light=value;
                        //                         });
                        //                       })
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //
                        //           Container(
                        //
                        //             child: Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Row(
                        //                 children: [
                        //                   Text("Low Limit"),
                        //                   Spacer(),
                        //                   Switch.adaptive(
                        //                       activeColor: Colors.green,
                        //                       value: _light,
                        //                       onChanged: (bool value){
                        //                         setState(() {
                        //                           _light=value;
                        //                         });
                        //                       })
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),

                      ],
                    );
                  },
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
