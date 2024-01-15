import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/clints_provider.dart';
import '../../../provider/auth_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ClientCategoryProduct extends StatefulWidget {
  const ClientCategoryProduct({Key? key}) : super(key: key);

  @override
  State<ClientCategoryProduct> createState() => _ClientCategoryProductState();
}

class _ClientCategoryProductState extends State<ClientCategoryProduct> {
  int current = 0;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Consumer<ClientsProvider>(
            builder: (context,machineScan,child){
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12),
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
                                AppLocalizations.of(context)!.machine,
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xff1E232C)
                                ),
                                textAlign: TextAlign.center,
                              )),

                        ],
                      ),
                      SizedBox(height: 15,),
                      // SizedBox(
                      //   height: 60,
                      //   child: ListView.builder(
                      //       shrinkWrap: true,
                      //       physics: const ScrollPhysics(),
                      //       itemCount: items.length,
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder: (ctx, index) {
                      //         return Column(
                      //           children: [
                      //             GestureDetector(
                      //               onTap: () {
                      //                 setState(() {
                      //                   current = index;
                      //                 });
                      //               },
                      //               child: AnimatedContainer(
                      //                 duration: const Duration(milliseconds: 300),
                      //                 margin: const EdgeInsets.all(5),
                      //                 width: 80,
                      //                 height: 45,
                      //                 decoration: BoxDecoration(
                      //                   color: current == index
                      //                       ? Colors.red
                      //                       : Colors.white54,
                      //                   borderRadius: current == index
                      //                       ? BorderRadius.circular(15)
                      //                       : BorderRadius.circular(10),
                      //                   border: current == index
                      //                       ? Border.all(
                      //                       color: Colors.red, width: 2)
                      //                       : null,
                      //                 ),
                      //                 child: Center(
                      //                   child: Text(
                      //                       items[index],
                      //                       style: TextStyle(
                      //                         fontWeight: FontWeight.w500,
                      //                         color: current == index
                      //                             ? Colors.white
                      //                             : Colors.grey,
                      //                       )
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         );
                      //       }),
                      // ),
                      machineScan.machineProduct.isNotEmpty?
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),

                            itemCount: machineScan.machineProduct.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                             // Provider.of<ClientsProvider>(context, listen: false).getMachineCode(context, machineScan.machineProduct[current].machineCode!,machineScan.machineProduct[current].catName!);
                              Provider.of<ClientsProvider>(context, listen: false).getMachinesProduct(context,
                                  // "cold",
                                  // "5000"
                                  "${machineScan.machineProduct[current].catName!}",
                                  "${machineScan.machineProduct[current].machineCode!}"
                                  // "${machineScan.machinesListModel!.machines![current].machineType}",
                                  // "${machineScan.machinesListModel!.machines![current].machineCode}"
                                //  "${machineScan.machinesListModel!.machines![current].orgName}",

                              );
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
                                            machineScan.machineProduct[index].catName!,
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
                      ) : Center(child:Image.asset("assets/images/notfound.png"),),
                      ///

                      GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20
                          ),
                          itemCount:machineScan.machinesProductModel.length,
                          itemBuilder: (BuildContext context, int index) {

                            return  InkWell(
                                onTap: (){
                                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsMachineScreen()));



                                  showDialog(context: context,
                                      builder: (context)=>AlertDialog(
                                        actions: [
                                          Column(
                                      crossAxisAlignment : CrossAxisAlignment.start,
                                      mainAxisAlignment : MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                  onPressed: (){
                                                    if((!Provider.of<AuthProvider>(context, listen: false).isLoading)){
                                                      Provider.of<ClientsProvider>(context, listen: false).getMachineOrder(context,
                                                        "${machineScan.machinesProductModel[index].machineId}",
                                                        "${machineScan.machinesProductModel[index].slotNum}",
                                                        "${machineScan.machinesProductModel[index].price}",
                                                        "${machineScan.machinesProductModel[index].org}",
                                                        "${machineScan.machinesProductModel[index].machineIdCloud}",
                                                        "${machineScan.machinesProductModel[index].type}",
                                                        "${machineScan.machinesProductModel[index].itemName}",);
                                                      Navigator.pop(context);
                                                    }
                                                  }, child: Row(
                                                    children: [
                                                      Icon(Icons.check,color: Colors.green,),
                                                      SizedBox(width: 15,),
                                                      Text(AppLocalizations.of(context)!.agree,style: TextStyle(
                                                color: Colors.green
                                              ),),
                                                    ],
                                                  )),
                                              TextButton(
                                                  onPressed: (){
                                                    Navigator.pop(context);
                                                  }, child: Row(
                                                    children: [
                                                      Icon(Icons.cancel,color: Colors.red,),
                                                      SizedBox(width: 15,),
                                                      Text(AppLocalizations.of(context)!.cancel,
                                                      style: TextStyle(
                                                          color: Colors.red
                                                      )
                                              ),
                                                    ],
                                                  )),
                                            ],
                                          )
                                        ],
                                      ));
                                },
                                child: Container(
                                 // alignment: Alignment.center,
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
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                      //  Image.asset("assets/images/sandwitch.png"),
                                        if(  machineScan.machineProduct[current].catName == machineScan.machinesProductModel[index].cat)
                                          CircleAvatar(
                                              child: Text("${machineScan.machinesProductModel[index].slotNum}",style: TextStyle(
                                                color: Colors.white
                                              ),),
                                          backgroundColor: Colors.red,
                                          ),
                                          SizedBox(height: 15,),
                                          if(  machineScan.machineProduct[current].catName == machineScan.machinesProductModel[index].cat)
                                        Text("${machineScan.machinesProductModel[index].itemName}"),
                                        SizedBox(height: 15,),
                                        if( machineScan.machineProduct[current].catName == machineScan.machinesProductModel[index].cat)
                                        Text("${machineScan.machinesProductModel[index].price} LE"),
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
              );
            },
          )
      ),
    );
  }
  void data(){
    //   machineScan.machineProduct[current].catName == machineScan.machineCodeScan[current].catName ?

  }
}