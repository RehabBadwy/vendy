import 'package:flutter/material.dart';
import 'package:vendy_station/screens/home/supermarket/details.dart';

import 'item_supermarket.dart';

class CategorySuperMarket extends StatefulWidget {
  const CategorySuperMarket({Key? key}) : super(key: key);

  @override
  State<CategorySuperMarket> createState() => _CategorySuperMarketState();
}

class _CategorySuperMarketState extends State<CategorySuperMarket> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/back.png",width: 40,height: 40,)),

                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Shop By Category",
                  style: TextStyle(
                        fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              // Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: GridView.builder(
              //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 3,
              //             mainAxisSpacing: 10,
              //             crossAxisSpacing: 10,
              //         ),
              //         shrinkWrap: true,
              //         physics: NeverScrollableScrollPhysics(),
              //         itemBuilder: (context,index){
              //           return Column(
              //             children: [
              //               Container(
              //                 width: 70,
              //                 height:70,
              //                 //120,
              //                 padding: EdgeInsets.all(10),
              //                 decoration: const BoxDecoration(
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
              //                 child: InkWell(
              //                   onTap: (){
              //                     Navigator.push(
              //                         context, MaterialPageRoute(builder: (context) => ItemSuperMarket()));
              //                   },
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Image.asset("assets/images/milk-.png",width: 30,),
              //                   )
              //                 ),
              //               ),
              //               SizedBox(height: 10,),
              //               Text("Milk")
              //             ],
              //           );
              //         },
              //
              //         itemCount: 5)
              // ),
              ///
              // GridView.builder(
              //   shrinkWrap: true,
              //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //         maxCrossAxisExtent: 200,
              //         childAspectRatio: 3 / 2,
              //         crossAxisSpacing: 20,
              //         mainAxisSpacing: 20),
              //     itemCount: 5,
              //     itemBuilder: (BuildContext ctx, index) {
              //       return Container(
              //         alignment: Alignment.center,
              //         decoration: BoxDecoration(
              //             color: Colors.amber,
              //             borderRadius: BorderRadius.circular(15)),
              //         child: Text("Milk"),
              //       );
              //     }),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                crossAxisSpacing: 15,
                  mainAxisSpacing: 10
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12.0),
                                          topRight: Radius.circular(12.0),
                                          bottomLeft: Radius.circular(12.0),
                                          bottomRight: Radius.circular(12.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(0, 1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                                                context, MaterialPageRoute(builder: (context) => ItemSuperMarket()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/milk-.png",width: 30,),
                          SizedBox(height: 15,),
                          Center(child: Text('milk')),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // GridView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       mainAxisSpacing: 20,
              //       crossAxisSpacing: 20
              //   ),
              //   itemCount: 2,
              //   itemBuilder: (context,index){
              //     return InkWell(
              //       onTap: (){
              //
              //
              //       },
              //       child: Container(
              //         decoration: BoxDecoration(
              //
              //           borderRadius: BorderRadius.all(Radius.circular(12),),
              //           border: Border.all(width: 1,color: Colors.brown),
              //
              //         ),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Container(
              //                 width: 80,
              //                 height: 80,
              //                 decoration: new BoxDecoration(
              //                     shape: BoxShape.circle,
              //                     image: new DecorationImage(
              //                       fit: BoxFit.fill,
              //                       image:AssetImage("assets/images/milk.png"),
              //                     ))),
              //             SizedBox(height: 10,),
              //             Text("fghbjklm"),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // )
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cheese",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Container(

                                decoration:  BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(0, 1), // changes position of shadow
                                    ),
                                  ],

                                ),
                                child: Image.asset("assets/images/cheese-.png",width: 80,height: 80,),
                                height: 120,
                                width: 200,
                              ),
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => SuperMarketDetails()));
                              },
                            ),
                            SizedBox(height: 10,),
                            Text("Creamy",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("EGP 65",
                              style: TextStyle(
                                  fontSize: 15,

                                  color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                      );
                    },

                    itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 20,);
                  },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
