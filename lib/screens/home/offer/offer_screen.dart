import 'package:flutter/material.dart';

import '../../../util/dimensions.dart';
import '../../../util/image.dart';
import 'details_offer.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}
final List<Map<String, dynamic>> category = [
  {
    'image': 'assets/images/chipcy.png',
  },
  {
    'image': 'assets/images/dunkin.png',
  },
  {
    'image': 'assets/images/keme.png',
  },
  {
    'image': 'assets/images/kfc.png',
  },


  {
    'image': 'assets/images/pepsi.png',
  },
  {
    'image': 'assets/images/starbucks.png',
  },
  {
    'image': 'assets/images/tiger.png',
  },
  {
    'image': 'assets/images/burger.png',
  },


];
Widget _buildCartegory(Map<String, dynamic> cat,context) {

  return Container(
    // width: 130,
    // height: 130,
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color(0xffEDEDED),
          spreadRadius: 1,
          blurRadius: 15,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Container(
      child:Image.asset(cat['image']),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
    ),
  );
}
class _OfferScreenState extends State<OfferScreen> {

  List<String> items = [
    "Today's discount",
    "highest discount",
    "Offer Product",
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   children: [
                     InkWell(
                         onTap: (){
                           Navigator.pop(context);
                         },
                         child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                     SizedBox(width: 10,),
                     Expanded(
                       child: Container(
                         /*padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.homePagePadding, vertical: Dimensions.paddingSizeSmall),*/

                         alignment: Alignment.center,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                             border: Border.all(color: Color(0xffE8ECF4))
                         ),
                         child: Container(
                           padding: EdgeInsets.only(
                             left: Dimensions.homePagePadding, right: Dimensions.paddingSizeExtraSmall,
                             top: Dimensions.paddingSizeExtraSmall, bottom: Dimensions.paddingSizeExtraSmall,
                           ),

                           height: 40, alignment: Alignment.centerLeft,
                           decoration: BoxDecoration(

                             color: Theme.of(context).cardColor,
                             /* boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ?
                              900 : 200]!, spreadRadius: 1, blurRadius: 1)],*/
                             borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),),
                           child: Row(mainAxisAlignment : MainAxisAlignment.spaceBetween, children: [

                             Text('Coffee Vending machines',
                                 style: TextStyle(
                                     color: Colors.grey
                                 )),

                             Container(
                               width: 20,height: 20,decoration:
                             BoxDecoration(

                                 borderRadius: BorderRadius.all(Radius.circular(Dimensions.paddingSizeExtraSmall))
                             ),
                               child: Icon(Icons.search,
                                   color: Color(0xffE8ECF4),
                                   size: Dimensions.ICON_SIZE_SMALL),
                             ),
                           ]),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   width: 300,
                   /*padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.homePagePadding, vertical: Dimensions.paddingSizeSmall),*/

                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                       border: Border.all(color: Color(0xffE8ECF4))
                   ),
                   child: Container(

                       padding: EdgeInsets.only(
                         left: Dimensions.homePagePadding, right: Dimensions.paddingSizeExtraSmall,
                         top: Dimensions.paddingSizeExtraSmall, bottom: Dimensions.paddingSizeExtraSmall,
                       ),

                       height: 40,
                       alignment: Alignment.centerLeft,
                       decoration: BoxDecoration(

                         color: Colors.black,
                         /* boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ?
                                900 : 200]!, spreadRadius: 1, blurRadius: 1)],*/
                         borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Image.asset(Images.camera),
                           SizedBox(width: 10,),
                           Text(
                             "View nearby vending machines",
                             style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.w400,
                                 fontSize: 14
                             ),
                           ),
                         ],
                       )
                   ),
                 ),
               ),
               SizedBox(
                 height: 60,
                 child: ListView.builder(
                     shrinkWrap: true,
                     physics: const ScrollPhysics(),
                     itemCount: items.length,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (ctx, index) {
                       return Column(
                         children: [
                           GestureDetector(
                             onTap: () {
                               setState(() {
                                 current = index;
                               });
                             },
                             child: AnimatedContainer(
                               duration: const Duration(milliseconds: 300),
                               margin: const EdgeInsets.all(5),
                               width: 130,
                               height: 45,
                               decoration: BoxDecoration(
                                 color: current == index
                                     ? Colors.white
                                     : Colors.white54,
                                 borderRadius: current == index
                                     ? BorderRadius.circular(15)
                                     : BorderRadius.circular(10),
                                 border:
                                 current == index?
                                 Border.all(
                                     color: Color(0xff1E232C), width: 2)
                                    :  Border.all(
                                     color: Colors.grey, width: 2),
                               ),
                               child: Center(
                                 child: Text(
                                     items[index],
                                     style: TextStyle(
                                       fontWeight: FontWeight.w500,
                                       color: current == index
                                           ? Color(0xff000000)
                                           : Colors.grey,
                                     )
                                 ),
                               ),
                             ),
                           ),
                         ],
                       );
                     }),
               ),
               GridView.builder(
                   shrinkWrap: true,
                   physics: NeverScrollableScrollPhysics(),
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       mainAxisSpacing: 20,
                       crossAxisSpacing: 20,
                     mainAxisExtent: 130
                   ),
                   itemCount: 8,
                   itemBuilder: (BuildContext context, int index) {
                     return  InkWell(
                         onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsOfferScreen()));
                         },
                         child: _buildCartegory(category[index], context));
                   }
               ),
             ],
           ),
          ),
        ),
      ),
    );
  }
}
