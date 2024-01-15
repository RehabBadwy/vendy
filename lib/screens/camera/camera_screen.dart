import 'package:barcode_widget/barcode_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/data/model/machine_code_scan.dart';
import 'package:vendy_station/screens/camera/machine_product.dart';
import 'package:vendy_station/screens/camera/my_qr.dart';

import '../../provider/clints_provider.dart';
import '../../util/color_manager.dart';
import '../../util/constant.dart';
import '../home/vendy_school/request_success.dart';
import 'dispence_product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CameraScreen extends StatefulWidget {

   CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}



class _CameraScreenState extends State<CameraScreen> {

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
    Provider.of<ClientsProvider>(context, listen: false).getClientCompany(context);

    return Scaffold(
      body : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:Consumer<ClientsProvider>(
            builder: (context,machineScan,child){
              return  Column(
                children: [
                  Row(
                    children: [
                      // InkWell(
                      //     onTap: (){
                      //       Navigator.pop(context);
                      //     },
                      //     child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                      SizedBox(width: 30,),
                      Center(
                          child: Text(
                            AppLocalizations.of(context)!.qr,
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xff1E232C)
                            ),
                            textAlign: TextAlign.center,
                          )),

                    ],
                  ),
                  SizedBox(height: 20,),
                //  machineScan.machineProduct.isNotEmpty?
                //   ListView.builder(
                //       shrinkWrap: true,
                //       itemBuilder: (context,index){
                //         return Container(
                //           height: 100,
                //           width: double.infinity,
                //           decoration: const BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(20.0),
                //               topRight: Radius.circular(20.0),
                //               bottomLeft: Radius.circular(20.0),
                //               bottomRight: Radius.circular(20.0),
                //             ),
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Color(0xffEDEDED),
                //                 spreadRadius: 1,
                //                 blurRadius: 15,
                //                 offset: Offset(0, 3), // changes position of shadow
                //               ),
                //             ],
                //           ),
                //           child: Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: InkWell(
                //               onTap: ()async{
                //
                //                 try {
                //                   final qrCode = await FlutterBarcodeScanner.scanBarcode(
                //                       '#ff6666', 'Cancel', true, ScanMode.QR);
                //
                //                   if (!mounted) return;
                //
                //                   if (qrCode == '-1') {
                //                     // تم الضغط على "Cancel"
                //                     //  Navigator.pop(context);
                //                     print('User pressed cancel');
                //                     return; // لا تقم بتنفيذ أي عمل إضافي
                //                   }
                //
                //                   setState(() {
                //                     getResult = qrCode;
                //                     print("fghjkl${qrCode}");
                //                   });
                //
                //                   if (getResult == qrCode) {
                //
                //                       Provider.of<ClientsProvider>(context, listen: false).getMachineProduct(context, "1000");
                //                       Provider.of<ClientsProvider>(context, listen: false).getMachineCode(context, "1000","${machineScan.machineProduct[index].catName}");
                //
                //                     Navigator.push(context, MaterialPageRoute(builder: (context) => MachineProductCategory()));
                //
                //                   }
                //
                //                   print("QRCode_Result:--");
                //                   print(qrCode);
                //                   print("qqqqqqqq${getResult}");
                //                 } catch (e) {
                //                   getResult = 'Failed to scan QR Code.';
                //                 }
                //
                //               },
                //               child: Row(
                //                 children: [
                //                   Icon(Icons.settings_overscan,size: 50,color: Colors.brown,),
                //                   SizedBox(width: 20,),
                //                   Text("Scan QR Code",
                //                     style: TextStyle(
                //                         fontSize: 24,
                //                         fontWeight: FontWeight.w700
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         );
                //       },
                //       itemCount: machineScan.machineProduct.length),
                //       //:Center(child: CircularProgressIndicator(color: Colors.transparent,),),
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
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: ()async{

                          scanQRCode();

                        },
                        child: Row(
                          children: [
                            Icon(Icons.settings_overscan,size: 50,color: ColorManager.brown,),
                            SizedBox(width: 20,),
                            Text(AppLocalizations.of(context)!.scanqrcode,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  // TextFormField(
                  //   controller: scanCode,
                  //   // onChanged: (val) {
                  //   //   setState(() {
                  //   //     // qrstr = val;
                  //   //
                  //   //   });
                  //   // },
                  //
                  //   decoration: InputDecoration(
                  //       hintText: '$getResult',
                  //       border: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: Colors.blue,
                  //               width: 2))),
                  // ),
                  // SizedBox(height: 20,),
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
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyQrCodeScreen()));
                        },


                        child: Row(
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
                            Text(AppLocalizations.of(context)!.myqrcode,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          )
        )
      ),
    );
  }
  var getResult = 'QR Code Result';
  var qrstr = "let's Scan it";

  TextEditingController scanCode = TextEditingController();
  // void scanQRCode() async {
  //   try {
  //     final qrCode = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.QR);
  //
  //      if (!mounted) return;
  //
  //     setState(() {
  //       getResult = qrCode;
  //       print("fghjkl${qrCode}");
  //     });
  //
  //
  //     if(getResult==qrCode){
  //        Provider.of<ClientsProvider>(context, listen: false).getMachineCode(context,"1000" );
  //        Navigator.push(context, MaterialPageRoute(builder: (context)=>MachineProductScan()));
  //     }
  //     print("QRCode_Result:--");
  //     print(qrCode);
  //     print("qqqqqqqq${getResult}");
  //   }catch (e){
  //     getResult = 'Failed to scan QR Code.';
  //   }
  // }
  void scanQRCode() async {
    // try {
    //   final qrCode = await FlutterBarcodeScanner.scanBarcode(
    //       '#ff6666', 'Cancel', true, ScanMode.QR);
    //
    //   if (!mounted) return;
    //
    //   if (qrCode == '-1') {
    //     // تم الضغط على "Cancel"
    //   //  Navigator.pop(context);
    //     print('User pressed cancel');
    //     return; // لا تقم بتنفيذ أي عمل إضافي
    //   }
    //
    //   setState(() {
    //     getResult = qrCode;
    //     print("fghjkl${qrCode}");
    //   });
    //
    //   if (getResult == qrCode) {
    //    // Provider.of<ClientsProvider>(context, listen: false).getMachineCode(context, "1000","0");
    //     Provider.of<ClientsProvider>(context, listen: false).getMachineProduct(context, "1000");
    //     Navigator.push(context, MaterialPageRoute(builder: (context) => MachineProductCategory()));
    //   }
    //
    //   print("QRCode_Result:--");
    //   print(qrCode);
    //   print("qqqqqqqq${getResult}");
    // } catch (e) {
    //   getResult = 'Failed to scan QR Code.';
    // }
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      if (qrCode == '-1') {
        // تم الضغط على "Cancel"
        //  Navigator.pop(context);
        print('User pressed cancel');
        return; // لا تقم بتنفيذ أي عمل إضافي
      }

      setState(() {
        getResult = qrCode;
        print("${qrCode}");
      });

      if (getResult == qrCode) {

        Provider.of<ClientsProvider>(context, listen: false).getMachineProduct(context, getResult);
        //  Provider.of<ClientsProvider>(context, listen: false).getMachineCode(context, "1000",);
      //  Provider.of<ClientsProvider>(context, listen: false).getMachineCode(context, machineScan.machineProduct[current].machineCode!,machineScan.machineProduct[current].catName!);


        Navigator.push(context, MaterialPageRoute(builder: (context) => MachineProductCategory()));

      }

      print("QRCode_Result:--");
      print(qrCode);
      print("qqqqqqqq${getResult}");
    } catch (e) {
      getResult = 'Failed to scan QR Code.';
    }
  }

}
