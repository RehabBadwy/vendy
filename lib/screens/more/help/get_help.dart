import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GetHelp extends StatefulWidget {
  const GetHelp({Key? key}) : super(key: key);

  @override
  State<GetHelp> createState() => _GetHelpState();
}
final List<Map<String, dynamic>> category = [
  {
    "title":"What is Vendy?",
    "Answer":"Vendy is a leading online Service ,we seamlessly connect customers with their favourite,it takes just few taps from our platefrom",
  },
  {
    "title":"What does Vendy do?",
    "Answer":"We simply take your submited order and send it to the restaurant through a completely automated process,",
  },
  {
    "title":"Do you have special offer?",
    "Answer":"yes, You can view that latest promotions and discount coupon in offers",
  },
  {
    "title":"How do i place an order on Vendy?",
    "Answer":"Go to Vendy App , log in with your account, then place an order from favorite",
  },
  {
    "title":"Why should i use Vendy on a Phone?",
    "Answer":"Vendy is the one huge vendy machine,so you dont need to go through the hassle of finding machines",
  },
  {
    "title":"How can i contact Vendy.com?",
    "Answer":"You can contact us anytime through call us (we operate 24 hours) or send your feedback through the Facebook",
  },
  {
    "title":"Whom can i contact for general questions about your Company?",
    "Answer":"You can reach our customer care team for general questions through vendy.com",
  },

];
Widget _buildCartegory(cat,context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Flexible(
              child: ExpansionTile(iconColor: Theme.of(context).primaryColor,title:
              Text(cat['title']),
                leading: Icon(Icons.collections_bookmark_outlined,color:Colors.black),
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "${cat['Answer']}",
                          textAlign: TextAlign.start,
                          )
                      ),

                    ],
                  )
                ],)),
        ],
      ),

    ],);
}
class _GetHelpState extends State<GetHelp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
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
                          AppLocalizations.of(context)!.help,
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff1E232C)
                          ),
                          textAlign: TextAlign.center,
                        )),

                  ],
                ),
                SizedBox(height: 20,),
                // Expanded(
                //   child: ListView.builder(
                //       itemCount: category.length,
                //       itemBuilder: (ctx, index){
                //         return  Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             _buildCartegory(category[index], context),
                //           ],
                //         );
                //       }),
                // ),
                Row(
                  children: [
                    Flexible(
                        child: ExpansionTile(iconColor: Theme.of(context).primaryColor,title:
                        Text(AppLocalizations.of(context)!.vendyhelp),
                          leading: Icon(Icons.collections_bookmark_outlined,color:Colors.black),
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocalizations.of(context)!.vendyhelpcontent,
                                      textAlign: TextAlign.start,
                                    )
                                ),

                              ],
                            )
                          ],)),
                  ],
                ),
                ///
                Row(
                  children: [
                    Flexible(
                        child: ExpansionTile(iconColor: Theme.of(context).primaryColor,title:
                        Text(AppLocalizations.of(context)!.specialoffer),
                          leading: Icon(Icons.collections_bookmark_outlined,color:Colors.black),
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocalizations.of(context)!.specialoffercontent,
                                      textAlign: TextAlign.start,
                                    )
                                ),

                              ],
                            )
                          ],)),
                  ],
                ),
                ///
                Row(
                  children: [
                    Flexible(
                        child: ExpansionTile(iconColor: Theme.of(context).primaryColor,title:
                        Text(AppLocalizations.of(context)!.ordervendy),
                          leading: Icon(Icons.collections_bookmark_outlined,color:Colors.black),
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocalizations.of(context)!.ordervendycontent,
                                      textAlign: TextAlign.start,
                                    )
                                ),

                              ],
                            )
                          ],)),
                  ],
                ),
                ///
                Row(
                  children: [
                    Flexible(
                        child: ExpansionTile(iconColor: Theme.of(context).primaryColor,title:
                        Text(AppLocalizations.of(context)!.phonevendy),
                          leading: Icon(Icons.collections_bookmark_outlined,color:Colors.black),
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocalizations.of(context)!.phonevendycontent,
                                      textAlign: TextAlign.start,
                                    )
                                ),

                              ],
                            )
                          ],)),
                  ],
                ),
                ///
                Row(
                  children: [
                    Flexible(
                        child: ExpansionTile(iconColor: Theme.of(context).primaryColor,title:
                        Text(AppLocalizations.of(context)!.contact),
                          leading: Icon(Icons.collections_bookmark_outlined,color:Colors.black),
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocalizations.of(context)!.contactcontent,
                                      textAlign: TextAlign.start,
                                    )
                                ),

                              ],
                            )
                          ],)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}