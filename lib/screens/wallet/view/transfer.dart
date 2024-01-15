// import 'package:day_picker/day_picker.dart';
// import 'package:day_picker/model/day_in_week.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/wallet_provider.dart';

import '../../../provider/auth_provider.dart';
import '../../../util/color_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  // final List<DayInWeek> _days =  [
  //   DayInWeek(
  //     "Sun", dayKey: '',
  //   ),
  //   DayInWeek(
  //     "Mon", dayKey: '',
  //   ),
  //   DayInWeek("Tue", isSelected: true, dayKey: ''),
  //   DayInWeek(
  //     "Wed", dayKey: '',
  //   ),
  //   DayInWeek(
  //     "Thu", dayKey: '',
  //   ),
  //   DayInWeek(
  //     "Fri", dayKey: '',
  //   ),
  //   DayInWeek(
  //     "Sat", dayKey: '',
  //   ),
  // ];
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  GlobalKey<FormState> _transfer = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: _transfer,
        child: Column(
          children: [
            TextFormField(
              validator: (val){
                if(val!.isEmpty){
                  return "phone Be Must";
                }
              },
              controller: _phoneController,
              decoration:  InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 3, color: Colors.brown),
                  borderRadius: BorderRadius.all(Radius.circular(20),),

                ),
                labelText: AppLocalizations.of(context)!.phone,
                hintText: AppLocalizations.of(context)!.phone,
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (val){
                if(val!.isEmpty){
                  return "amount Be Must";
                }
              },
              controller: _amountController,
              decoration:  InputDecoration(
               border: OutlineInputBorder(
                 borderSide: BorderSide(
                     width: 3, color: Colors.brown),
                 borderRadius: BorderRadius.all(Radius.circular(20),),
                //<-- SEE HERE
               ),
                labelText: AppLocalizations.of(context)!.amount,
                hintText: AppLocalizations.of(context)!.amount,
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 16,
            ),
            // Text(
            //   "everyDay",
            //   style: TextStyle(
            //     color: ColorManager.primary
            //   ),
            // ),
            // const SizedBox(
            //   height: 16,
            // ),
            // SelectWeekDays(
            //   fontSize: 14,
            //   fontWeight: FontWeight.w500,
            //   days: _days,
            //   border: false,
            //   padding: 2,
            //   boxDecoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(30.0),
            //     gradient: const LinearGradient(
            //       begin: Alignment.topLeft,
            //       colors: [Color(0xCCDC9C4A), Color(0xFFA68354)],
            //       tileMode:
            //       TileMode.repeated, // repeats the gradient over the canvas
            //     ),
            //   ),
            //   onSelect: (values) {
            //   },
            // ),
            // const SizedBox(
            //   height:16,
            // ),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                  onPressed: (){
                    if (_transfer.currentState!.validate()==true) {
                      // String phone = _phoneController.text.trim();
                      // String amount = _amountController.text.trim();
                      if((!Provider.of<AuthProvider>(context, listen: false).isLoading)){
                        Provider.of<WalletUserProvider>(context, listen: false).getTransfer(context,
                            _amountController.text,
                            _phoneController.text);
                      }
                    }



                  },
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.brown
                ),
                  child:Text(
                      AppLocalizations.of(context)!.transfer,
                    style: TextStyle(
                        color: ColorManager.white
                    ),
                  ),

              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // SizedBox(
            //   width: double.infinity,
            //   height: 55,
            //   child: ElevatedButton(
            //       onPressed: (){},
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: ColorManager.primary
            //     ),
            //       child:Text(
            //         "back",
            //         style: TextStyle(
            //             color: ColorManager.white
            //         ),
            //       ),
            //
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
