import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/clints_provider.dart';
import 'package:vendy_station/screens/dashboard/dashboard.dart';
import 'package:vendy_station/screens/more/profile/profile_screen.dart';

import '../../../data/model/machine_category.dart';
import '../../../provider/auth_provider.dart';
import 'client_machine_category.dart';
import 'machine_item.dart';

class MachineCompanyScreen extends StatefulWidget {
  const MachineCompanyScreen({Key? key}) : super(key: key);

  @override
  State<MachineCompanyScreen> createState() => _MachineCompanyScreenState();
}

class _MachineCompanyScreenState extends State<MachineCompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Consumer<ClientsProvider>(
           builder: (context,machinesProvider,child){
             return

               Container(
               child: Column(
                 children: [
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: InkWell(
                             onTap: (){
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
                             },
                             child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                       ),
                     ],
                   ),
                   machinesProvider.machinesListModel!.machines!.isNotEmpty ?
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ListView.separated(
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       itemCount: machinesProvider.machinesListModel!.machines!.length,
                       itemBuilder: (context,index){
                         return  Container(
                           height: 100,
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
                             child: InkWell(
                               onTap: (){

                                   // Provider.of<ClientsProvider>(context, listen: false).getMachinesProduct(context,
                                   //     "${machinesProvider.machinesListModel!.machines![index].orgName}",
                                   //     "${machinesProvider.machinesListModel!.machines![index].machineType}"
                                   // );

                                 Provider.of<ClientsProvider>(context, listen: false).getMachineProduct(context,machinesProvider.machinesListModel!.machines![index].machineCode! );
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ClientCategoryProduct()));
                               },
                               child: Row(
                                 children: [
                                   Text("${machinesProvider.machinesListModel!.machines![index].machineType}",
                                     style: TextStyle(
                                         fontSize: 24,
                                         fontWeight: FontWeight.w700
                                     ),
                                   ),
                                   Spacer(),
                                   Image.network("${machinesProvider.machinesListModel!.machines![index].image}"),
                                 ],
                               ),
                             ),
                           ),
                         );
                       },
                       separatorBuilder: (context,index){
                         return SizedBox(height: 15,);
                       },
                     ),
                   ):Center(child:Image.asset("assets/images/notfound.png"),),
              /*     if(machinesProvider.machinesListModel==null)
                   Center(child:Image.asset("assets/images/notfound.png"),),*/
                 ],
               ),
             );
           },
          ),
        ),
      ),
    );
  }
}
