import 'package:flutter/material.dart';

class MachineItemSchool extends StatefulWidget {
  const MachineItemSchool({Key? key}) : super(key: key);

  @override
  State<MachineItemSchool> createState() => _MachineItemSchoolState();
}

class _MachineItemSchoolState extends State<MachineItemSchool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  ],
                ),
              ),
              Column(
                children: [
                  Center(
                      child: Image.asset("assets/images/inter.png",)
                  ),
                  Text("American Internationsa",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Text("Coffe Machine",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15
                ),
              ),
              SizedBox(height: 20,),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20
                  ),
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return  InkWell(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsMachineScreen()));


                      },
                      child: Container(
                        width: 150,
                        height: 150,
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
                          child:Column(
                            children: [
                              Image.asset("assets/images/sandwitch.png"),
                              Text("Mocha Can"),
                              Text("15.00"),
                            ],
                          ),
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
                      ),
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
