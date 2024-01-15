import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendy_station/screens/payment/payment/ref_code_screen.dart';
import 'package:vendy_station/screens/payment/payment/visa_screen.dart';
import 'package:vendy_station/util/image.dart';


import '../../../util/component_screen.dart';
import '../payment/cubit/cubit.dart';
import '../payment/cubit/state.dart';
import '../payment_screen.dart';
import '../widgets/show_snack.dart';


class ToggleWalletScreen extends StatelessWidget {
  const ToggleWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: SafeArea(
        child: BlocConsumer<PaymentCubit, PaymentStates>(
          listener: (context, state) {
            if (state is PaymentWalletSuccessStates) {
              // showSnackBar(
              //   context: context,
              //   text: "Success wallet ",
              //   color: Colors.amber.shade400,
              // );
            //  navigateAndFinish(context, const ReferenceScreen());
              navigateAndFinish(context, const VisaScreenWallet());
            }
            if (state is PaymentWalletErrorStates) {
              // showSnackBar(
              //   context: context,
              //   text: "Error get ref code ",
              //   color: Colors.red,
              // );
            }
          },
          builder: (context, state) {
            var cubit = PaymentCubit.get(context);
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: (){
                    navigateAndFinish(context, const VisaScreenWallet());

                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image.asset("assets/images/payn.gif")
                      // Row(
                      //   children: [
                      //     InkWell(
                      //         onTap: (){
                      //           Navigator.pop(context);
                      //         },
                      //         child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                      //     SizedBox(width: 30,),
                      //     Center(
                      //         child: Text(
                      //           "wallet",
                      //           style: TextStyle(
                      //               fontSize: 30,
                      //               color: Color(0xff1E232C)
                      //           ),
                      //           textAlign: TextAlign.center,
                      //         )),
                      //
                      //   ],
                      // ),
                      // SizedBox(height: 20,),
                      // Expanded(
                      //   child: InkWell(
                      //     onTap: () {
                      //   //    cubit.walletUrl(walletNumber);
                      //       navigateTo(context, const VisaScreenWallet());
                      //     },
                      //     child: Container(
                      //       width: double.infinity,
                      //       decoration: BoxDecoration(
                      //         color: Colors.black12,
                      //         borderRadius: BorderRadius.circular(15.0),
                      //         border:
                      //             Border.all(color: Colors.black87, width: 2.0),
                      //       ),
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: const [
                      //           Image(
                      //             image: NetworkImage(Images.refCodeImage),
                      //           ),
                      //           SizedBox(height: 15.0),
                      //           Text(
                      //             'Payment wallet',
                      //             style: TextStyle(
                      //               fontSize: 20.0,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 20.0),
                      ///
                      // Expanded(
                      //   child: InkWell(
                      //     onTap: () {
                      //       navigateAndFinish(context, const VisaScreen());
                      //     },
                      //     child: Container(
                      //       width: double.infinity,
                      //       decoration: BoxDecoration(
                      //         color: Colors.black12,
                      //         borderRadius: BorderRadius.circular(15.0),
                      //         border: Border.all(color: Colors.black, width: 2.0),
                      //       ),
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: const [
                      //           Image(
                      //             image: NetworkImage(Images.visaImage),
                      //           ),
                      //           Text(
                      //             'Payment with visa',
                      //             style: TextStyle(
                      //               fontSize: 20.0,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
