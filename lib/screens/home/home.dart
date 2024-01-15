import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/home/home_page.dart';
import 'package:vendy_station/screens/home/supermarket/super_market.dart';
import 'package:vendy_station/screens/home/v_touch/vtouch_screen.dart';
import 'package:vendy_station/screens/home/vendy_school/family_school/family_screen.dart';
import 'package:vendy_station/screens/home/vendy_school/pick_your_common.dart';

import '../../data/datasource/remote/dio/cash.dart';
import '../../provider/auth_provider.dart';
import '../../provider/clints_provider.dart';
import '../../util/color_manager.dart';
import '../../util/constant.dart';
import '../../util/image.dart';
import '../wallet/view/home_view.dart';
import 'clients_screen/Client_widget.dart';
import 'machines_photo_screen_.dart';
import 'middle_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'nearby_machine.dart';
import 'offer/offer_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  int? _currentIndex;
  int? get currentIndex => _currentIndex;
  //String currentversion = "1.0.20";
  //  var Appversion;

  void setCurrentIndex(int index) {
    _currentIndex = index;
  }

  void qr() {
    int number = 9999;
    int qr = int.parse(userPhone!);
    print("${number * qr}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token = CacheHelper.getData(key: 'token');
    print('USER phone IS ::::$token');

    //  Appversion = CacheHelper.getData(key: 'Appversion_android');

    ();

    //  Appversion = message['Appversion_android'];
    //  qr();
    //   if(Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
    //     //Navigator.pop(context);
    //    // Provider.of<ClientsProvider>(context, listen: false).getClientCompany(context);
    //
    //   }
  }

  final List<Map<String, dynamic>> category = [
    {
      "image": "assets/images/school.jpg",
      "id": "1",
    },
    {
      "image": "assets/images/touch.jpg",
      "id": "2",
    },
  ];
  Widget _buildCartegory(cat, context) {
    return InkWell(
      onTap: () {
        if (cat['id'] == "1")
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FamilyScreen()));
        if (cat['id'] == "2")
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => vTouchScreen()));
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: AssetImage(cat['image']),
            )),
      ),
    );
  }

  bool _canPop = false;
  @override
  Widget build(BuildContext context) {
    Provider.of<ClientsProvider>(context, listen: false)
        .getClientCompany(context);
    Provider.of<ClientsProvider>(context, listen: false).getSlider(context);
    Provider.of<ClientsProvider>(context, listen: false).getMiddle(context);
    token = CacheHelper.getData(key: 'token');
    print('USER token IS ::::$token');
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if (_canPop) {
              return true;
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(""),
                  content: Text(AppLocalizations.of(context)!.exit),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(AppLocalizations.of(context)!.cancel),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _canPop = true;
                        });
                        Navigator.of(context).pop();
                        // Navigator.of(context).pop();
                        SystemChannels.platform
                            .invokeMethod('SystemNavigator.pop');
                      },
                      child: Text(AppLocalizations.of(context)!.agree),
                    ),
                  ],
                ),
              );

              return false;
            }
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorManager.brown,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(name!),
                                  Spacer(),
                                  point != null ?
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePageView()));
                                    },
                                    child: Center(
                                      child: Container(
                                        width: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                              bottomLeft: Radius.circular(20.0),
                                              bottomRight: Radius.circular(20.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(

                                                  "${AppLocalizations.of(context)!.balance} : $point",
                                              style: TextStyle(
                                                color: Colors.white
                                              ),
                                              ),
                                            ),
                                          )),
                                    ),
                                  )
                                  :SizedBox(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SliderWidget(),
                      // CarouselSlider.builder(
                      //   options: CarouselOptions(
                      //     viewportFraction: 1,
                      //     autoPlay: true,
                      //     enlargeCenterPage: true,
                      //     disableCenter: true,
                      //     onPageChanged: (index, reason) {
                      //       setState(() {
                      //         setCurrentIndex(index);
                      //       });
                      //     },
                      //   ),
                      //   itemCount: category.length,
                      //   itemBuilder: (context, index, _) {
                      //
                      //     return InkWell(
                      //       onTap: () {
                      //         // if(cat['id']=="1")
                      //         //   Navigator.push(context, MaterialPageRoute(builder: (context)=>FamilyScreen()));
                      //         // if(cat['id']=="2")
                      //         //   Navigator.push(context, MaterialPageRoute(builder: (context)=>vTouchScreen()));
                      //
                      //       },
                      //       child: Container(
                      //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      //         child: ClipRRect(
                      //             borderRadius: BorderRadius.circular(10),
                      //             child: Image(
                      //               image: AssetImage(""),
                      //             )
                      //         ),
                      //       ),
                      //     );
                      //       //_buildCartegory(category[index], context);
                      //
                      //   },
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FamilyScreen()));
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>PickYourCommon()));
                        },
                        child:  Expanded(
                          child: Container(
                            // width: double.infinity,
                            height: 130,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffEDEDED),
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Container(
                              child:
                              Image.asset("assets/images/school.png"),
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
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Expanded(
                        //       child: Container(
                        //        // width: double.infinity,
                        //         height: 130,
                        //         decoration: const BoxDecoration(
                        //           boxShadow: [
                        //             BoxShadow(
                        //               color: Color(0xffEDEDED),
                        //               spreadRadius: 1,
                        //               blurRadius: 15,
                        //               offset: Offset(
                        //                   0, 3), // changes position of shadow
                        //             ),
                        //           ],
                        //         ),
                        //         child: Container(
                        //           child:
                        //               Image.asset("assets/images/school.png"),
                        //           decoration: BoxDecoration(
                        //             color: Colors.white,
                        //             borderRadius: BorderRadius.only(
                        //               topLeft: Radius.circular(20.0),
                        //               topRight: Radius.circular(20.0),
                        //               bottomLeft: Radius.circular(20.0),
                        //               bottomRight: Radius.circular(20.0),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 15,
                        //     ),
                        //     ///
                        //     // Expanded(
                        //     //   child: InkWell(
                        //     //     onTap: () {
                        //     //       Navigator.push(
                        //     //           context,
                        //     //           MaterialPageRoute(
                        //     //               builder: (context) =>
                        //     //                   vTouchScreen()));
                        //     //     },
                        //     //     child: Container(
                        //     //       width: 130,
                        //     //       height: 130,
                        //     //       decoration: const BoxDecoration(
                        //     //         boxShadow: [
                        //     //           BoxShadow(
                        //     //             color: Color(0xffEDEDED),
                        //     //             spreadRadius: 1,
                        //     //             blurRadius: 15,
                        //     //             offset: Offset(
                        //     //                 0, 3), // changes position of shadow
                        //     //           ),
                        //     //         ],
                        //     //       ),
                        //     //       child: Container(
                        //     //         child: Image.asset("assets/images/vv.png"),
                        //     //         decoration: BoxDecoration(
                        //     //           color: Colors.white,
                        //     //           borderRadius: BorderRadius.only(
                        //     //             topLeft: Radius.circular(20.0),
                        //     //             topRight: Radius.circular(20.0),
                        //     //             bottomLeft: Radius.circular(20.0),
                        //     //             bottomRight: Radius.circular(20.0),
                        //     //           ),
                        //     //         ),
                        //     //       ),
                        //     //     ),
                        //     //   ),
                        //     // ),
                        //   ],
                        // ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.special,
                            style: TextStyle(
                                color: Color(0xff1E232C),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Text(
                            AppLocalizations.of(context)!.sea,
                            style: TextStyle(
                                color: Color(0xff8391A1), fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //       Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.only(
                      //       topLeft: Radius.circular(20.0),
                      //       topRight: Radius.circular(20.0),
                      //       bottomLeft: Radius.circular(20.0),
                      //       bottomRight: Radius.circular(20.0),
                      //     ),
                      //   ),
                      //   child: InkWell(
                      //     onTap: () {
                      //    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>OfferScreen()));
                      //
                      //     },
                      //     child: Stack(
                      //       alignment: Alignment.centerLeft,
                      //       children: [
                      //         Image.asset("assets/images/offer.png"),
                      //         Image.asset("assets/images/sadow.png"),
                      //         Column(
                      //           children: [
                      //             Text.rich(
                      //               TextSpan(
                      //                 children: [
                      //                   TextSpan(text: '30%',
                      //                     style: TextStyle(
                      //                         color: Color(0xffFF9940),
                      //                         fontWeight: FontWeight.w700,
                      //                         fontSize: 30
                      //                     ),
                      //                   ),
                      //                   TextSpan(text: 'Off',
                      //                     style: TextStyle(
                      //                         color: Color(0xffFFFFFF),
                      //                         fontWeight: FontWeight.w600,
                      //                         fontSize: 20
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               textAlign: TextAlign.start,
                      //             ),
                      //           ],
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      MiddleScreen(),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.partners,
                            style: TextStyle(
                                color: Color(0xff1E232C),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ClientWidget(),

                      SizedBox(
                        height: 15,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context, MaterialPageRoute(builder: (context) => SuperMarket()));
                      //   },
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Expanded(
                      //         child: Container(
                      //           width: 130,
                      //           height: 130,
                      //           decoration: const BoxDecoration(
                      //             boxShadow: [
                      //               BoxShadow(
                      //                 color: Color(0xffEDEDED),
                      //                 spreadRadius: 1,
                      //                 blurRadius: 15,
                      //                 offset: Offset(
                      //                     0, 3), // changes position of shadow
                      //               ),
                      //             ],
                      //           ),
                      //           child: Container(
                      //             child: Center(child: Text("Super Market")),
                      //             decoration: BoxDecoration(
                      //               color: Colors.white,
                      //               borderRadius: BorderRadius.only(
                      //                 topLeft: Radius.circular(20.0),
                      //                 topRight: Radius.circular(20.0),
                      //                 bottomLeft: Radius.circular(20.0),
                      //                 bottomRight: Radius.circular(20.0),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 15,
                      //       ),
                      //       Expanded(
                      //         child: InkWell(
                      //           onTap: () {
                      //
                      //           },
                      //           child: Container(
                      //             width: 130,
                      //             height: 130,
                      //             decoration: const BoxDecoration(
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                   color: Color(0xffEDEDED),
                      //                   spreadRadius: 1,
                      //                   blurRadius: 15,
                      //                   offset: Offset(
                      //                       0, 3), // changes position of shadow
                      //                 ),
                      //               ],
                      //             ),
                      //             child: Container(
                      //               child: Center(child: Text("Resturant")),
                      //               decoration: BoxDecoration(
                      //                 color: Colors.white,
                      //                 borderRadius: BorderRadius.only(
                      //                   topLeft: Radius.circular(20.0),
                      //                   topRight: Radius.circular(20.0),
                      //                   bottomLeft: Radius.circular(20.0),
                      //                   bottomRight: Radius.circular(20.0),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      Container(
                        height: 100,
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>NearbyMachineScreen()));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MachinesPhotoScreen()));
                            },
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.machines,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                Image.asset("assets/images/machine.png")
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _onbackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Center(child: Text(' هل تريد الخروج ')),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('لا'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                ElevatedButton(
                  child: Text('نعم'),
                  onPressed: () => SystemChannels.platform
                      .invokeMethod('SystemNavigator.pop'),
                )
              ],
            ));
  }
}
