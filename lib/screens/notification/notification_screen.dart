import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../provider/notification_provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    Provider.of<NotifiactionUserProvider>(context, listen: false).getNotificationUser(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Consumer<NotifiactionUserProvider>(
              builder: (context,notification,child){
                return notification.notificationModel!=null?
                  Column(
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
                              AppLocalizations.of(context)!.notification,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xff1E232C)
                              ),
                              textAlign: TextAlign.center,
                            )),

                      ],
                    ),
                    SizedBox(height: 20,),
                    
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                            height: 80,
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
                              child: InkWell(
                                onTap: (){
                                },
                                child: Row(
                                  children: [
                                    // CircleAvatar(
                                    //   backgroundImage: AssetImage("assets/images/Oval.png"),
                                    //   radius: 20,
                                    //   backgroundColor: Colors.transparent,
                                    // ),
                                    // SizedBox(width: 20,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("${notification.notificationModel!.notifications![index].title}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff8391A1)
                                            ),
                                          ),
                                          Text(
                                            "${notification.notificationModel!.notifications![index].subtitle}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff8391A1)
                                            ),

                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context,index){
                          return SizedBox(height: 20,);
                        },
                        itemCount: notification.notificationModel!.notifications!.length)
                  ],
                ):Text("No Notification");
              }
            )
          ),
        ),
      ),
    );
  }
}
