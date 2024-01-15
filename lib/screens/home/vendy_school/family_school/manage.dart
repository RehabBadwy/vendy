import 'package:flutter/material.dart';
import 'package:vendy_station/screens/home/vendy_school/family_school/add_restrictions.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({Key? key}) : super(key: key);

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  SizedBox(width: 30,),
                  Center(
                      child: Text(
                        "Manage Restrictions",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff1E232C)
                        ),
                        textAlign: TextAlign.center,
                      )),

                ],
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddRestrictions()));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text("Add Restrictions"),
                        Spacer(),
                        Icon(Icons.arrow_forward,size: 15,color: Colors.black,),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "Restricted by Metropolitan",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff1E232C)
                ),
              ),
              SizedBox(height: 16,),
              Text(
                "Thess Products have been restricted by yourcommunity for this famliy member. these can only be changed by your community",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black
                ),

              ),
              SizedBox(height: 20,),
              Image.asset("assets/images/female.png"),
              SizedBox(height: 20,),
              Text(
                "Contains Allergens",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff1E232C)
                ),
              ),
              SizedBox(height: 16,),
              Text(
                "Thess Products have been automatically restricted based on the allergens that you have added for this family member. to remove this restriction, check your family member`s allergens through their settings page",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
