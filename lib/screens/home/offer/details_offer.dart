import 'package:flutter/material.dart';

import '../../../util/image.dart';

class DetailsOfferScreen extends StatefulWidget {
  const DetailsOfferScreen({Key? key}) : super(key: key);

  @override
  State<DetailsOfferScreen> createState() => _DetailsOfferScreenState();
}

class _DetailsOfferScreenState extends State<DetailsOfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [

              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    children: [
                      Image.asset("assets/images/donats.png",

                      ),
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
                  Image.asset("assets/images/shadow.png"),
                  Container(
                    height: 200,
                    //  width: double.infinity,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                       // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("dunkin donuts",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1E232C)
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages ",
                            style: TextStyle(
                                fontSize: 14,

                                color: Color(0xff8391A1)
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],

              ),

            ],
          ),
        ),
      ),
    );
  }
}
