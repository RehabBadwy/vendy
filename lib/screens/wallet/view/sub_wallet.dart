import 'package:flutter/material.dart';
import '../../payment/register/register_screen.dart';
import '../../payment/register/wallet.dart';

class SubWalletPage extends StatefulWidget {
  const SubWalletPage({Key? key}) : super(key: key);

  @override
  State<SubWalletPage> createState() => _SubWalletPageState();
}

class _SubWalletPageState extends State<SubWalletPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
        //  RegisterScreenPayment(),

          InkWell(
            onTap: (){
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>FamilyScreen()));
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreenPayment()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffEDEDED),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child:Image.asset("assets/images/visa_logo.jpeg",width: 70,height: 100,),
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
                SizedBox(width: 15,),
                Expanded(
                  child: InkWell(
                    onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>WaletCachPayment()));
                    },
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffEDEDED),
                            spreadRadius: 1,
                            blurRadius: 15,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child:Image.asset("assets/images/wallet_logo.png",width: 300,fit: BoxFit.cover,),
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
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
