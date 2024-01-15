import 'package:flutter/material.dart';
import 'package:vendy_station/util/image.dart';

class DetailsMachineScreen extends StatefulWidget {
  const DetailsMachineScreen({Key? key}) : super(key: key);

  @override
  State<DetailsMachineScreen> createState() => _DetailsMachineScreenState();
}

class _DetailsMachineScreenState extends State<DetailsMachineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset("assets/images/details.png"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
                      child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset("assets/images/details1.png"),
                    Image.asset("assets/images/shadow.png"),
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft:Radius.circular(20),
                          topRight: Radius.circular(20)
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Coffee Vending machines",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1E232C)
                            ),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Image.asset(Images.camera,
                                color: Colors.black,
                                  width: 18,
                                ),
                                SizedBox(width: 6,),
                                Text("Coffee Vending machines",
                                  style: TextStyle(
                                      fontSize: 14,

                                      color: Color(0xff8391A1)
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
