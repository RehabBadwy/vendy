import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/add_link_provider.dart';
import 'package:vendy_station/screens/home/v_touch/add_link/add_link.dart';
import 'package:vendy_station/screens/home/v_touch/add_link/preview_screen.dart';
import 'package:vendy_station/screens/home/v_touch/add_link/profile_vtouch.dart';
import 'package:vendy_station/screens/home/v_touch/upload_file.dart';
import 'package:vendy_station/util/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../util/color_manager.dart';
import '../../../util/fonts_manager.dart';
import 'activate_produvt/activate_product.dart';

class vTouchScreen extends StatefulWidget {
  const vTouchScreen({Key? key}) : super(key: key);

  @override
  State<vTouchScreen> createState() => _vTouchScreenState();
}

class _vTouchScreenState extends State<vTouchScreen> {

  List<Widget>screenList=const[
    AddLinkScreen(),
    ActivateProductScreen(),
    UploadFileScreen(),
  ];
  List<bool>screenState=[true,false,false];
  int screenIndex=0;
  void changeScreen({required int index}){
    screenIndex=index;
    for(int i=0;i<3;i++)
    {
      (i==index)?screenState[i]=true:screenState[i]=false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Provider.of<AddLinkProvider>(context, listen: false).getSaveProfile(context);

    return Scaffold(
      body: SafeArea(
        child:Consumer<AddLinkProvider>(
          builder: (context,profile,child){
            return

              Column(
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

                    ],
                  ),
                ),
                Center(
                  child:  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      // CircleAvatar(
                      //   backgroundImage: AssetImage("assets/images/Oval.png"),
                      //   radius: 50,
                      //   backgroundColor: Colors.transparent,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     // takePhoto(ImageSource.camera);
                      //   },
                      //   child: const CircleAvatar(
                      //     backgroundColor: Color(0xffC3AA94),
                      //     child: Icon(
                      //       Icons.camera_enhance_outlined,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),

                    ],
                  ),
                ),

                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 180,
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                profile.saveProfileVtouch.isNotEmpty?
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    "https://vendycloud.com/mobile_files/vtouch/vtouchfiles/$imagePath".isNotEmpty ?
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      backgroundImage:NetworkImage("https://vendycloud.com/mobile_files/vtouch/vtouchfiles/$imagePath"),
                                      radius: 25,
                                    ):CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: CachedNetworkImageProvider(
                                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                       // "",
                                       nameVTouch!,
                                        //name!,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff1E232C)
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                       // "",
                                       emailVTouch!,
                                        //name!,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff1E232C)
                                        ),
                                      ),
                                    ),
                                  ],
                                ):Center(child: CircularProgressIndicator(color: Colors.transparent,),),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black
                                          ),
                                          onPressed: (){
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfileVTouch()));
                                          },
                                          child: Text(AppLocalizations.of(context)!.profileone)),
                                    ),
                                    SizedBox(width: 20,),
                                     Expanded(
                                       child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black
                                          ),
                                          onPressed: (){
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PreviewScreen()));
                                          },
                                          child: Text(AppLocalizations.of(context)!.preview)),
                                     )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: ElevatedButton(

                            onPressed: () {
                              setState(() {

                              });
                              changeScreen(index: 0);
                            },
                            style: (screenIndex != 0)
                                ? ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                side: BorderSide(
                                  color: ColorManager.white,
                                  width: 1,

                                ),
                                backgroundColor: Colors.white)
                                : ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                backgroundColor: ColorManager.brown),
                            child: Text(
                              AppLocalizations.of(context)!.link,
                              style: TextStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Container(
                          width: 100,
                          height: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {

                              });
                              changeScreen(index: 1);
                            },
                            style: (screenIndex != 1)
                                ? ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                side: BorderSide(
                                  color: ColorManager.white,
                                  width: 1,
                                ),
                                backgroundColor: Colors.white)
                                : ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                backgroundColor:ColorManager.brown),
                            child: Text(
                              AppLocalizations.of(context)!.product,
                              style: TextStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Container(
                          width: 100,
                          height: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {

                              });
                              changeScreen(index: 2);
                            },
                            style: (screenIndex != 2)
                                ? ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                side: BorderSide(
                                  color: ColorManager.white,
                                  width: 1,
                                ),
                                backgroundColor: Colors.white)
                                : ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                backgroundColor: ColorManager.brown),
                            child: Text(
                              AppLocalizations.of(context)!.upload,
                              style: TextStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: screenList[screenIndex]),
              ],
            );
          },
        )
      ),
    );
  }
}
