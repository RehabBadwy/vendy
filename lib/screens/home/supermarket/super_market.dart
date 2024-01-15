import 'package:flutter/material.dart';
import 'package:vendy_station/screens/home/supermarket/category_supermarket.dart';

class SuperMarket extends StatefulWidget {
  const SuperMarket({Key? key}) : super(key: key);

  @override
  State<SuperMarket> createState() => _SuperMarketState();
}

class _SuperMarketState extends State<SuperMarket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  SizedBox(width: 30,),
                  Center(
                      child: Text(
                       "Super Market",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xff1E232C)
                        ),
                        textAlign: TextAlign.center,
                      )),

                ],
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: InkWell(
                          child: Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(
                                          Radius.circular(
                                              50)),
                                      border: Border.all(
                                          color: Colors.grey,
                                          width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/images/bim.png",width: 50,),
                                  )),
                              SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Bim",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text("Hypermarket",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => CategorySuperMarket()));
                          },
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context,index){
                  return Divider(color: Colors.grey,);
                },
                itemCount: 5)
          ],
        ),
      ),
    );
  }
}
