import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/clints_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MachineProductCategory extends StatefulWidget {
  const MachineProductCategory({Key? key}) : super(key: key);

  @override
  State<MachineProductCategory> createState() => _MachineProductCategoryState();
}

class _MachineProductCategoryState extends State<MachineProductCategory> {
  int current = 0;
  @override

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
  //  Provider.of<ClientsProvider>(context, listen: false).getMachineCode(context, "1000","${current}");

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
                                  AppLocalizations.of(context)!.machinescan,
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
                              Provider.of<ClientsProvider>(context, listen: false).getMachineCode(context, machineScan.machineProduct[current].machineCode!,machineScan.machineProduct[current].catName!);

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
                      machineScan.machineCodeScan.isNotEmpty?

                      ListView.separated(

                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            machineScan.machineProduct[current].catName! == machineScan.machineCodeScan[index].catName;
                            return Container(
                              height: 100,
                              //height/8,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffEDEDED),
                                    spreadRadius: 1,
                                    blurRadius: 15,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                InkWell(
                                  onTap: (){
                                    if(machineScan.machineCodeScan[index].system=="bt"){
                                      Provider.of<ClientsProvider>(context, listen: false).getDispenseProduct(context,
                                          machineScan.machineCodeScan[index].machineId!,
                                          machineScan.machineCodeScan[index].machineName!,
                                          machineScan.machineCodeScan[index].machineType!,
                                          machineScan.machineCodeScan[index].slotNumber!,
                                          machineScan.machineCodeScan[index].price!,
                                          machineScan.machineCodeScan[index].org!,
                                          machineScan.machineCodeScan[index].machineCode!,
                                          machineScan.machineCodeScan[index].itemName!,
                                          machineScan.machineCodeScan[index].catName!,
                                          machineScan.machineCodeScan[index].btItemCode!,
                                          machineScan.machineCodeScan[index].mac!);
                                    }else if(machineScan.machineCodeScan[index].system!="bt"){
                                      Provider.of<ClientsProvider>(context, listen: false).getDispenseProduct(context,
                                          machineScan.machineCodeScan[index].machineId!,
                                          machineScan.machineCodeScan[index].machineName!,
                                          machineScan.machineCodeScan[index].machineType!,
                                          machineScan.machineCodeScan[index].slotNumber!,
                                          machineScan.machineCodeScan[index].price!,
                                          machineScan.machineCodeScan[index].org!,
                                          machineScan.machineCodeScan[index].machineCode!,
                                          machineScan.machineCodeScan[index].itemName!,
                                          machineScan.machineCodeScan[index].catName!,
                                          machineScan.machineCodeScan[index].btItemCode!,
                                          machineScan.machineCodeScan[index].mac!);
                                      showDialog(context: context,
                                          builder:(context)=> AlertDialog(
                                            content: Text(AppLocalizations.of(context)!.customer),

                                            actions: [
                                              TextButton(
                                                  onPressed: (){
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(AppLocalizations.of(context)!.agree,))
                                            ],
                                          ));
                                    }


                                    print("object");
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                         if( machineScan.machineProduct[current].catName == machineScan.machineCodeScan[index].catName)
                                      Text(machineScan.machineCodeScan[index].itemName!),
                                      SizedBox(height: 15,),
                                      if( machineScan.machineProduct[current].catName == machineScan.machineCodeScan[index].catName)
                                      Text("Price ${machineScan.machineCodeScan[index].price}"),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context,index){
                            return SizedBox(height: 15,);
                          },
                          itemCount:
                        //  machineScan.machineProduct[current].catName == machineScan.machineCodeScan[current].catName ?
                          machineScan.machineCodeScan.length
                              //:0

                      ):Center(child: CircularProgressIndicator(color: Colors.transparent,),)

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