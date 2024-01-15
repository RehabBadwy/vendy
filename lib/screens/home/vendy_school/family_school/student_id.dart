import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/school_provider.dart';
import '../../../../util/color_manager.dart';

class StudentIdNumber extends StatefulWidget {
  const StudentIdNumber({Key? key}) : super(key: key);

  @override
  State<StudentIdNumber> createState() => _StudentIdNumberState();
}

class _StudentIdNumberState extends State<StudentIdNumber> {
  final TextEditingController _schoolIdController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  GlobalKey<FormState> _formKeyForget = GlobalKey<FormState>();
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
                    "Enter Student ID",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "Enter your family member`s student ID Number you can usually find this on the front of theirStudent ID Card",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8391A1)
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _schoolIdController,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.brown),
                        borderRadius: BorderRadius.all(Radius.circular(20),),
                        //<-- SEE HERE
                      ),
                      labelText: "School Id Number",
                      hintText: "School Id Number",
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _studentIdController,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.brown),
                        borderRadius: BorderRadius.all(Radius.circular(20),),
                        //<-- SEE HERE
                      ),
                      labelText: "student Id Number",
                      hintText: "student Id Number",
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: (){
                        if (_formKeyForget.currentState!.validate()==true) {
                          String student = _studentIdController.text.trim();
                          String school = _schoolIdController.text.trim();

                          if (student.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('student_BE_REQUIRED'),
                              backgroundColor: Colors.red,
                            ));
                          }else if (school.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('school_MUST_BE_REQUIRED'),
                              backgroundColor: Colors.red,
                            ));
                          }else{
                            Provider.of<AddSchoolUserProvider>(context, listen: false).getLinkSt(context,
                                _studentIdController.text,
                                _schoolIdController.text);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown
                      ),
                      child:Text(
                        "Confirm",
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
