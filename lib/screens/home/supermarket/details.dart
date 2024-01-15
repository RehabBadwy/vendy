  import 'package:flutter/material.dart';
import 'package:vendy_station/screens/home/supermarket/basket.dart';

import '../../../util/color_manager.dart';

class SuperMarketDetails extends StatefulWidget {
  const SuperMarketDetails({Key? key}) : super(key: key);

  @override
  State<SuperMarketDetails> createState() => _SuperMarketDetailsState();
}

class _SuperMarketDetailsState extends State<SuperMarketDetails> {

  int value = 0;
  void add() {
    setState((){
      value ++;
    });
  }

  void subtract() {
    setState((){
      value --;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    var  mdh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                Spacer(),
                IconButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => BasketScreen()));
                }, icon: Icon(Icons.shopping_bag_outlined))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: mdh / 4,
                        width: mdw,
                        // margin: EdgeInsets.only(top: 30),
                        child: Image.asset("assets/images/cheese-.png",width: 80,height: 80,fit: BoxFit.fill,),),
                      Container(
                        height: mdh / 4,
                        width: mdw,
                        color: Color.fromARGB(150, 14, 62, 66),
                        // margin: EdgeInsets.only(top: 30),
                      ),


                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Katiol Creamy Cheese, 250G",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("EGP 65",
                    style: TextStyle(
                        fontSize: 15,

                        color: Colors.grey
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFFDDDDDD),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: InkWell(
                            onTap: (){
                              subtract();
                            },
                            child: Center(
                              child: Icon(Icons.remove),
                            ),
                          )
                      ),
                      SizedBox(width: 10,),
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFFDDDDDD),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: Text("$value",
                              style: TextStyle(
                                  color: Color(0xFF222222)
                              ),
                            ),
                          )
                      ),
                      SizedBox(width: 10,),
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFFDDDDDD),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: InkWell(
                            onTap: (){
                              add();
                            },
                            child: Center(
                              child: Icon(Icons.add),
                            ),
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: (){




                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.brown
                  ),
                  child:Text(
                    "Add TO Basket",
                    style: TextStyle(
                        color: ColorManager.white
                    ),
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
