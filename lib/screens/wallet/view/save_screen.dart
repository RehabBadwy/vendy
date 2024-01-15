import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/wallet_provider.dart';

import '../../../util/color_manager.dart';
import '../../home/vendy_school/request_success.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<WalletUserProvider>(context, listen: false).getSave(context);
    return Consumer<WalletUserProvider>(
      builder: (context, save, child) {
        return save.cards.isNotEmpty
            ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: Row(
                      children: [
                        if (save.cards[index].type == "MasterCard")
                          Image.asset(
                            "assets/images/mask-.png",
                            width: 40,
                          ),
                        if (save.cards[index].type == "Visa")
                          Image.asset(
                            "assets/images/visa.png",
                            width: 40,
                          ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${save.cards[index].mask}',
                              style: TextStyle(
                                  color: ColorManager.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            // SizedBox(height: 10,),
                            Text(
                              '${save.cards[index].type}',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Provider.of<WalletUserProvider>(context,
                                    listen: false)
                                .getDelete(
                              context,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Success")));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RequestSuccessScreen()));

                            setState(() {});
                          },
                          child: Text(
                            AppLocalizations.of(context)!.deletee,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(8),
                  height: 1.5,
                  color: ColorManager.lightGrey,
                ),
                itemCount: save.cards.length,
              )
            : Center(
                child: Text("Not Available Now"),
              );
      },
    );
  }
}
