import 'package:flutter/material.dart';
import 'package:vendy_station/screens/home/details_machines/coffe/coffee_screen_one.dart';
import 'package:vendy_station/screens/home/details_machines/coffe/coffee_screen_two.dart';
import 'package:vendy_station/screens/home/details_machines/frozen/frozen_screen.dart';
import 'package:vendy_station/screens/home/details_machines/popcorn/popcorn_screen.dart';
import 'package:vendy_station/screens/home/details_machines/snacks/auto.dart';
import 'package:vendy_station/screens/home/details_machines/snacks/compo_screen.dart';
import 'package:vendy_station/screens/home/details_machines/snacks/inch.dart';
import 'package:vendy_station/screens/home/details_machines/snacks/milk.dart';
import 'package:vendy_station/screens/home/details_machines/snacks/one_screen.dart';
import 'package:vendy_station/screens/home/details_machines/snacks/snacks_Screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'details_machines/cotton/cotton_screen.dart';

class MachinesPhotoScreen extends StatefulWidget {
  const MachinesPhotoScreen({Key? key}) : super(key: key);

  @override
  State<MachinesPhotoScreen> createState() => _MachinesPhotoScreenState();
}

class _MachinesPhotoScreenState extends State<MachinesPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                          AppLocalizations.of(context)!.machines,
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff1E232C)
                          ),
                          textAlign: TextAlign.center,
                        )),

                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  height: 115,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeScreenOne()));

                      },
                      child: Row(
                        children: [
                          Text("Coffee Vending\nMachine",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Spacer(),
                          Image.asset("assets/images/cof1.png",fit: BoxFit.cover)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: height/6.5,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeScreenTwo()));

                      },
                      child: Row(
                        children: [
                          Text("Coffee Vending\nMachine",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Spacer(),
                          Image.asset("assets/images/cof2.png",fit: BoxFit.cover,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: height/6.5,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CottoScreen()));
                      },
                      child: Row(
                        children: [
                          Text("Cotton Candy",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Spacer(),
                          Image.asset("assets/images/cotton.png")
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: height/6.5,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FrozenScreen()));

                      },
                      child: Row(
                        children: [
                          Text("Frozen Vending\nMachine",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Spacer(),
                          Image.asset("assets/images/f1.png",fit: BoxFit.cover,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: height/6.5,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PopcornScreen()));

                      },
                      child: Row(
                        children: [
                          Text("Popcorn Vending\nMachine",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Spacer(),
                          Image.asset("assets/images/popcorn.png",fit: BoxFit.cover,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: height/6.5,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SnacksScreen()));

                      },
                      child: Row(
                        children: [
                          Text("Snacks Vending\nMachine",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Spacer(),
                          Image.asset("assets/images/s1.png",fit: BoxFit.cover,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: height/6.5,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MilkScreen()));

                      },
                      child: Row(
                        children: [
                          Text("Bottled Milk\nVending Machine",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Spacer(),
                          Image.asset("assets/images/s2.png",fit: BoxFit.cover,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: height/6.5,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CompoScreen()));

                      },
                      child: Row(
                        children: [
                          Text("Combo Snacks\nVending Machine",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Spacer(),
                          Image.asset("assets/images/s3.png",fit: BoxFit.cover,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: height/6.5,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AutoScreen()));

                      },
                      child: Row(
                        children: [
                          Text("Automatic Snacks\nVending Machine",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Spacer(),
                          Image.asset("assets/images/s4.png",fit: BoxFit.cover,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: height/6.5,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>InchScreen()));

                      },
                      child: Row(
                        children: [
                          Text("Automatic Snacks\ndrink",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Spacer(),
                          Image.asset("assets/images/s5.png",fit: BoxFit.cover,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: height/6.5,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OneScreen()));

                      },
                      child: Row(
                        children: [
                          Text("Snacks Vending\nMachine 55 inch",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Spacer(),
                          Image.asset("assets/images/s6.png",fit: BoxFit.cover,)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
