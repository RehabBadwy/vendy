import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/home/v_touch/activate_produvt/order_now.dart';
import '../../../../provider/add_link_provider.dart';
import '../../../../util/color_manager.dart';
import '../../../../util/fonts_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class BussinessCardScreen extends StatefulWidget {
  const BussinessCardScreen({Key? key}) : super(key: key);

  @override
  State<BussinessCardScreen> createState() => _BussinessCardScreenState();
}

class _BussinessCardScreenState extends State<BussinessCardScreen> {
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
                        AppLocalizations.of(context)!.activate,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff1E232C)
                        ),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: 220,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text("VendyStation",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Text(AppLocalizations.of(context)!.choose,
                  style: TextStyle(
                      color: Color(0xff1E232C),
                      fontSize: 16
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {},
                        style:
                        ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: BorderSide(
                              color: ColorManager.white,
                              width: 1,
                            ),
                            backgroundColor: Colors.white),

                        child: Text(
                          "By NFC",
                          style: TextStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s12),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          scanQRCodee();
                        },
                        style:
                        ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: BorderSide(
                              color: ColorManager.white,
                              width: 1,
                            ),
                            backgroundColor: Colors.white),

                        child: Text(
                          "By QR Code",
                          style: TextStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height:20,
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderNowScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown
                  ),
                  child:Text(
                   AppLocalizations.of(context)!.order,
                    style: TextStyle(
                        color: ColorManager.white
                    ),
                  ),

                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: 55,
              //   child: ElevatedButton(
              //     onPressed: (){
              //       Provider.of<AddLinkProvider>(context, listen: false).getActiveProduct(context);
              //     },
              //     style: ElevatedButton.styleFrom(
              //         backgroundColor: ColorManager.primary
              //     ),
              //     child:Text(
              //       "Activate",
              //       style: TextStyle(
              //           color: ColorManager.white
              //       ),
              //     ),
              //
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  var getResult = 'QR Code Result';
  var qrstr = "let's Scan it";

  TextEditingController scanCode = TextEditingController();
  void scanQRCodee() async {
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
        print("fghjkl${qrCode}");
      });
      setState(() {
        getResult = qrCode;
        print("fghjkl${qrCode}");
      });
      if(getResult==qrCode)
        Provider.of<AddLinkProvider>(context, listen: false).getActiveProduct(context,getResult);
      print("QRCode_Result:--");
      print(qrCode);
      print("qqqqqqqq${getResult}");
    }catch (e){
      getResult = 'Failed to scan QR Code.';
    }
  }
}