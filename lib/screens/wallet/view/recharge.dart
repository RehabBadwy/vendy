import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/wallet_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../util/color_manager.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({Key? key}) : super(key: key);

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  int transaction = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Provider.of<WalletUserProvider>(context, listen: false).getWallet(context);
    Provider.of<WalletUserProvider>(context, listen: false)
        .getProcessWallet(context);

    return Consumer<WalletUserProvider>(builder: (context, walletUser, child) {
      return walletUser.walletUserModel!.wallet!.isNotEmpty
          ? Column(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Row(
                    children: [
                      Icon(
                        Icons.point_of_sale_sharp,
                        color: ColorManager.lightPrimary,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.point,
                            style: TextStyle(
                                color: ColorManager.primary, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            '${walletUser.walletUserModel!.wallet![0].pointBalance}',
                            style: TextStyle(
                                color: ColorManager.primary,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // ElevatedButton(
                      //   onPressed: (){},
                      //   style: ElevatedButton.styleFrom(
                      //       backgroundColor: ColorManager.primary
                      //   ),
                      //   child: Text(
                      //     "detailes",
                      //     style: TextStyle(
                      //         fontSize: 16,
                      //         color: ColorManager.white
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorManager.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    children: [
                      // Expanded(
                      //   child: SizedBox(
                      //     height: 50,
                      //     child: ElevatedButton(
                      //       onPressed: (){
                      //         setState(() {
                      //           transaction=0;
                      //         });
                      //       },
                      //       style: ElevatedButton.styleFrom(
                      //           elevation: 0,
                      //           shape: const RoundedRectangleBorder(
                      //               borderRadius: BorderRadiusDirectional.all(Radius.circular(20),)
                      //           ),
                      //           backgroundColor:(transaction==1)?ColorManager.grey:Colors.brown
                      //       ),
                      //       child: const Text(
                      //           "transaction"
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      ///
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                ///
                Expanded(
                  child: Consumer<WalletUserProvider>(
                    builder: (context, buyingWallet, child) {
                      return buyingWallet.processBuyingModel != null
                          ? ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return
                                    // walletUser.processBuyingModel!=null ?
                                    Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        ' ${buyingWallet.processBuyingModel!.wallet![index].dt}'),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Buying : ${buyingWallet.processBuyingModel!.wallet![index].machineId}',
                                            style: TextStyle(
                                                color: ColorManager.primary,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          '${buyingWallet.processBuyingModel!.wallet![index].price}',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) => Container(
                                margin: const EdgeInsets.all(8),
                                height: 1.5,
                                color: ColorManager.lightGrey,
                              ),
                              itemCount: buyingWallet
                                  .processBuyingModel!.wallet!.length,
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: Colors.transparent,
                              ),
                            );
                    },
                  ),
                ),
                // Expanded(
                //   child: ConditionalBuilder(
                //     condition: transaction==0,
                //     builder: (context)=>ListView.separated(
                //       physics: const BouncingScrollPhysics(),
                //      itemBuilder: (context,index)=>transactionList(),
                //       separatorBuilder: (context,index)=>Container(
                //         margin: const EdgeInsets.all(8),
                //         height: 1.5,
                //         color: ColorManager.lightGrey,
                //       ), itemCount: 1,
                //     ),
                //     fallback: (context)=> ListView.separated(
                //       physics: const BouncingScrollPhysics(),
                //       itemBuilder: (context,index)=>cardsList(index),
                //       separatorBuilder: (context,index)=>Container(
                //         margin: const EdgeInsets.all(8),
                //         height: 1.5,
                //         color: ColorManager.lightGrey,
                //       ), itemCount: walletUser.processBuyingModel!.wallet!.length,
                //     ),
                //   ),
                // ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(
                color: Colors.transparent,
              ),
            );
    });
  }

  Widget transactionList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(DateTime.now().toString()),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Recharge Wallet',
                style: TextStyle(
                    color: ColorManager.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              '+250.020EG',
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget cardsList(int index) {
    return Consumer<WalletUserProvider>(
        builder: (context, buyingWallet, child) {
      return buyingWallet.processBuyingModel!.wallet!.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(' ${buyingWallet.processBuyingModel!.wallet![index].dt}'),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Buying : ${buyingWallet.processBuyingModel!.wallet![index].machineId}',
                        style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '${buyingWallet.processBuyingModel!.wallet![index].price}',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Text("No");
    });
  }
}
