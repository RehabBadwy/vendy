import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendy_station/screens/payment/payment/ref_code_screen.dart';
import 'package:vendy_station/screens/payment/payment/visa_screen.dart';
import 'package:vendy_station/util/image.dart';


import '../../../util/component_screen.dart';
import '../payment_screen.dart';
import '../widgets/show_snack.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: SafeArea(
        child: BlocConsumer<PaymentCubit, PaymentStates>(
          listener: (context, state) {
            if (state is PaymentWalletSuccessStates) {
              showSnackBar(
                context: context,
                text: "Success wallet ",
                color: Colors.amber.shade400,
              );
             navigateAndFinish(context, const ReferenceScreen());
            // navigateAndFinish(context, const VisaScreenWallet());
            }
            if (state is PaymentWalletErrorStates) {
              showSnackBar(
                context: context,
                text: "Error get ref code ",
                color: Colors.red,
              );
            }
          },
          builder: (context, state) {
            var cubit = PaymentCubit.get(context);
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Expanded(
                    //   child: InkWell(
                    //     onTap: () {
                    //       cubit.wallet();
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
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          navigateAndFinish(context, const VisaScreen());
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.black, width: 2.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Image(
                                image: NetworkImage(Images.visaImage),
                              ),
                              Text(
                                'Payment with visa',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
