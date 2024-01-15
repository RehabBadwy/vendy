import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/add_link_provider.dart';

import '../../../../util/color_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OrderNowScreen extends StatefulWidget {
  const OrderNowScreen({Key? key}) : super(key: key);

  @override
  State<OrderNowScreen> createState() => _OrderNowScreenState();
}

class _OrderNowScreenState extends State<OrderNowScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _creditTypeController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        AppLocalizations.of(context)!.now,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff1E232C)
                        ),
                        textAlign: TextAlign.center,
                      )),

                ],
              ),
              SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Form(
                 key: _formKey,
                 child: Column(
                   children: [
                     TextFormField(
                       controller: _nameController,
                       decoration:  InputDecoration(
                         border: OutlineInputBorder(
                           borderSide: BorderSide(
                               width: 3, color: Colors.brown),
                           borderRadius: BorderRadius.all(Radius.circular(20),),
                           //<-- SEE HERE
                         ),
                         labelText: AppLocalizations.of(context)!.name,
                         hintText: AppLocalizations.of(context)!.name,
                       ),
                       keyboardType: TextInputType.name,
                     ),
                     const SizedBox(
                       height: 16,
                     ),
                     TextFormField(
                       controller: _emailController,
                       decoration:  InputDecoration(
                         border: OutlineInputBorder(
                           borderSide: BorderSide(
                               width: 3, color: Colors.brown),
                           borderRadius: BorderRadius.all(Radius.circular(20),),
                           //<-- SEE HERE
                         ),
                         labelText: AppLocalizations.of(context)!.email,
                         hintText: AppLocalizations.of(context)!.email,
                       ),
                       keyboardType: TextInputType.name,
                     ),
                     const SizedBox(
                       height: 16,
                     ),
                     TextFormField(
                       controller: _phoneController,
                       decoration:  InputDecoration(
                         border: OutlineInputBorder(
                           borderSide: BorderSide(
                               width: 3, color: Colors.brown),
                           borderRadius: BorderRadius.all(Radius.circular(20),),

                         ),
                         labelText: AppLocalizations.of(context)!.phone,
                         hintText: "${AppLocalizations.of(context)!.phone}",
                       ),
                       keyboardType: TextInputType.phone,
                     ),
                     const SizedBox(
                       height: 16,
                     ),
                     TextFormField(
                       controller: _addressController,
                       decoration:  InputDecoration(
                         border: OutlineInputBorder(
                           borderSide: BorderSide(
                               width: 3, color: Colors.brown),
                           borderRadius: BorderRadius.all(Radius.circular(20),),
                           //<-- SEE HERE
                         ),
                         labelText: AppLocalizations.of(context)!.address,
                         hintText: AppLocalizations.of(context)!.address,
                       ),
                       keyboardType: TextInputType.name,
                     ),
                     const SizedBox(
                       height: 16,
                     ),
                     TextFormField(
                       controller: _creditTypeController,
                       decoration:  InputDecoration(
                         border: OutlineInputBorder(
                           borderSide: BorderSide(
                               width: 3, color: Colors.brown),
                           borderRadius: BorderRadius.all(Radius.circular(20),),
                           //<-- SEE HERE
                         ),
                         labelText: AppLocalizations.of(context)!.credit,
                         hintText: AppLocalizations.of(context)!.credit,
                       ),
                       keyboardType: TextInputType.name,
                     ),
                     const SizedBox(
                       height:16,
                     ),
                     SizedBox(
                       width: double.infinity,
                       height: 55,
                       child: ElevatedButton(
                         onPressed: (){
                           if (_formKey.currentState!.validate()==true) {
                             String email = _emailController.text.trim();
                             String phone = _phoneController.text.trim();
                             String name = _nameController.text.trim();
                             String address = _addressController.text.trim();
                             String credit = _creditTypeController.text.trim();
                             if (email.isEmpty) {
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                 content: Text('EMAIL_MUST_BE_REQUIRED'),
                                 backgroundColor: Colors.red,
                               ));
                             } else if (phone.isEmpty) {
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                 content: Text('phone_MUST_BE_REQUIRED'),
                                 backgroundColor: Colors.red,
                               ));
                             }else if(name.isEmpty){
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                 content: Text('name_MUST_BE_REQUIRED'),
                                 backgroundColor: Colors.red,
                               ));
                             }else if(address.isEmpty){
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                 content: Text('address_MUST_BE_REQUIRED'),
                                 backgroundColor: Colors.red,
                               ));
                             }else if(credit.isEmpty){
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                 content: Text('credit_MUST_BE_REQUIRED'),
                                 backgroundColor: Colors.red,
                               ));
                             }
                             else {
                               Provider.of<AddLinkProvider>(context, listen: false).getVTouchOrder(context,
                                   _nameController.text.trim(),
                                   _phoneController.text.trim(),
                                   _emailController.text.trim(),
                                   _addressController.text.trim(),
                                   _creditTypeController.text.trim());
                             }
                           }
                         },
                         style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.brown
                         ),
                         child:Text(
                           AppLocalizations.of(context)!.create,
                           style: TextStyle(
                               color: ColorManager.white
                           ),
                         ),

                       ),
                     ),
                   ],
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
