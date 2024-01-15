import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/school_provider.dart';
import 'package:vendy_station/provider/wallet_provider.dart';

import '../../../util/color_manager.dart';


class FreezSubWalletPage extends StatefulWidget {
  const FreezSubWalletPage({Key? key}) : super(key: key);

  @override
  State<FreezSubWalletPage> createState() => _FreezSubWalletPageState();
}

class _FreezSubWalletPageState extends State<FreezSubWalletPage> {
  int transaction=0;
  @override
  Widget build(BuildContext context) {
    // Provider.of<WalletUserProvider>(context, listen: false).getWallet(context);
    // Provider.of<AddSchoolUserProvider>(context, listen: false).getStudentTransic(context);

    return Consumer<AddSchoolUserProvider>(
        builder: (context,schoolTransiction,child){
      return
        schoolTransiction.schoolTransiction!=null ?
        Column(

        children: [
        ListView.separated(
          shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return Container(
                height: 50,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${schoolTransiction.schoolTransiction!.transaction![index].item}"),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context,index){
              return SizedBox(height: 15,);
            },
            itemCount: schoolTransiction.schoolTransiction!.transaction!.length)
        ],
      ):Center(child: CircularProgressIndicator(),);
    });
  }
  // Widget transactionList(){
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         DateTime.now().toString()
  //       ),
  //       const SizedBox(height: 12,),
  //       Row(
  //         children: [
  //           Expanded(
  //             child: Text(
  //               'Recharge Wallet',
  //               style: TextStyle(
  //                 color: ColorManager.primary,
  //                 fontSize:18,
  //                 fontWeight: FontWeight.bold
  //               ),
  //             ),
  //           ),
  //           const Text(
  //             '+250.020EG',
  //             style: TextStyle(
  //               color: Colors.greenAccent,
  //               fontSize: 12,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget cardsList(int index){
  //   return Consumer<WalletUserProvider>(
  //       builder: (context,buyingWallet,child){
  //         return
  //           buyingWallet.processBuyingModel!.wallet!.isNotEmpty ?
  //           Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //                 ' ${buyingWallet.processBuyingModel!.wallet![index].dt}'
  //             ),
  //             const SizedBox(height:12,),
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: Text(
  //                     'Buying Coffee: ${buyingWallet.processBuyingModel!.wallet![index].machineId}',
  //                     style: TextStyle(
  //                         color: ColorManager.primary,
  //                         fontSize:18,
  //                         fontWeight: FontWeight.bold
  //                     ),
  //                   ),
  //                 ),
  //                  Text(
  //                   '${buyingWallet.processBuyingModel!.wallet![index].price}',
  //                   style: TextStyle(
  //                     color: Colors.red,
  //                     fontSize:12,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ):Text("No");
  //       }
  //   );
  // }

}
