import 'package:flutter/material.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  int value = 0;
  void add() {
    setState((){
      value ++;
    });
  }

  void subtract() {
    setState((){
      value --;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                  SizedBox(width: 30,),
                  Center(
                      child: Text(
                        "Basket",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xff1E232C)
                        ),
                        textAlign: TextAlign.center,
                      )),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          12)),
                                  border: Border.all(
                                      color: Colors.grey,
                                      width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/cheese-.png",width: 50,),
                              )),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Katiol Creamy",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text("EGP 65",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey
                                    ),
                                  ),
                              //    SizedBox(width: 25,),

                                ],
                              ),

                            ],
                          ),
                          Spacer(),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.only(
                          //       topLeft: Radius.circular(12.0),
                          //       topRight: Radius.circular(12.0),
                          //       bottomLeft: Radius.circular(12.0),
                          //       bottomRight: Radius.circular(12.0),
                          //     ),
                          //     boxShadow: [
                          //       BoxShadow(
                          //         color: Colors.grey,
                          //         spreadRadius: 1,
                          //         blurRadius: 5,
                          //         offset: Offset(0, 1), // changes position of shadow
                          //       ),
                          //     ],
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Row(
                          //       children: [
                          //         InkWell(
                          //           onTap: (){
                          //             subtract();
                          //           },
                          //           child: Center(
                          //             child: Icon(Icons.remove),
                          //           ),
                          //         ),
                          //         SizedBox(width: 10,),
                          //         Center(
                          //           child: Text("$value",
                          //             style: TextStyle(
                          //                 color: Color(0xFF222222)
                          //             ),
                          //           ),
                          //         ),
                          //         SizedBox(width: 10,),
                          //         InkWell(
                          //           onTap: (){
                          //             add();
                          //           },
                          //           child: Center(
                          //             child: Icon(Icons.add),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red  ,))

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     height: 100,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(12.0),
            //         topRight: Radius.circular(12.0),
            //         bottomLeft: Radius.circular(12.0),
            //         bottomRight: Radius.circular(12.0),
            //       ),
            //
            //     ),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.all(12),
            //           child: Row(
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text("Payment Summery",
            //                     style: TextStyle(
            //                         fontSize: 15,
            //                         fontWeight: FontWeight.bold,
            //                         color: Colors.black
            //                     ),
            //                   ),
            //                   SizedBox(height: 5,),
            //                   Row(
            //                     children: [
            //                       Text("EGP 65",
            //                         style: TextStyle(
            //                             fontSize: 15,
            //                             color: Colors.grey
            //                         ),
            //                       ),
            //                       //    SizedBox(width: 25,),
            //
            //                     ],
            //                   ),
            //
            //                 ],
            //               ),
            //               Spacer(),
            //               Container(
            //                 decoration: BoxDecoration(
            //                   color: Colors.white,
            //                   borderRadius: BorderRadius.only(
            //                     topLeft: Radius.circular(12.0),
            //                     topRight: Radius.circular(12.0),
            //                     bottomLeft: Radius.circular(12.0),
            //                     bottomRight: Radius.circular(12.0),
            //                   ),
            //                   boxShadow: [
            //                     BoxShadow(
            //                       color: Colors.grey,
            //                       spreadRadius: 1,
            //                       blurRadius: 5,
            //                       offset: Offset(0, 1), // changes position of shadow
            //                     ),
            //                   ],
            //                 ),
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(8.0),
            //                   child: Row(
            //                     children: [
            //                       InkWell(
            //                         onTap: (){
            //                           subtract();
            //                         },
            //                         child: Center(
            //                           child: Icon(Icons.remove),
            //                         ),
            //                       ),
            //                       SizedBox(width: 10,),
            //                       Center(
            //                         child: Text("$value",
            //                           style: TextStyle(
            //                               color: Color(0xFF222222)
            //                           ),
            //                         ),
            //                       ),
            //                       SizedBox(width: 10,),
            //                       InkWell(
            //                         onTap: (){
            //                           add();
            //                         },
            //                         child: Center(
            //                           child: Icon(Icons.add),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),

              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Payment Summery",
                    style: TextStyle(
                        color: Color(0xFF222222),
                      fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Text("Coupon Discount",
                          style: TextStyle(
                            color: Color(0xFF222222),
                          ),
                        ),
                        Spacer(),
                        Text("0",
                          style: TextStyle(
                            color: Color(0xFF222222),
                          ),

                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Text("Delivery fee",
                          style: TextStyle(
                            color: Color(0xFF222222),
                          ),
                        ),
                        Spacer(),
                        Text("0",
                          style: TextStyle(
                            color: Color(0xFF222222),
                          ),

                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Text("Service fee",
                          style: TextStyle(
                            color: Color(0xFF222222),
                          ),
                        ),
                        Spacer(),
                        Text("0",
                          style: TextStyle(
                            color: Color(0xFF222222),
                          ),

                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text("Total Amount",
                      style: TextStyle(
                        //  style: titleRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                        color: Color(0xFF222222),
    fontWeight: FontWeight.bold
                      ),

                              ),


                        Spacer(),
                        Text("0",
                            style: TextStyle(
                              //  style: titleRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                              color: Color(0xFF222222),
                                fontWeight: FontWeight.bold
                            ),


                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row  (
                    children: [

                      Expanded(
                        child: Container(width: MediaQuery.of(context).size.width/3.5,
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 12,
                                    vertical: 24),
                                child: InkWell(
                                  onTap: (){

                                  },
                                  child: Text("Payment",),

                                  ),
                                )),
                          ),
                        ),

                    ]
                )


            )
          ],
        ),
      ),
    );
  }
}
