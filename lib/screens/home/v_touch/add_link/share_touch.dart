import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
// import 'package:vcard_maintained/vcard_maintained.dart';
import 'package:share/share.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/model/save_link.dart';
import '../../../../data/model/save_profile_vtouch.dart';
import '../../../../util/constant.dart';
import '../vtouch_screen.dart';

class ShareTouchScreen extends StatefulWidget {
  ShareTouchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ShareTouchScreen> createState() => _ShareTouchScreenState();
}

class _ShareTouchScreenState extends State<ShareTouchScreen> {
  String vCardExample40 = '''BEGIN:VCARD
VERSION:4.0
N:Gump;Forrest;;Mr.;
FN:$nameVTouch
TEL;TYPE=work,voice;VALUE=uri:tel:$phone2VTouch
TEL;TYPE=CELL,voice;VALUE=uri:tel:$phoneVTouch
ADR;TYPE=WORK;PREF=1;LABEL="$addressVTouch
EMAIL;TYPE=INTERNET:$emailVTouch
REV:20080424T195243Z
x-qq:21588891
END:VCARD''';

  /*
  
  vcc() {
  
  
    ///Set properties
    vCard.firstName = nameVTouch!;
    // vCard.middleName = 'refai';
    // vCard.lastName = 'hamed';
     vCard.cellPhone = phoneVTouch;
     vCard.homePhone=phone2VTouch;
    // vCard.cellPhone = phone2VTouch;
    vCard.email=emailVTouch;
  //  vCard.homeAddress= MailingAddress(addressVTouch!);
    // vCard.organization = 'vendystation la';
    // vCard.uid="100";
     vCard.workPhone = phone2VTouch;
    // vCard.birthday = DateTime.now();
    // vCard.jobTitle = 'Software Developer';
     vCard.url = webVTouch;
     vCard.note = addressVTouch;
  
    /// Save to file
    // vCard.saveToFile('./contact.vcf');
  
    /// Get as formatted string
    print(vCard.getFormattedString());
  
  
  
  
  
  }*/

  bool _light = false;
  void qr() {
    int number = 9999;
    int qr = int.parse(userPhone!);
    String code = "${number * qr}";
    print(code);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //vcc();
    //  qr();
  }

  @override
  Widget build(BuildContext context) {
    var mdh = MediaQuery.of(context).size.height;
    var mdw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                        // Navigator.pop(context);
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
                    AppLocalizations.of(context)!.share,
                    style: TextStyle(fontSize: 30, color: Color(0xff1E232C)),
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: mdh / 2,
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
                      Row(
                        children: [
                          //   Icon(Icons.pin_drop_rounded,size: 15,color: Colors.black,),
                          SizedBox(
                            width: 10,
                          ),
                          Text(AppLocalizations.of(context)!.scan),
                          Spacer(),
                          Switch.adaptive(
                              activeColor: Colors.green,
                              value: _light,
                              onChanged: (bool value) {
                                setState(() {
                                  _light = value;
                                });
                              })
                        ],
                      ),
                      if (_light == false)
                        Column(
                          children: [
                            Row(
                              children: [
                                BarcodeWidget(
                                    padding: EdgeInsets.all(8),
                                    data: vCardExample40,
                                    //vCard.getFormattedString(),
                                    barcode: Barcode.qrCode(),
                                    height: 50,
                                    width: 50,
                                    backgroundColor: Colors.brown,
                                    color: Colors.white),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "QR Code OffLine",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xffC3AA94),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "MY QR CODE OffLine",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            BarcodeWidget(
                                padding: EdgeInsets.all(8),
                                data: vCardExample40,
                                barcode: Barcode.qrCode(),
                                height: 150,
                                width: 150,
                                backgroundColor: Colors.white,
                                color: Colors.black),
                          ],
                        ),
                      if (_light == true)
                        Column(
                          children: [
                            Row(
                              children: [
                                BarcodeWidget(
                                    padding: EdgeInsets.all(8),
                                    data:
                                        'https://get-data-vtouch.vendycloud.com/?vtouch_id=${mac}${int.parse(userPhone!) * 9999}${mac2}',
                                    barcode: Barcode.qrCode(),
                                    height: 50,
                                    width: 50,
                                    backgroundColor: Colors.brown,
                                    color: Colors.white),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "QR Code OnLine",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xffC3AA94),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "MY QR CODE OnLine",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            BarcodeWidget(
                                padding: EdgeInsets.all(8),
                                data:
                                    'https://get-data-vtouch.vendycloud.com/?vtouch_id=${mac}${int.parse(userPhone!) * 9999}${mac2}',
                                barcode: Barcode.qrCode(),
                                height: 150,
                                width: 150,
                                backgroundColor: Colors.white,
                                color: Colors.black),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /*  TextButton(
                onPressed: ()async{
                 // Share.share("View my profile");
                  //var url=("www.google.com");
                  //fb://page/${page_id}

                 // await launchUrl(Uri.parse(url));
                  _launchUrl();
                },
                child:  Row(
                  children: [
                    Icon(Icons.remove_red_eye_outlined),
                    
                    SizedBox(width: 15,),
                    Text(AppLocalizations.of(context)!.viewprof,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff838BA1)
                      ),
                    )
                  ],
                ),),*/
            ],
          ),
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
