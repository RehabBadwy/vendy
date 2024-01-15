import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/provider/add_link_provider.dart';
import 'package:vendy_station/screens/home/v_touch/activate_produvt/bussiness_card.dart';

class ActivateProductScreen extends StatefulWidget {
  const ActivateProductScreen({Key? key}) : super(key: key);

  @override
  State<ActivateProductScreen> createState() => _ActivateProductScreenState();
}

class _ActivateProductScreenState extends State<ActivateProductScreen> {

  @override
  Widget build(BuildContext context) {
    Provider.of<AddLinkProvider>(context, listen: false).getVeProduct(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Consumer<AddLinkProvider>(
          builder: (context,product,child){
            return product.vProductModel!=null?
            Column(
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20
                    ),
                    itemCount: product.vProductModel!.products!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return  InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BussinessCardScreen()));
                        },
                        child: Container(
                          alignment: Alignment.center,
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
                            children: [
                              Center(child: Image.network(product.vProductModel!.products![index].image!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,)),
                              SizedBox(height: 15,),
                              Text("Price ${product.vProductModel!.products![index].price!}"),
                              // SizedBox(height: 15,),
                            ],
                          ),
                        ),
                      );
                    }
                ),
                const SizedBox(
                  height:16,
                ),
                // SizedBox(
                //   width: double.infinity,
                //   height: 55,
                //   child: ElevatedButton(
                //     onPressed: (){
                //    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>BussinessCardScreen()));
                //     },
                //     style: ElevatedButton.styleFrom(
                //         backgroundColor: Colors.brown
                //     ),
                //     child:Text(
                //       "Buy New Product",
                //       style: TextStyle(
                //           color: ColorManager.white
                //       ),
                //     ),
                //
                //   ),
                // ),
              ],
            ):Center(child: CircularProgressIndicator(),);
          },
        )
      ),
    );
  }
}