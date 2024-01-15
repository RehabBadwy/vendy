import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

import '../../util/color_manager.dart';
import '../../util/constant.dart';

class MyQrCodeScreen extends StatefulWidget {
  const MyQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<MyQrCodeScreen> createState() => _MyQrCodeScreenState();


}


class _MyQrCodeScreenState extends State<MyQrCodeScreen> {

  void qr(){
    int number= 9999;
    int qr = int.parse(userPhone!);
    String code = "${number*qr}";
    print(code);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qr();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                        "QR Code List",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xff1E232C)
                        ),
                        textAlign: TextAlign.center,
                      )),

                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 250,
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
                          BarcodeWidget(
                              padding: EdgeInsets.all(8),
                              data: '${mac}${(int.parse(userPhone!)+12345678999)*9999}${mac2}',
                              barcode: Barcode.qrCode(),
                              height: 50,
                              width: 50,
                              backgroundColor: ColorManager.brown,
                              color: Colors.white),
                          SizedBox(width: 20,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("QR Code",
                               style: TextStyle(
                                   fontSize: 16,
                                   color: Color(0xffC3AA94),
                                   fontWeight: FontWeight.w700
                               ),
                             ),
                             SizedBox(height: 10,),
                             Text("MY QR CODE",
                               style: TextStyle(
                                   fontSize: 24,
                                   fontWeight: FontWeight.w700
                               ),
                             ),
                           ],
                         )
                        ],
                      ),
                      SizedBox(height: 50,),
                      BarcodeWidget(
                          padding: EdgeInsets.all(8),
                          data: '${mac}${(int.parse(userPhone!)+12345678999)*9999}${mac2}',
                          barcode: Barcode.qrCode(),
                          height: 100,
                          width: 100,
                          backgroundColor: Colors.white,
                          color: Colors.black),
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
}
