import 'package:flutter/material.dart';

import 'details.dart';

class ItemSuperMarket extends StatefulWidget {
  const ItemSuperMarket({Key? key}) : super(key: key);

  @override
  State<ItemSuperMarket> createState() => _ItemSuperMarketState();
}

class _ItemSuperMarketState extends State<ItemSuperMarket> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                          "Bim",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff1E232C)
                          ),
                          textAlign: TextAlign.center,
                        )),

                  ],
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                height: 60,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),

                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {

                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.all(5),
                              width: 80,
                              height: 45,
                              decoration: BoxDecoration(
                                color: current == index
                                    ? Colors.red
                                    : Colors.white54,
                                borderRadius: current == index
                                    ? BorderRadius.circular(15)
                                    : BorderRadius.circular(10),
                                border: current == index
                                    ? Border.all(
                                    color: Colors.red, width: 2)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                    "Milk",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: current == index
                                          ? Colors.white
                                          : Colors.grey,
                                    )
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20
                  ),
                  itemCount:10,
                  itemBuilder: (BuildContext context, int index) {

                    return  InkWell(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => SuperMarketDetails()));
                      },
                      child: Container(
                        // alignment: Alignment.center,
                        width: 120,
                        height: 120,
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
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //  Image.asset("assets/images/sandwitch.png"),
                            //  if(  machineScan.machineProduct[current].catName == machineScan.machinesProductModel[index].cat)
                              Image.asset("assets/images/milk-.png",width: 80,height: 80,),
                              SizedBox(height: 15,),
                             // if(  machineScan.machineProduct[current].catName == machineScan.machinesProductModel[index].cat)
                                Text("Milk"),
                              SizedBox(height: 15,),
                             // if( machineScan.machineProduct[current].catName == machineScan.machinesProductModel[index].cat)
                                Text("50 LE"),
                            ],
                          ),
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
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
