import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../base_widgit/custom_button.dart';
import '../../../data/datasource/remote/dio/cash.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/clints_provider.dart';
import '../../../provider/clints_provider.dart';
import '../../../provider/clints_provider.dart';
import '../../../util/constant.dart';
import 'clientsId_number.dart';
import 'machine_company.dart';

class ClientsScreen extends StatefulWidget {
 final int index;

   ClientsScreen({Key? key,required this.index}) : super(key: key);

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  @override
  Widget build(BuildContext context) {
     var mdw = MediaQuery.of(context).size.width;
  var  mdh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Consumer<ClientsProvider>(
            builder: (context,clientProvider,child){
              return
                clientProvider.machinesListModel!=null ?
                Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Image.asset("assets/images/back.png",width: 40,height: 40,)),

                      ),
                      SizedBox(width: 20,),
                      Text(AppLocalizations.of(context)!.profile,
                      style: TextStyle(
                        fontSize: 16
                      ),
                      )
                    ],
              ),
                  // Center(
                  //   child:  CircleAvatar(
                  //       radius: 50,
                  //       child: Image.network("${clientProvider.machinesListModel!.machines![0].image}"))
                  // ),
                  // Text("${clientProvider.machinesListModel!.machines![widget.index].orgName}",
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.w700,
                  //       fontSize: 32
                  //   ),
                  // ),
                 // Divider(),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [

                     Padding(
                       padding: const EdgeInsets.only(left: 0,right: 0),
                       child: Column(
                         children: [


Stack(
                  children: [
                    Container(
                        height: mdh / 4,
                        width: mdw,
                        // margin: EdgeInsets.only(top: 30),
                        child: Image.network(
                          "${clientProvider.clientCompanyModel[widget.index].backimage}",
                          fit: BoxFit.fill,
                        )),
                    Container(
                      height: mdh / 4,
                      width: mdw,
                      color: Color.fromARGB(150, 14, 62, 66),
                      // margin: EdgeInsets.only(top: 30),
                    ),
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(top: mdh / 5.2),
                          width: 90,
                          height: 90,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage("${clientProvider.clientCompanyModel[widget.index].image}"),
                              ))),
                    ),
                   
                  ],
                ),


                           Padding(
                             padding: const EdgeInsets.only(right: 15,left: 15,bottom: 15),
                             child: Text(
                               textAlign: TextAlign.start,
                              "${clientProvider.clientCompanyModel[widget.index].name}",
                              // AppLocalizations.of(context)!.profile,
                               style:  TextStyle(
                                   fontSize: 15,
                                   color:  Colors.red
                               ),
                             ),
                           ),
                           SizedBox(height: 15,),
                           Text(
                             "${clientProvider.clientCompanyModel[widget.index].description}",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                                 fontWeight: FontWeight.w300,
                                 fontSize: 14,
                                 color: Color(0xff8391A1),
                                 
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),

                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: CustomButton(
                      onTap: (){
                        // if((!Provider.of<AuthProvider>(context, listen: false).isLoading)){
                        //   Provider.of<ClientsProvider>(context, listen: false).getMachinesList(context,
                        //       "${clientProvider.clientCompanyModel[widget.index].name}");
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>MachineCompanyScreen()));
                        // }

                        if(company==clientProvider.clientCompanyModel[widget.index].companycode){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MachineCompanyScreen()));

                        }else{
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ClientsIdNumberScreen(index: widget.index)));

                        }


                      },

                      buttonText: AppLocalizations.of(context)!.offer, ),
                  ),

                ],
              ):Center(child: CircularProgressIndicator(color: Colors.transparent,));
            },
          ),
        ),
      ),
    );
  }
}
