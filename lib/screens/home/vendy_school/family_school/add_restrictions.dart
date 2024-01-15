import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/school_provider.dart';

class AddRestrictions extends StatefulWidget {
  const AddRestrictions({Key? key}) : super(key: key);

  @override
  State<AddRestrictions> createState() => _AddRestrictionsState();
}

class _AddRestrictionsState extends State<AddRestrictions> {

  bool _light = false;

  @override
  Widget build(BuildContext context) {
    Provider.of<AddSchoolUserProvider>(context, listen: false).getSchoolProductList(context);
    Provider.of<AddSchoolUserProvider>(context, listen: false).getPreviewMyFamily(context);


    return Scaffold(
      body: SafeArea(
        child:Consumer<AddSchoolUserProvider>(
          builder: (context,product,child){
            return product.schoolProductList!=null?
              Padding(
              padding: const EdgeInsets.all(12),
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
                            "AddRestrictions",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xff1E232C)
                            ),
                            textAlign: TextAlign.center,
                          )),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: ListView.builder(

                        itemCount: product.schoolProductList!.products!.length,
                        itemBuilder: (ctx, index){
                          return  Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Flexible(
                                        child: ExpansionTile(iconColor: Theme.of(context).primaryColor,title:
                                        Text("${product.schoolProductList!.products![index].itemName}"),
                                          leading: Icon(Icons.collections_bookmark_outlined,color:Colors.black),
                                          children: <Widget>[
                                            Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: (){

                                                  },
                                                  child: Column(

                                                    children: [
                                                      Row(
                                                        children: [
                                                         ClipRRect(
                                                             borderRadius: BorderRadius.only(
                                                               topLeft: Radius.circular(8.0),
                                                               topRight: Radius.circular(8.0),
                                                             ),
                                                             child: Image.network(
                                                               fit:BoxFit.fill,
                                                               "${product.schoolProductList!.products![index].image}",scale: 20,)),
                                                          SizedBox(width: 12,),
                                                          Row(
                                                            crossAxisAlignment:CrossAxisAlignment.start,
                                                            children: [
                                                              Text("${product.schoolProductList!.products![index].itemCat}",
                                                                style: TextStyle(color: Colors.black),
                                                              ),
                                                            ],
                                                          ),
                                                          Spacer(),
                                                          // Switch.adaptive(
                                                          //     activeColor: Colors.green,
                                                          //     value: _light,
                                                          //     onChanged: (bool value){
                                                          //       setState(() {
                                                          //              _light=value;
                                                          //         value==
                                                          //               Provider.of<AddSchoolUserProvider>(context, listen: false).getForbidden(context,
                                                          //                   product.schoolProductList!.products![index].itemCode!,
                                                          //                   product.schoolProductList!.products![index].itemCat!,
                                                          //                   product.schoolProductList!.products![index].itemName!,
                                                          //                   product.previewMyFamily!.myfamily![0].studentId!,
                                                          //                   product.previewMyFamily!.myfamily![0].schoolId!);
                                                          //               print("object");
                                                          //       });
                                                          //     })
                                                          ///
                                                          ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: Colors.green
                                                              ),
                                                              onPressed: (){
                                                                Provider.of<AddSchoolUserProvider>(context, listen: false).getAllow(
                                                                    product.schoolProductList!.products![index].itemCode!,
                                                                    context,
                                                                    product.previewMyFamily!.myfamily![0].studentId!
                                                                );
                                                                print("object");

                                                              }, child: Text("Allow")),
                                                          SizedBox(width: 15,),
                                                          ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  backgroundColor: Colors.red
                                                              ),
                                                              onPressed: (){
                                                                Provider.of<AddSchoolUserProvider>(context, listen: false).getForbidden(context,
                                                                    product.schoolProductList!.products![index].itemCode!,
                                                                    product.schoolProductList!.products![index].itemCat!,
                                                                    product.schoolProductList!.products![index].itemName!,
                                                                    product.previewMyFamily!.myfamily![0].studentId!,
                                                                    product.previewMyFamily!.myfamily![0].schoolId!);
                                                                print("object");
                                                              }, child: Text("NOT ALLOW")),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                            )
                                          ],)),
                                  ],
                                ),
                              ),

                            ],);
                        }),
                  ),
                ],
              ),
            ):Center(child: CircularProgressIndicator(),);
          },
        )
      ),
    );
  }
}
