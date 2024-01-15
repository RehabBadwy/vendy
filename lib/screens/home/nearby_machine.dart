import 'package:flutter/material.dart';
import 'package:vendy_station/screens/home/fillter_nearby_seeAll.dart';
import 'package:vendy_station/util/image.dart';

import '../../util/dimensions.dart';

class NearbyMachineScreen extends StatefulWidget {
  const NearbyMachineScreen({Key? key}) : super(key: key);

  @override
  State<NearbyMachineScreen> createState() => _NearbyMachineScreenState();
}

class _NearbyMachineScreenState extends State<NearbyMachineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                      SizedBox(width: 10,),
                      // Expanded(
                      //   child: Container(
                      //     /*padding: EdgeInsets.symmetric(
                      //         horizontal: Dimensions.homePagePadding, vertical: Dimensions.paddingSizeSmall),*/
                      //
                      //     alignment: Alignment.center,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                      //       border: Border.all(color: Color(0xffE8ECF4))
                      //     ),
                      //     child: Container(
                      //       padding: EdgeInsets.only(
                      //       left: Dimensions.homePagePadding, right: Dimensions.paddingSizeExtraSmall,
                      //       top: Dimensions.paddingSizeExtraSmall, bottom: Dimensions.paddingSizeExtraSmall,
                      //     ),
                      //
                      //       height: 40, alignment: Alignment.centerLeft,
                      //       decoration: BoxDecoration(
                      //
                      //         color: Theme.of(context).cardColor,
                      //        /* boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ?
                      //         900 : 200]!, spreadRadius: 1, blurRadius: 1)],*/
                      //         borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),),
                      //       child: Row(mainAxisAlignment : MainAxisAlignment.spaceBetween, children: [
                      //
                      //         Text('Coffee Vending machines',
                      //             style: TextStyle(
                      //               color: Colors.grey
                      //             )),
                      //
                      //         Container(
                      //           width: 20,height: 20,decoration:
                      //         BoxDecoration(
                      //
                      //             borderRadius: BorderRadius.all(Radius.circular(Dimensions.paddingSizeExtraSmall))
                      //         ),
                      //           child: Icon(Icons.search,
                      //               color: Color(0xffE8ECF4),
                      //               size: Dimensions.ICON_SIZE_SMALL),
                      //         ),
                      //       ]),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     width: 300,
                //     /*padding: EdgeInsets.symmetric(
                //                 horizontal: Dimensions.homePagePadding, vertical: Dimensions.paddingSizeSmall),*/
                //
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                //         border: Border.all(color: Color(0xffE8ECF4))
                //     ),
                //     child: Container(
                //
                //       padding: EdgeInsets.only(
                //         left: Dimensions.homePagePadding, right: Dimensions.paddingSizeExtraSmall,
                //         top: Dimensions.paddingSizeExtraSmall, bottom: Dimensions.paddingSizeExtraSmall,
                //       ),
                //
                //       height: 40,
                //         alignment: Alignment.centerLeft,
                //       decoration: BoxDecoration(
                //
                //         color: Colors.black,
                //         /* boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ?
                //                 900 : 200]!, spreadRadius: 1, blurRadius: 1)],*/
                //         borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Image.asset(Images.camera),
                //           SizedBox(width: 10,),
                //           Text(
                //             "View nearby vending machines",
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontWeight: FontWeight.w400,
                //               fontSize: 14
                //             ),
                //           ),
                //         ],
                //       )
                //     ),
                //   ),
                // ),

                InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FilterNearby()));
                },
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Text("Snacks machines ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                    color: Color(0xff1E232C)
                                ),
                              ),
                              Spacer(),
                              Text("See all",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff8391A1)
                                ),
                              ),
                            ],),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffEDEDED),
                                      spreadRadius: 1,
                                      blurRadius: 15,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Container(
                                  child:Image.asset("assets/images/snacks1.png"),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffEDEDED),
                                      spreadRadius: 1,
                                      blurRadius: 15,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Container(
                                  child:Image.asset("assets/images/sweets.png"),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Text("Ice Machine ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                    color: Color(0xff1E232C)
                                ),
                              ),
                              Spacer(),
                              Text("See all",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff8391A1)
                                ),
                              ),
                            ],),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffEDEDED),
                                      spreadRadius: 1,
                                      blurRadius: 15,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Container(
                                  child:Image.asset("assets/images/ice1.png"),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffEDEDED),
                                      spreadRadius: 1,
                                      blurRadius: 15,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Container(
                                  child:Image.asset("assets/images/sandwitch.png"),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Text("Coffee Machine ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                    color: Color(0xff1E232C)
                                ),
                              ),
                              Spacer(),
                              Text("See all",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff8391A1)
                                ),
                              ),
                            ],),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffEDEDED),
                                      spreadRadius: 1,
                                      blurRadius: 15,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Container(
                                  child:Image.asset("assets/images/snacks1.png"),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffEDEDED),
                                      spreadRadius: 1,
                                      blurRadius: 15,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Container(
                                  child:Image.asset("assets/images/toggy.png"),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Text("Ice Machine",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                    color: Color(0xff1E232C)
                                ),
                              ),
                              Spacer(),
                              Text("See all",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff8391A1)
                                ),
                              ),
                            ],),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffEDEDED),
                                      spreadRadius: 1,
                                      blurRadius: 15,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Container(
                                  child:Image.asset("assets/images/ice1.png"),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffEDEDED),
                                      spreadRadius: 1,
                                      blurRadius: 15,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Container(
                                  child:Image.asset("assets/images/sandwitch.png"),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
