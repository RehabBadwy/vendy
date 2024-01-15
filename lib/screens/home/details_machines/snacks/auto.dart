import 'package:flutter/material.dart';

class AutoScreen extends StatefulWidget {
  const AutoScreen({Key? key}) : super(key: key);

  @override
  State<AutoScreen> createState() => _AutoScreenState();
}

class _AutoScreenState extends State<AutoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
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
                          "Vendy Station",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff1E232C)
                          ),
                          textAlign: TextAlign.center,
                        )),

                  ],
                ),
                SizedBox(height: 15,),
                Image.asset("assets/images/auto1.jpg",fit: BoxFit.cover),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
