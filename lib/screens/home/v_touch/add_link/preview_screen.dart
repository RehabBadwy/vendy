import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vendy_station/provider/add_link_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../util/constant.dart';
import '../vtouch_screen.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({Key? key}) : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<AddLinkProvider>(context, listen: false).getSaveSocial(context);
    return Scaffold(
      //  backgroundColor: Colors.green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<AddLinkProvider>(builder: (context, linkSO, child) {
            return linkSO.saveLink != null
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const vTouchScreen()));

                                  // Navigator.pop(context);
                                },
                                child: Image.asset(
                                  "assets/images/back.png",
                                  width: 40,
                                  height: 40,
                                )),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
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
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  50)),
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 1)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.grey,
                                                      backgroundImage: NetworkImage(
                                                          "https://vendycloud.com/mobile_files/vtouch/vtouchfiles/$imagePath"),
                                                      radius: 30,
                                                    ),
                                                  ),
                                                ),
                                              ),
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
                                                  color: Color(0xff1E232C)),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              // "",
                                              phoneVTouch!,
                                              //name!,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff1E232C)),
                                            ),
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                              AppLocalizations.of(context)!
                                                  .links,
                                              textAlign: TextAlign.start),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          GridView.builder(
                                              shrinkWrap: true,
                                              physics: ScrollPhysics(),
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 5,
                                              ),
                                              itemCount: linkSO
                                                  .saveLink!.links!.length,
                                              itemBuilder: (context, index) {
                                                return linkSO
                                                            .saveLink!
                                                            .links![index]
                                                            .activate ==
                                                        "true"
                                                    ? Column(
                                                        children: [
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "facebook")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/fbook.png",
                                                                    width: 30,
                                                                    height: 30,
                                                                  ),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "Whatsapp")
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(20.0),
                                                                        topRight:
                                                                            Radius.circular(20.0),
                                                                        bottomLeft:
                                                                            Radius.circular(20.0),
                                                                        bottomRight:
                                                                            Radius.circular(20.0),
                                                                      ),
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .blue,
                                                                          width:
                                                                              1)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/whats.png",
                                                                  width: 30,
                                                                  height: 30,
                                                                  color: Colors
                                                                      .green,
                                                                ),
                                                              ),
                                                            ),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "tiktok")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/tiktok-.png",
                                                                    width: 30,
                                                                    height: 30,
                                                                  ),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "masanger")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/masanger.png",
                                                                    width: 30,
                                                                    height: 30,
                                                                  ),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "pinterest")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/pinterest.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "dribbble")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/dribble.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "snap")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/snapshat-.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "telegram")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/telegram-.png",
                                                                      width: 40,
                                                                      height:
                                                                          40),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "spotify")
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          borderRadius: BorderRadius
                                                                              .only(
                                                                            topLeft:
                                                                                Radius.circular(20.0),
                                                                            topRight:
                                                                                Radius.circular(20.0),
                                                                            bottomLeft:
                                                                                Radius.circular(20.0),
                                                                            bottomRight:
                                                                                Radius.circular(20.0),
                                                                          ),
                                                                          border: Border.all(
                                                                              color: Colors
                                                                                  .blue,
                                                                              width:
                                                                                  1)),
                                                                  child: Image.asset(
                                                                      "assets/images/spotify-.png",
                                                                      width: 30,
                                                                      height:
                                                                          30)),
                                                            ),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "anghami")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/anghami-.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "youtube")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/youtube-.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "instagram")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/instagram-.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),

                                                          ///
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "linked")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/linked.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "gmail")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/gmail-.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "googlePlay")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/google-play-.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "appstore")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/store.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "github")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/git.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "paypal")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/pay-.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "zoom")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/zooom.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),

                                                          ///
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "cash")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/cashapp.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),
                                                          if (linkSO
                                                                  .saveLink!
                                                                  .links![index]
                                                                  .subcat ==
                                                              "telda")
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.blue,
                                                                            width: 1)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Image.asset(
                                                                      "assets/images/telda.png",
                                                                      width: 30,
                                                                      height:
                                                                          30),
                                                                )),
                                                        ],
                                                      )
                                                    : SizedBox(
                                                        width: 1,
                                                      );
                                              }),
                                          TextButton(
                                            onPressed: () async {
                                              Share.share(
                                                  "https://get-data-vtouch.vendycloud.com/?vtouch_id=${mac}${int.parse(userPhone!) * 9999}${mac2}");
                                              // _launchUrl();
                                            },
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/share.png",
                                                  color: Colors.black,
                                                  width: 20,
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .data,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18,
                                                      color: Color(0xff838BA1)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Text(AppLocalizations.of(context)!.no),
                  );
          }),
        ),
      ),
    );
  }

  final Uri _url = Uri.parse(
      'https://get-data-vtouch.vendycloud.com/?vtouch_id=${mac}${int.parse(userPhone!) * 9999}${mac2}');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
