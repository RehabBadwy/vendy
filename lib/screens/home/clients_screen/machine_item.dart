import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';
import '../../../provider/clints_provider.dart';

class MachineItemScreen extends StatefulWidget {
  const MachineItemScreen({Key? key}) : super(key: key);

  @override
  State<MachineItemScreen> createState() => _MachineItemScreenState();
}

class _MachineItemScreenState extends State<MachineItemScreen> {
  int current = 0;
  final List<Map<String, dynamic>> category = [
    {
      'image': 'assets/images/ice1.png',
    },
    {
      'image': 'assets/images/sandwitch.png',
    },
    {
      'image': 'assets/images/sweets.png',
    },
    {
      'image': 'assets/images/snacks1.png',
    },


    {
      'image': 'assets/images/ice1.png',
    },
    {
      'image': 'assets/images/sandwitch.png',
    },
    {
      'image': 'assets/images/sweets.png',
    },
    {
      'image': 'assets/images/snacks1.png',
    },


  ];
  Widget _buildCartegory(Map<String, dynamic> cat,context) {

    return Container(
      width: 150,
      height: 150,
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
        child:Image.asset(cat['image']),
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
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(

          child: Consumer<ClientsProvider>(
            builder: (context,machinesProductProvider,child){
              return
                machinesProductProvider.machinesProductModel.isNotEmpty ?
              Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
                        child:  Row(
                          children: [
                            InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Image.asset("assets/images/back.png",width: 40,height: 40,)),

                          ],
                        ),
                      ),
                      machinesProductProvider.machineCodeScan.isNotEmpty?
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: machinesProductProvider.machineCodeScan.length,
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
                                      width: 100,
                                      height: 50,
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
                                            machinesProductProvider.machineCodeScan[index].catName!,
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
                      )
                          : Center(child:Image.asset("assets/images/notfound.png"),),
                      ///
                      GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20
                          ),
                          itemCount: machinesProductProvider.machinesProductModel.length,
                          itemBuilder: (BuildContext context, int index) {
                            return  InkWell(
                                onTap: (){
                                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsMachineScreen()));

                                  if((!Provider.of<AuthProvider>(context, listen: false).isLoading)){
                                    Provider.of<ClientsProvider>(context, listen: false).getMachineOrder(context,
                                      "${machinesProductProvider.machinesProductModel[index].machineId}",
                                      "${machinesProductProvider.machinesProductModel[index].slotNum}",
                                      "${machinesProductProvider.machinesProductModel[index].price}",
                                      "${machinesProductProvider.machinesProductModel[index].org}",
                                      "${machinesProductProvider.machinesProductModel[index].machineIdCloud}",
                                      "${machinesProductProvider.machinesProductModel[index].type}",
                                      "${machinesProductProvider.machinesProductModel[index].itemName}",);

                                  }
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
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
                                      children: [
                                        Image.asset("assets/images/sandwitch.png"),
                                        Text("${machinesProductProvider.machinesProductModel[index].itemName}"),
                                        Text("${machinesProductProvider.machinesProductModel[index].price}"),
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
                  )
              :Center(child: CircularProgressIndicator(),);
            },
          ),

          // child: Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
          //       child:  Row(
          //         children: [
          //           InkWell(
          //               onTap: (){
          //                 Navigator.pop(context);
          //               },
          //               child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
          //
          //         ],
          //       ),
          //     ),
          //     GridView.builder(
          //         shrinkWrap: true,
          //         physics: NeverScrollableScrollPhysics(),
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2,
          //             mainAxisSpacing: 20,
          //             crossAxisSpacing: 20
          //         ),
          //         itemCount: 8,
          //         itemBuilder: (BuildContext context, int index) {
          //           return  InkWell(
          //               onTap: (){
          //                // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsMachineScreen()));
          //               },
          //               child: _buildCartegory(category[index], context));
          //         }
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}