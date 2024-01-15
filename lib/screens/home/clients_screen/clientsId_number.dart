import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../base_widgit/custom_button.dart';
import '../../../base_widgit/custom_textfield.dart';
import '../../../data/datasource/remote/dio/cash.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/clints_provider.dart';
import '../../../util/constant.dart';
import 'machine_company.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ClientsIdNumberScreen extends StatefulWidget {
final  int index ;

   ClientsIdNumberScreen({Key? key,required this.index}) : super(key: key);

  @override
  State<ClientsIdNumberScreen> createState() => _ClientsIdNumberScreenState();
}

class _ClientsIdNumberScreenState extends State<ClientsIdNumberScreen> {
  final TextEditingController _idNumberController = TextEditingController();
  GlobalKey<FormState> _formKeyIdNumber = GlobalKey<FormState>();
  // final FocusNode _emailNode = FocusNode();
  // final FocusNode _passNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Consumer<ClientsProvider>(
            builder: (context,confirm,child){
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKeyIdNumber,
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
                         SizedBox(width: 20,),

                       ],
                     ),
                      SizedBox(height: 20,),
                      Text(
                        AppLocalizations.of(context)!.enter,
                        style: TextStyle(

                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.start,
                      ),

                      SizedBox(height: 20,),
                      CustomTextField(
                        hintText: AppLocalizations.of(context)!.enter,
                        textInputType: TextInputType.name,
                        // focusNode: _emailNode,
                        // nextNode: _passNode,
                        controller: _idNumberController,
                        fillColor:  Color(0xffE8ECF4),
                      ),
                      SizedBox(height: 20,),
                      CustomButton(
                        onTap: ()async{

                          if(confirm.clientCompanyModel[widget.index].companycode==_idNumberController.text){
                            Provider.of<ClientsProvider>(context, listen: false).getMachinesList(context,
                                "${confirm.clientCompanyModel[widget.index].name}",
                            //  widget.index,
                                // "${confirm.clientCompanyModel[widget.index].description}",
                                // "${confirm.clientCompanyModel[widget.index].name}"
                            );
                            Provider.of<ClientsProvider>(context,listen: false).getClientsUpdate(context,
                                "${confirm.clientCompanyModel[widget.index].name}");
                            Provider.of<ClientsProvider>(context, listen: false).getMachinesList(context,

                                "${confirm.clientCompanyModel[widget.index].name}",
                               // widget.index
                                // "${confirm.clientCompanyModel[widget.index].description}",
                                // "${confirm.clientCompanyModel[widget.index].name}"
                            );
                            CacheHelper.saveData(
                                key: 'company', value: confirm.clientCompanyModel[widget.index].companycode);
                            company = CacheHelper.getData(key: 'company');
                            print(company);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MachineCompanyScreen()));
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.wrong)));
                          }





                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>MachineCompanyScreen()));



                          // if (_formKeyIdNumber.currentState!.validate()==true) {
                          //   String email = _idNumberController.text.trim();
                          //   if (email.isEmpty) {
                          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       content: Text('ID MUST BE REQUIRED'),
                          //       backgroundColor: Colors.red,
                          //     ));
                          //   }else{
                          //     // await Provider.of<AuthProvider>(context, listen: false).forgetPassword(
                          //     //     _emailController.text.trim());
                          //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationScreen()));
                          //   }
                          // }
                        },
                        buttonText: AppLocalizations.of(context)!.confirm, ),
                      SizedBox(height: 20,),

                    ],
                  ),
                ),
              );
            },
          )
      ),
    );
  }
}
