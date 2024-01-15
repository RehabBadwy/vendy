import 'package:flutter/material.dart';

class CottoScreen extends StatefulWidget {
  const CottoScreen({Key? key}) : super(key: key);

  @override
  State<CottoScreen> createState() => _CottoScreenState();
}

class _CottoScreenState extends State<CottoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
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
                          "Vendy Station",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff1E232C)
                          ),
                          textAlign: TextAlign.center,
                        )),

                  ],
                ),
                SizedBox(height: 15,),
                Image.asset("assets/images/cotton1.jpg",fit: BoxFit.cover),
                SizedBox(height: 15,),
                Image.asset("assets/images/cotton2.jpg",fit: BoxFit.cover),
                SizedBox(height: 15,),
                Image.asset("assets/images/cotton3.jpg",fit: BoxFit.cover),
                SizedBox(height: 15,),
                Image.asset("assets/images/cotton4.jpg",fit: BoxFit.cover),
                SizedBox(height: 15,),
                Image.asset("assets/images/cotton5.jpg",fit: BoxFit.cover),
                SizedBox(height: 15,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
