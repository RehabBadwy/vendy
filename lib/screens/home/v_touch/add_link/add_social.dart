import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vendy_station/provider/add_link_provider.dart';
import 'package:vendy_station/provider/school_provider.dart';
import 'package:vendy_station/screens/home/v_touch/add_link/add_scocial_media.dart';

import '../../../../provider/auth_provider.dart';
import '../../../../util/color_manager.dart';
import '../../../dashboard/dashboard.dart';
import '../vtouch_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddSocialScreen extends StatefulWidget {
  const AddSocialScreen({Key? key}) : super(key: key);

  @override
  State<AddSocialScreen> createState() => _AddSocialScreenState();
}

class _AddSocialScreenState extends State<AddSocialScreen> {
  int? _currentIndex;
  int? get currentIndex => _currentIndex;
  void setCurrentIndex(int index) {
    _currentIndex = index;
  }

  final List<Map<String, dynamic>> category = [
    {
      "image": "assets/images/fbook.png",
      "title": "facebook",
    },
    {
      "image": "assets/images/whats.png",
      "title": "WhatsApp",
    },
    {
      "image": "assets/images/masanger.png",
      "title": "Masenger",
    },
  ];
  Widget _buildCartegory(cat, context) {
    return InkWell(
        onTap: () {},
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  cat['image'],
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  cat['title'],
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff8391A1),
                      fontSize: 16),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // openDialogMassanger();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF5F5F5)),
                  child: Text(
                    "Add",
                    style: TextStyle(fontSize: 16, color: ColorManager.black),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const vTouchScreen()));
                          //  Navigator.pop(context);
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
                      AppLocalizations.of(context)!.social,
                      style: TextStyle(fontSize: 20, color: Color(0xff1E232C)),
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
                // SizedBox(
                //   height: 200,
                //   child: Expanded(
                //     child: ListView.builder(
                //       scrollDirection: Axis.vertical,
                //       // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //       //   crossAxisCount: 3,
                //       //   crossAxisSpacing: 25,
                //       //   childAspectRatio: 150/3,
                //       //   mainAxisSpacing: 2
                //       //
                //       // ),
                //       itemCount: 3,
                //       itemBuilder: (BuildContext context, int index) {
                //       return _buildCartegory(category[index], context);
                //       //   Container(
                //       //   decoration: const BoxDecoration(
                //       //
                //       //     // boxShadow: [
                //       //     //   BoxShadow(
                //       //     //     color: Color(0xffEDEDED),
                //       //     //     spreadRadius: 1,
                //       //     //     blurRadius: 15,
                //       //     //    offset: Offset(0, 3), // changes position of shadow
                //       //     //   ),
                //       //     // ],
                //       //   ),
                //       //   child: Column(
                //       //     children: [
                //       //       Row(
                //       //         children: [
                //       //           Image.asset("assets/images/fbook.png",width: 30,height: 30,),
                //       //           SizedBox(width: 10,),
                //       //           Text("facebook",
                //       //             style: TextStyle(
                //       //                 fontWeight: FontWeight.w600,
                //       //                 color: Color(0xff8391A1),
                //       //                 fontSize: 16
                //       //             ),
                //       //           ),
                //       //           Spacer(),
                //       //           ElevatedButton(
                //       //             onPressed: ()async{
                //       //               openDialog();
                //       //             },
                //       //             style: ElevatedButton.styleFrom(
                //       //                 backgroundColor:Color(0xffF5F5F5)
                //       //             ),
                //       //             child: Text(
                //       //               "Add",
                //       //               style: TextStyle(
                //       //                   fontSize: 16,
                //       //                   color: ColorManager.black
                //       //               ),
                //       //             ),
                //       //           )
                //       //         ],
                //       //       ),
                //       //       Row(
                //       //         children: [
                //       //           Image.asset("assets/images/whats.png",width: 30,height: 30,color: Colors.green,),
                //       //           SizedBox(width: 10,),
                //       //           Text("Whatsapp",
                //       //             style: TextStyle(
                //       //                 fontWeight: FontWeight.w600,
                //       //                 color: Color(0xff8391A1),
                //       //                 fontSize: 16
                //       //             ),
                //       //           ),
                //       //           Spacer(),
                //       //           ElevatedButton(
                //       //             onPressed: (){
                //       //               Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSocialMediaScreen()));
                //       //             },
                //       //             style: ElevatedButton.styleFrom(
                //       //                 backgroundColor:Color(0xffF5F5F5)
                //       //             ),
                //       //             child: Text(
                //       //               "Add",
                //       //               style: TextStyle(
                //       //                   fontSize: 16,
                //       //                   color: ColorManager.black
                //       //               ),
                //       //             ),
                //       //           )
                //       //         ],
                //       //       ),
                //       //       Row(
                //       //         children: [
                //       //           Image.asset("assets/images/masanger.png",width: 30,height: 30,),
                //       //           SizedBox(width: 10,),
                //       //           Text("Masanger",
                //       //             style: TextStyle(
                //       //                 fontWeight: FontWeight.w600,
                //       //                 color: Color(0xff8391A1),
                //       //                 fontSize: 16
                //       //             ),
                //       //           ),
                //       //           Spacer(),
                //       //           ElevatedButton(
                //       //             onPressed: (){
                //       //               openDialogMassanger();
                //       //             },
                //       //             style: ElevatedButton.styleFrom(
                //       //                 backgroundColor:Color(0xffF5F5F5)
                //       //             ),
                //       //             child: Text(
                //       //               "Add",
                //       //               style: TextStyle(
                //       //                   fontSize: 16,
                //       //                   color: ColorManager.black
                //       //               ),
                //       //             ),
                //       //           )
                //       //         ],
                //       //       ),
                //       //     ],
                //       //   )
                //       // );
                //     },),
                //   ),
                // ),
                ///
                // CarouselSlider.builder(
                //   options: CarouselOptions(
                //     aspectRatio: 2.1,
                //     viewportFraction: 0.99,
                //    // autoPlay: true,
                //    // enlargeFactor: 0.5,
                //     // enlargeCenterPage: true,
                //     // enableInfiniteScroll: true,
                //     // disableCenter: true,
                //     onPageChanged: (index, reason) {
                //       setState(() {
                //         setCurrentIndex(index);
                //       });
                //     },
                //
                //   ),
                //
                //   itemCount: category.length,
                //   itemBuilder: (BuildContext context, int index, int realIndex) {
                //     return _buildCartegory(category[index], context);
                //     //   Container(
                //     //   decoration: const BoxDecoration(
                //     //
                //     //     // boxShadow: [
                //     //     //   BoxShadow(
                //     //     //     color: Color(0xffEDEDED),
                //     //     //     spreadRadius: 1,
                //     //     //     blurRadius: 15,
                //     //     //    offset: Offset(0, 3), // changes position of shadow
                //     //     //   ),
                //     //     // ],
                //     //   ),
                //     //   child: Column(
                //     //     children: [
                //     //       Row(
                //     //         children: [
                //     //           Image.asset("assets/images/fbook.png",width: 30,height: 30,),
                //     //           SizedBox(width: 10,),
                //     //           Text("facebook",
                //     //             style: TextStyle(
                //     //                 fontWeight: FontWeight.w600,
                //     //                 color: Color(0xff8391A1),
                //     //                 fontSize: 16
                //     //             ),
                //     //           ),
                //     //           Spacer(),
                //     //           ElevatedButton(
                //     //             onPressed: ()async{
                //     //               openDialog();
                //     //             },
                //     //             style: ElevatedButton.styleFrom(
                //     //                 backgroundColor:Color(0xffF5F5F5)
                //     //             ),
                //     //             child: Text(
                //     //               "Add",
                //     //               style: TextStyle(
                //     //                   fontSize: 16,
                //     //                   color: ColorManager.black
                //     //               ),
                //     //             ),
                //     //           )
                //     //         ],
                //     //       ),
                //     //       Row(
                //     //         children: [
                //     //           Image.asset("assets/images/whats.png",width: 30,height: 30,color: Colors.green,),
                //     //           SizedBox(width: 10,),
                //     //           Text("Whatsapp",
                //     //             style: TextStyle(
                //     //                 fontWeight: FontWeight.w600,
                //     //                 color: Color(0xff8391A1),
                //     //                 fontSize: 16
                //     //             ),
                //     //           ),
                //     //           Spacer(),
                //     //           ElevatedButton(
                //     //             onPressed: (){
                //     //               Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSocialMediaScreen()));
                //     //             },
                //     //             style: ElevatedButton.styleFrom(
                //     //                 backgroundColor:Color(0xffF5F5F5)
                //     //             ),
                //     //             child: Text(
                //     //               "Add",
                //     //               style: TextStyle(
                //     //                   fontSize: 16,
                //     //                   color: ColorManager.black
                //     //               ),
                //     //             ),
                //     //           )
                //     //         ],
                //     //       ),
                //     //       Row(
                //     //         children: [
                //     //           Image.asset("assets/images/masanger.png",width: 30,height: 30,),
                //     //           SizedBox(width: 10,),
                //     //           Text("Masanger",
                //     //             style: TextStyle(
                //     //                 fontWeight: FontWeight.w600,
                //     //                 color: Color(0xff8391A1),
                //     //                 fontSize: 16
                //     //             ),
                //     //           ),
                //     //           Spacer(),
                //     //           ElevatedButton(
                //     //             onPressed: (){
                //     //               openDialogMassanger();
                //     //             },
                //     //             style: ElevatedButton.styleFrom(
                //     //                 backgroundColor:Color(0xffF5F5F5)
                //     //             ),
                //     //             child: Text(
                //     //               "Add",
                //     //               style: TextStyle(
                //     //                   fontSize: 16,
                //     //                   color: ColorManager.black
                //     //               ),
                //     //             ),
                //     //           )
                //     //         ],
                //     //       ),
                //     //     ],
                //     //   )
                //     // );
                //   },),
                ///
                Row(
                  children: [
                    Image.asset(
                      "assets/images/fbook.png",
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "facebook",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () async {
                        openDialog();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style:
                            TextStyle(fontSize: 16, color: ColorManager.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/whats.png",
                      width: 30,
                      height: 30,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.whats,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddSocialMediaScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style:
                            TextStyle(fontSize: 16, color: ColorManager.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/masanger.png",
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Masanger",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogMassanger();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style:
                            TextStyle(fontSize: 16, color: ColorManager.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/tiktok-.png",
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Tiktok",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () async {
                        openDialogTiktok();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style:
                            TextStyle(fontSize: 16, color: ColorManager.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/telegram-.png",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Telegram",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogTelegram();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style:
                            TextStyle(fontSize: 16, color: ColorManager.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/snapshat-.png",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Snapshat",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogSnap();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style:
                            TextStyle(fontSize: 16, color: ColorManager.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/instagram-.png",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Instagram",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openInsta();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style:
                            TextStyle(fontSize: 16, color: ColorManager.black),
                      ),
                    )
                  ],
                ),

                ///
                Center(
                  child: Text(
                    "Creativity",
                    style: TextStyle(
                        color: Color(0xff1E232C),
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/pinterest.png",
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "pinterest",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogPin();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/behance.png",
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "behance",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        //  openDialogPin();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/dribble.png",
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Dribbble",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogDribble();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),

                ///
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.music,
                    style: TextStyle(
                        color: Color(0xff1E232C),
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/spotify-.png",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Spotify",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogSpotify();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset("assets/images/youtube-.png",
                        width: 30, height: 30),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Youtube",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogyoutube();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/anghami-.png",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Anghami",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogAngahmi();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),

                ///
                Center(
                  child: Text(
                    "Payment",
                    style: TextStyle(
                        color: Color(0xff1E232C),
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  children: [
                    Image.asset("assets/images/telda.png",
                        width: 30, height: 30),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Telda",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogTelda();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/cashapp.png",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Cash App",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogCash();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),

                ///
                Center(
                  child: Text(
                    "Bussiness",
                    style: TextStyle(
                        color: Color(0xff1E232C),
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  children: [
                    Image.asset("assets/images/linked.png",
                        width: 30, height: 30),
                    SizedBox(
                      width: 10,
                    ),
                    Text("LinkedIn",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff8391A1),
                            fontSize: 16)),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogLinked();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/gmail-.png",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Gmail",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogGmail();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/google-play-.png",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Google Play",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogPlay();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/store.png",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "App Store",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogStore();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/git.png",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "GitHub",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialoggit();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/pay-.png",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Paypal",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogPay();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/zooom.png",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Zoom",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8391A1),
                          fontSize: 16),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        openDialogZoom();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF5F5F5)),
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final TextEditingController _linkController = TextEditingController();
  final TextEditingController _masangerController = TextEditingController();
  final TextEditingController _pintController = TextEditingController();
  final TextEditingController _dribbleController = TextEditingController();
  final TextEditingController _tiktokController = TextEditingController();
  final TextEditingController _snapController = TextEditingController();
  final TextEditingController _telegramController = TextEditingController();
  final TextEditingController _spotifyController = TextEditingController();
  final TextEditingController _anghamiController = TextEditingController();
  final TextEditingController _youtubeController = TextEditingController();
  final TextEditingController _inastaController = TextEditingController();
  GlobalKey<FormState> _faceboo = GlobalKey<FormState>();
  GlobalKey<FormState> _masanger = GlobalKey<FormState>();
  GlobalKey<FormState> _inasta = GlobalKey<FormState>();
  GlobalKey<FormState> _pint = GlobalKey<FormState>();
  GlobalKey<FormState> _dribble = GlobalKey<FormState>();
  GlobalKey<FormState> _tiktok = GlobalKey<FormState>();
  GlobalKey<FormState> _snap = GlobalKey<FormState>();
  GlobalKey<FormState> _telegram = GlobalKey<FormState>();
  GlobalKey<FormState> _spotify = GlobalKey<FormState>();
  GlobalKey<FormState> _anghami = GlobalKey<FormState>();
  GlobalKey<FormState> _youtube = GlobalKey<FormState>();

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _faceboo,
              child: TextFormField(
                controller: _linkController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_faceboo.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _linkController.text,
                                "Social Media", "facebook");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }

                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openInsta() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _inasta,
              child: TextFormField(
                controller: _inastaController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_inasta.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _inastaController.text,
                                "Social Media", "instagram");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }

                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogMassanger() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _masanger,
              child: TextFormField(
                controller: _masangerController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_masanger.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _masangerController.text,
                                "Social Media", "masanger");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }

                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogPin() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _pint,
              child: TextFormField(
                controller: _pintController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_pint.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _pintController.text,
                                "Creativity", "pinterest");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }

                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogDribble() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _dribble,
              child: TextFormField(
                controller: _dribbleController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_dribble.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _dribbleController.text,
                                "Creativity", "dribbble");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogTiktok() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _tiktok,
              child: TextFormField(
                controller: _tiktokController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_tiktok.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _tiktokController.text,
                                "Social Media", "tiktok");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogSnap() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _snap,
              child: TextFormField(
                controller: _snapController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_snap.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _snapController.text,
                                "Social Media", "snap");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogTelegram() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _telegram,
              child: TextFormField(
                controller: _telegramController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_telegram.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _telegramController.text,
                                "Social Media", "telegram");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogSpotify() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _spotify,
              child: TextFormField(
                controller: _spotifyController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_spotify.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _spotifyController.text,
                                "Music", "spotify");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogAngahmi() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _anghami,
              child: TextFormField(
                controller: _anghamiController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_anghami.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _anghamiController.text,
                                "Music", "anghami");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogyoutube() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _youtube,
              child: TextFormField(
                controller: _youtubeController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_youtube.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _youtubeController.text,
                                "Music", "youtube");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));

  ///
  final TextEditingController _teldaController = TextEditingController();
  final TextEditingController _cashController = TextEditingController();
  GlobalKey<FormState> _telda = GlobalKey<FormState>();
  GlobalKey<FormState> _cash = GlobalKey<FormState>();
  Future openDialogTelda() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _telda,
              child: TextFormField(
                controller: _teldaController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_telda.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _teldaController.text,
                                "Payment", "telda");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogCash() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _cash,
              child: TextFormField(
                controller: _cashController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_cash.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _cashController.text,
                                "Payment", "cash");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));

  ///
  final TextEditingController _linkedController = TextEditingController();
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _playController = TextEditingController();
  final TextEditingController _storeController = TextEditingController();
  final TextEditingController _gitController = TextEditingController();
  final TextEditingController _payController = TextEditingController();
  final TextEditingController _zoomController = TextEditingController();
  GlobalKey<FormState> _linked = GlobalKey<FormState>();
  GlobalKey<FormState> _gmail = GlobalKey<FormState>();
  GlobalKey<FormState> _play = GlobalKey<FormState>();
  GlobalKey<FormState> _store = GlobalKey<FormState>();
  GlobalKey<FormState> _git = GlobalKey<FormState>();
  GlobalKey<FormState> _pay = GlobalKey<FormState>();
  GlobalKey<FormState> _zoom = GlobalKey<FormState>();
  Future openDialogLinked() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _linked,
              child: TextFormField(
                controller: _linkedController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_linked.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _linkedController.text,
                                "Bussiness", "linked");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogGmail() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _gmail,
              child: TextFormField(
                controller: _gmailController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_gmail.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _gmailController.text,
                                "Bussiness", "gmail");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogPlay() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _play,
              child: TextFormField(
                controller: _playController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_play.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _playController.text,
                                "Bussiness", "googlePlay");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogStore() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _store,
              child: TextFormField(
                controller: _storeController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_store.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _storeController.text,
                                "Bussiness", "appstore");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialoggit() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _git,
              child: TextFormField(
                controller: _gitController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_git.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _gitController.text,
                                "Bussiness", "github");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogPay() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _pay,
              child: TextFormField(
                controller: _payController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_pay.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _payController.text,
                                "Bussiness", "paypal");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
  Future openDialogZoom() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Add Link"),
            content: Form(
              key: _zoom,
              child: TextFormField(
                controller: _zoomController,
                decoration: InputDecoration(hintText: "Add Link"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "amount Be Link";
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_zoom.currentState!.validate() == true) {
                      if ((!Provider.of<AuthProvider>(context, listen: false)
                          .isLoading)) {
                        Provider.of<AddLinkProvider>(context, listen: false)
                            .getAddLinkUser(context, _zoomController.text,
                                "Bussiness", "zoom");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vTouchScreen()));
                      }
                    }
                    // Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.submit))
            ],
          ));
}
