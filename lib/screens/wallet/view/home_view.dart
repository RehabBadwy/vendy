import 'package:barcode_widget/barcode_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/wallet_provider.dart';
import 'package:vendy_station/screens/dashboard/dashboard.dart';
import 'package:vendy_station/screens/wallet/view/recharge.dart';
import 'package:vendy_station/screens/wallet/view/save_screen.dart';
import 'package:vendy_station/screens/wallet/view/sub_wallet.dart';
import 'package:vendy_station/screens/wallet/view/transfer.dart';
import 'package:vendy_station/util/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../util/color_manager.dart';
import '../../../util/fonts_manager.dart';
import '../../home/home.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  List<Widget> screenList = const [
    RechargePage(),
    TransferPage(),
    SubWalletPage(),
    SaveScreen(),
  ];
  List<bool> screenState = [true, false, false];
  int screenIndex = 0;
  void changeScreen({required int index}) {
    screenIndex = index;
    for (int i = 0; i < 3; i++) {
      (i == index) ? screenState[i] = true : screenState[i] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<WalletUserProvider>(context, listen: false).getWallet(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Consumer<WalletUserProvider>(
              builder: (context, walletUser, child) {
                return walletUser.walletUserModel != null
                    ? Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DashboardScreen()));
                                  //  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  "assets/images/back.png",
                                  width: 40,
                                  height: 40,
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  color: ColorManager.primary),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .balance,
                                              style: TextStyle(
                                                  color: ColorManager.white,
                                                  fontSize: FontSize.s16),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              '${walletUser.walletUserModel!.wallet![0].walletBalance} EGP',
                                              style: TextStyle(
                                                  color: ColorManager.white,
                                                  fontSize: FontSize.s16),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .phone,
                                              style: TextStyle(
                                                  color: ColorManager.white,
                                                  fontSize: FontSize.s16),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              userPhone!,
                                              style: TextStyle(
                                                  color: ColorManager.grey,
                                                  fontSize: FontSize.s16),
                                            ),
                                          ],
                                        ),
                                        BarcodeWidget(
                                            padding: EdgeInsets.all(8),
                                            data: 'vendystation',
                                            barcode: Barcode.qrCode(),
                                            height: 70,
                                            width: 70,
                                            backgroundColor:
                                                ColorManager.brown,
                                            color: ColorManager.white),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
/////////////////////////////////////////

                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {});
                                              changeScreen(index: 1);
                                            },
                                            style: (screenIndex != 1)
                                                ? ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    side: BorderSide(
                                                      color: ColorManager.white,
                                                      width: 1,
                                                    ),
                                                    backgroundColor:
                                                        ColorManager.primary)
                                                : ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    side: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    backgroundColor:
                                                    ColorManager.brown),
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .transfer,
                                              style: TextStyle(
                                                  color: ColorManager.white,
                                                  fontSize: 11),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {});
                                              changeScreen(index: 2);
                                            },
                                            style: (screenIndex != 2)
                                                ? ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    side: BorderSide(
                                                      color: ColorManager.white,
                                                      width: 1,
                                                    ),
                                                    backgroundColor:
                                                        ColorManager.primary)
                                                : ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    side: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    backgroundColor:
                                                    ColorManager.brown),
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .charge,
                                              style: TextStyle(
                                                  color: ColorManager.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    ///

                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {});
                                              changeScreen(index: 0);
                                            },
                                            style: (screenIndex != 0)
                                                ? ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    side: BorderSide(
                                                      color: ColorManager.white,
                                                      width: 1,
                                                    ),
                                                    backgroundColor:
                                                        ColorManager.primary)
                                                : ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    side: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    backgroundColor:
                                                    ColorManager.brown),
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .transaction,
                                              style: TextStyle(
                                                  color: ColorManager.white,
                                                  fontSize: FontSize.s12),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {});
                                              changeScreen(index: 3);
                                            },
                                            style: (screenIndex != 3)
                                                ? ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    side: BorderSide(
                                                      color: ColorManager.white,
                                                      width: 1,
                                                    ),
                                                    backgroundColor:
                                                        ColorManager.primary)
                                                : ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    side: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    backgroundColor:
                                                    ColorManager.brown),
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .cards,
                                              style: TextStyle(
                                                  color: ColorManager.white,
                                                  fontSize: FontSize.s12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Expanded(child: screenList[screenIndex]),
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            )),
      ),
    );
  }
}
