import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendy_station/screens/payment/register/toggle_wallet.dart';
import 'package:vendy_station/util/constant.dart';


import '../../../util/component_screen.dart';
import '../payment/cubit/cubit.dart';
import '../payment/cubit/state.dart';
import '../payment/toggle_screen.dart';
import '../payment/visa_screen.dart';
import '../widgets/default_button.dart';
import '../widgets/default_textformfiled.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/show_snack.dart';

class WaletCachPayment extends StatefulWidget {
  WaletCachPayment({Key? key}) : super(key: key);

  @override
  State<WaletCachPayment> createState() => _WaletCachPaymentState();
}

class _WaletCachPaymentState extends State<WaletCachPayment> {
  TextEditingController walletController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => PaymentCubit()..getAuthToken(),
          child:  BlocConsumer<PaymentCubit, PaymentStates>(
            listener: (context, state) {
              if (state is PaymentRequestWalletTokenSuccessStates) {
                // showSnackBar(
                //   context: context,
                //   text: 'Success get final token',
                //   color: Colors.green,
                // );
              //  Image.asset("assets/payn.gif");
                print("object");

             //  navigateTo(context,  ToggleWalletScreen());
               navigateTo(context,  VisaScreenWallet());

              }
            },
            builder: (context, state) {
              var cubit = PaymentCubit.get(context);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                AppLocalizations.of(context)!.wallet,
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xff1E232C)
                                ),
                                textAlign: TextAlign.center,
                              )),

                        ],
                      ),
                      SizedBox(height: 20,),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: DefaultTextFormFiled(
                            //         controller: firstNameController,
                            //         type: TextInputType.name,
                            //         hintText: 'First name',
                            //         prefix: Icons.person,
                            //         validate: (String? value) {
                            //           if (value!.isEmpty) {
                            //             return 'Please enter your first name!';
                            //           }
                            //           return null;
                            //         },
                            //       ),
                            //     ),
                            //     const SizedBox(width: 10),
                            //     Expanded(
                            //       child: DefaultTextFormFiled(
                            //         controller: lastNameController,
                            //         validate: (String? value) {
                            //           if (value!.isEmpty) {
                            //             return 'Please enter your last name !';
                            //           }
                            //           return null;
                            //         },
                            //         type: TextInputType.name,
                            //         hintText: 'Last name',
                            //         prefix: Icons.person,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // const SizedBox(height: 10),
                            // DefaultTextFormFiled(
                            //   controller: emailController,
                            //   validate: (String? value) {
                            //     if (value!.isEmpty) {
                            //       return 'Please enter your email  !';
                            //     }
                            //     return null;
                            //   },
                            //   type: TextInputType.emailAddress,
                            //   hintText: 'Email',
                            //   prefix: Icons.email,
                            // ),
                            // const SizedBox(height: 10),
                            DefaultTextFormFiled(
                              controller: walletController,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return AppLocalizations.of(context)!.phonemust;
                                }
                                return null;
                              },
                              type: TextInputType.number,
                              hintText: AppLocalizations.of(context)!.phone,
                              prefix: Icons.phone,
                            ),
                            const SizedBox(height: 10),
                            ///
                            DefaultTextFormFiled(
                              controller: priceController,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return AppLocalizations.of(context)!.amountmust;
                                }
                                return null;
                              },
                              type: TextInputType.number,
                              hintText: AppLocalizations.of(context)!.amount,
                              prefix: Icons.monetization_on,
                            ),
                            const SizedBox(height: 20),
                            DefaultButton(
                              buttonWidget:
                              state is! PaymentRequestTokenLoadingStates
                                  ?  Text(
                                AppLocalizations.of(context)!.pay,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  letterSpacing: 1.6,
                                ),
                              )
                                  : const Center(
                                child: CircularProgressIndicator(),
                              ),
                              function: () {
                                 if (_formKey.currentState!.validate()) {
                                   cubit.getOrderWalletRegistrationID(
                                       walletNumber: walletController.text,
                                       // firstName: firstNameController.text,
                                       // lastName: lastNameController.text,
                                       // email: emailController.text,
                                       // phone: phoneController.text,
                                       price: (int.parse(priceController.text) * 100).toString()
                                   );
                                 }
                              },
                              width: MediaQuery.of(context).size.width,
                              radius: 10.0,
                              backgroundColor: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
