import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/home/vendy_school/machine_item_school.dart';
import 'package:vendy_station/screens/wallet/sub_wallet/home_sub_wallet_view.dart';

import '../../../provider/school_provider.dart';

class MachineSchool extends StatefulWidget {
  // final String schoolName;
  // final String schoolId;
  const MachineSchool({Key? key/*,required this.schoolName*//*,required this.schoolId*/}) : super(key: key);

  @override
  State<MachineSchool> createState() => _MachineSchoolState();
}

class _MachineSchoolState extends State<MachineSchool> {
  @override
  Widget build(BuildContext context) {
   // Provider.of<AddSchoolUserProvider>(context, listen: false).getMachinesSchool(context, widget.schoolName, widget.schoolId);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<AddSchoolUserProvider>(
            builder: (context,machine,child){
              return machine.machinesSchool!.machines!=null?
                Column(
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
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.network(
                            "${machine.schoolListModel!.schools![0].logo}"
                            ,width: 150,height: 150,
                            fit:BoxFit.scaleDown
                        ),
                      ),
                      Text("${machine.schoolListModel!.schools![0].schoolName}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("Machines",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: machine.machinesSchool!.machines!.length,
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
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>MachineItemSchool()));
                              ///
                                //   Provider.of<AddSchoolUserProvider>(context, listen: false).getStudentTransic(context,
                              //       machine.machinesSchool!.machines![index].id!,
                              //       machine.machinesSchool!.machines![index].schoolId!);
                              //   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeSubWalletView()));
                              },
                              child: Row(
                                children: [
                                  Text( machine.machinesSchool!.machines![index].machineType!,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Spacer(),
                                  Image.asset("assets/images/machine.png"),

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
                  )
                ],
              ):Center(child: CircularProgressIndicator(),);
            },
          )
        ),
      ),
    );
  }
} 
