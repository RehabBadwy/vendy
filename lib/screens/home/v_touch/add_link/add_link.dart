import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/add_link_provider.dart';
import 'package:vendy_station/screens/dashboard/dashboard.dart';
import 'package:vendy_station/screens/home/v_touch/add_link/share_touch.dart';

import '../../../../data/datasource/remote/dio/cash.dart';
import '../../../../util/color_manager.dart';
import '../../../../util/constant.dart';
import '../../vendy_school/request_success.dart';
import '../vtouch_screen.dart';
import 'add_social.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AddLinkScreen extends StatefulWidget {
  const AddLinkScreen({Key? key}) : super(key: key);

  @override
  State<AddLinkScreen> createState() => _AddLinkScreenState();
}

class _AddLinkScreenState extends State<AddLinkScreen> {
  late List<bool> switchesState;
   int numberOfSwitches =1000;
   bool state = true;
   String on = "false";

 // List<bool> switchesState = List.generate(numberOfSwitches, (index) => false);

  @override
  void initState() {
    super.initState();
   switchesState = List.generate(numberOfSwitches, (index) => true);
    state = bool.parse(on);
    print("state$state");

  }
  @override
  Widget build(BuildContext context) {
    Provider.of<AddLinkProvider>(context, listen: false).getSaveSocial(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<AddLinkProvider>(
        builder: (context,linkSO,child){
          return linkSO.saveLink!=null ?
            SingleChildScrollView(
              child: Column(
              children: [
                Container(
                  padding:  EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 12,),
                          Text(
                            AppLocalizations.of(context)!.link,
                            style: TextStyle(
                                color: ColorManager.primary,
                                fontSize: 16
                            ),
                          ),
                          const SizedBox(height: 12,),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddSocialScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorManager.primary
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.add,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ColorManager.white
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const SizedBox(width: 12,),
                          // Text(
                          //   "Share vTouch",
                          //   style: TextStyle(
                          //       color: ColorManager.primary,
                          //       fontSize: 16
                          //   ),
                          // ),
                          // const SizedBox(height: 12,),
                          // const Spacer(),
                          ElevatedButton(
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ShareTouchScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorManager.primary
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.share,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ColorManager.white
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: TextButton(onPressed: ()async{

                    //  FilePickerResult? result = await FilePicker.platform.pickFiles() ;
                    // // if(result!=null){
                    //    File file = File(result!.files.single.path??"");
                    //   String fileName = file.path.split('/').last;
                    //    String path = file.path;
                    //   FormData Xfilee = FormData.fromMap({
                    //     "upl_file" : await MultipartFile.fromFile(path,filename: fileName)
                    //   } );
                    //   print(file);
                    //
                    // }
                    // filePicker();
                    Provider.of<AddLinkProvider>(context, listen: false).getUploadFile(context);

                  }, child:
                  // fileNAME!=null?
                  //     Text(fileNAME!):
                  Column(

                    children: [
                      fileNAME!=null ?
                      Container(
                          height: 50,
                          width: double.infinity,
                          decoration:  BoxDecoration(
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
                          child: Center(child: Text("$fileNAME"))):
                      Container(
                          height: 50,
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
                          child: Center(child: Text(
                            textAlign:TextAlign.start,
                            "$fileNAME",
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ))),
                    ],
                  ),
                  ),
                ),
               ListView.separated(
                 separatorBuilder: (context,index){
                   return SizedBox(height: 5,);
                 },
                   shrinkWrap: true,
                   physics: ScrollPhysics(),
                   itemCount: linkSO.saveLink!.links!.length,
                   itemBuilder: (context,index){
                     return  Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         width: 50,
                         height: 50,
                         decoration: const BoxDecoration(
                           color: Colors.white,
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
                           child: Row(
                             children: [
                               if(linkSO.saveLink!.links![index].subcat=="facebook")
                                 Image.asset("assets/images/fbook.png",width: 30,height: 30,),
                               if(linkSO.saveLink!.links![index].subcat=="Whatsapp")
                               Image.asset("assets/images/whats.png",width: 30,height: 30,color: Colors.green,),
                               if(linkSO.saveLink!.links![index].subcat=="tiktok")
                                 Image.asset("assets/images/tiktok-.png",width: 30,height: 30,),
                               if(linkSO.saveLink!.links![index].subcat=="masanger")
                                 Image.asset("assets/images/masanger.png",width: 30,height: 30,),
                               if(linkSO.saveLink!.links![index].subcat=="pinterest")
                                 Image.asset("assets/images/pinterest.png",width: 30,height: 30),
                               if(linkSO.saveLink!.links![index].subcat=="dribbble")
                                 Image.asset("assets/images/dribble.png",width: 30,height: 30),
                               if(linkSO.saveLink!.links![index].subcat=="snap")
                                 Image.asset("assets/images/snapshat-.png",width: 30,height: 30),
                               if(linkSO.saveLink!.links![index].subcat=="telegram")
                                 Image.asset("assets/images/telegram-.png",width: 30,height: 30),
                               if(linkSO.saveLink!.links![index].subcat=="spotify")
                                 Image.asset("assets/images/spotify-.png",width: 30,height: 30),
                               if(linkSO.saveLink!.links![index].subcat=="anghami")
                                 Image.asset("assets/images/anghami-.png",width: 30,height: 30),
                               if(linkSO.saveLink!.links![index].subcat=="youtube")
                                 Image.asset("assets/images/youtube-.png",width: 30,height: 30),
                               if(linkSO.saveLink!.links![index].subcat=="instagram")
                                 Image.asset("assets/images/instagram-.png",width: 30,height: 30),
                               ///
                               if(linkSO.saveLink!.links![index].subcat=="linked")
                                 Image.asset("assets/images/linked.png",width: 30,height: 30),
                               if(linkSO.saveLink!.links![index].subcat=="gmail")
                                 Image.asset("assets/images/gmail-.png",width: 30,height: 30),
                               if(linkSO.saveLink!.links![index].subcat=="googlePlay")
                                 Image.asset("assets/images/google-play-.png",width: 30,height: 30),
                               if(linkSO.saveLink!.links![index].subcat=="appstore")
                                 Image.asset("assets/images/store.png",width: 30,height: 30),
                               if(linkSO.saveLink!.links![index].subcat=="github")
                                 Image.asset("assets/images/git.png",width: 30,height: 30),
                               if(linkSO.saveLink!.links![index].subcat=="paypal")
                                 Image.asset("assets/images/pay-.png",width: 30,height: 30),
                               if(linkSO.saveLink!.links![index].subcat=="zoom")
                                 Image.asset("assets/images/zooom.png",width: 30,height: 30),
                               ///
                               if(linkSO.saveLink!.links![index].subcat=="cash")
                                 Image.asset("assets/images/cashapp.png",width: 30,height: 30),
                               if(linkSO.saveLink!.links![index].subcat=="telda")
                                 Image.asset("assets/images/telda.png",width: 30,height: 30),
                               SizedBox(width: 10,),
                               Text(linkSO.saveLink!.links![index].subcat!,
                                 style: TextStyle(
                                     color: Color(0xff8391A1),
                                     fontSize: 18),),
                               Spacer(),

                               Switch(
                                   activeColor: Colors.green,
                                   value: bool.parse(linkSO.saveLink!.links![index].activate!),
                                   //switchesState[index],
                                   onChanged: (bool value){
                                     switchesState[index]=value;
                                  //   bool.parse("${linkSO.saveLink!.links![index].activate}")=value;
                                     setState(() {
                                     });

                                       Provider.of<AddLinkProvider>(context, listen: false).getActiveLink(context,
                                           linkSO.saveLink!.links![index].subcat!,
                                           "${switchesState[index]=value}"
                                       );


                                     print("object$value");
                                     print("switchon${switchesState[index]=value}");
                                     print("subcat${linkSO.saveLink!.links![index].subcat!}");
                                     CacheHelper.saveData(
                                         key: 'switchOn', value: switchesState[index]);
                                     switchOn = CacheHelper.getData(key: 'switchOn');
                                   }),
                               IconButton(
                                   onPressed: (){
                                   showDialog(
                                     context: context,
                                     builder: (context) => AlertDialog(
                                       content: Text(AppLocalizations.of(context)!.delete),
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
                                             //  _canPop = true;
                                               Provider.of<AddLinkProvider>(context, listen: false).getdeleteSocial(context,
                                                   linkSO.saveLink!.links![index].id! );
                                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
                                               Navigator.of(context).pop();
                                             });

                                           },
                                           child: Text(AppLocalizations.of(context)!.agree),
                                         ),
                                       ],
                                     ),
                                   );






                                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>RequestSuccessScreen()));

                                   setState(() {

                                   });
                                 },
                                 icon: Icon(Icons.delete,color: Colors.red,)
                               ),
                             ],
                           ),
                         ),
                       ),
                     );
                   })
              ],
          ),
            ):Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}
