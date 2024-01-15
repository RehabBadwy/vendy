import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/auth/signIn_Screen.dart';
import 'package:vendy_station/screens/home/vendy_school/family_school/student_id.dart';

import '../../../../util/color_manager.dart';



class DigitalIdScreen extends StatefulWidget {
  const DigitalIdScreen({Key? key}) : super(key: key);

  @override
  State<DigitalIdScreen> createState() => _DigitalIdScreenState();
}

class _DigitalIdScreenState extends State<DigitalIdScreen> {
  final TextEditingController _digitalController = TextEditingController();
  GlobalKey<FormState> _formKeyForget = GlobalKey<FormState>();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKeyForget,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                  SizedBox(height: 20,),
                  Text(
                    "Pair Digital ID",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "Enter the Digital ID, you Number that came with your Digital ID, you can find it on theback of your wristband or on the front ofyour card",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      color: Color(0xff8391A1)
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _digitalController,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.brown),
                        borderRadius: BorderRadius.all(Radius.circular(20),),
                        //<-- SEE HERE
                      ),
                      labelText: "Digital Id Number",
                      hintText: "Digital Id Number",
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentIdNumber()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown
                      ),
                      child:Text(
                        "Pair",
                        style: TextStyle(
                            color: ColorManager.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
