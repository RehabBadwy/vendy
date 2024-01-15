// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:vendy_station/provider/school_provider.dart';
// import 'package:vendy_station/screens/home/vendy_school/family_school/digital_id.dart';
// import 'package:vendy_station/screens/home/vendy_school/family_school/student_id.dart';
//
// import '../../../../base_widgit/custom_button.dart';
// import '../../../../provider/clints_provider.dart';
// import '../../../../util/dimensions.dart';
// import '../../../dashboard/dashboard.dart';
// import 'family_screen.dart';
//
// class PickDigitalScreen extends StatefulWidget {
//   const PickDigitalScreen({Key? key}) : super(key: key);
//
//   @override
//   State<PickDigitalScreen> createState() => _PickDigitalScreenState();
// }
//
//
//
// class _PickDigitalScreenState extends State<PickDigitalScreen> {
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     Provider.of<ClientsProvider>(context, listen: false).getClientCompany(context);
//     final TextEditingController _emailController = TextEditingController();
//     final TextEditingController _nameController = TextEditingController();
//     final TextEditingController _phoneController = TextEditingController();
//     final TextEditingController _addressController = TextEditingController();
//     final TextEditingController _phoneoneController = TextEditingController();
//     GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//     return Scaffold(
//       body : SafeArea(
//           child: Consumer<AddSchoolUserProvider>(
//             builder: (context,student,child){
//               return student.studentData!=null?
//
//                 Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           InkWell(
//                               onTap: (){
//                                 Navigator.pop(context);
//                               },
//                               child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
//                           SizedBox(width: 30,),
//                           Center(
//                               child: Text(
//                                 "Pick Digital Id",
//                                 style: TextStyle(
//                                     fontSize: 30,
//                                     color: Color(0xff1E232C)
//                                 ),
//                                 textAlign: TextAlign.center,
//                               )),
//
//                         ],
//                       ),
//                       SizedBox(height: 20,),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Form(
//                             key: _formKey,
//                             child: Column(
//                               children: [
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//
//                                 Row(children: [
//                                  // Icon(Icons.person, color: Colors.brown, size: 20),
//                                   SizedBox(width: Dimensions.marginSizeExtraSmall),
//                                   Text('Name',
//                                     //style: titilliumRegular
//                                   )
//                                 ],),
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//                                 TextFormField(
//                                   enabled: false,
//                                   controller: _nameController,
//                                   decoration: InputDecoration(
//                                     hintText: "${student.studentData!.studentDataa![0].studentName}",
//                                     // labelText: "labelText",
//                                     // suffixIcon: suffixIcon,
//                                     enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.brown),
//                                         borderRadius: BorderRadius.circular(
//                                             12)),
//                                     hintStyle: TextStyle(color: Colors.black, fontSize: 12),
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     isDense: true,
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.brown),
//                                         borderRadius: BorderRadius.circular(12)),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.black),
//                                         borderRadius: BorderRadius.circular(15)),
//                                   ),
//                                 ),
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//                                 ///
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//
//                                 Row(children: [
//                                 //  Icon(Icons.email, color: Colors.brown, size: 20),
//                                   SizedBox(width: Dimensions.marginSizeExtraSmall),
//                                   Text('School Name',
//                                     //style: titilliumRegular
//                                   )
//                                 ],),
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//                                 TextFormField(
//                                   enabled: false,
//                                   controller: _emailController,
//                                   decoration: InputDecoration(
//
//                                     hintText: "${student.studentData!.studentDataa![0].schoolName}",
//                                     // labelText: "labelText",
//                                     // suffixIcon: suffixIcon,
//                                     enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.brown),
//                                         borderRadius: BorderRadius.circular(
//                                             12)),
//                                     hintStyle: TextStyle(color: Colors.black, fontSize: 12),
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     isDense: true,
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.brown),
//                                         borderRadius: BorderRadius.circular(12)),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.black),
//                                         borderRadius: BorderRadius.circular(15)),
//                                   ),
//                                 ),
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//                                 ///
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//                                 Row(children: [
//                                //   Icon(Icons.school_outlined, color: Colors.brown, size: 20),
//                                   SizedBox(width: Dimensions.marginSizeExtraSmall),
//                                   Text('School Id',
//                                     //style: titilliumRegular
//                                   )
//                                 ],),
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//                                 TextFormField(
//                                   controller: _phoneController,
//                                   enabled: false,
//                                   decoration: InputDecoration(
//
//                                     hintText: "${student.studentData!.studentDataa![0].schoolId}",
//                                     // labelText: "labelText",
//                                     // suffixIcon: suffixIcon,
//                                     enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.brown),
//                                         borderRadius: BorderRadius.circular(
//                                             12)),
//                                     hintStyle: TextStyle(color: Colors.black, fontSize: 12),
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     isDense: true,
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.brown),
//                                         borderRadius: BorderRadius.circular(12)),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.black),
//                                         borderRadius: BorderRadius.circular(15)),
//                                   ),
//                                 ),
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//                                 ///
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//
//                                 Row(children: [
//                              //     Icon(Icons.phone, color: Colors.brown, size: 20),
//                                   SizedBox(width: Dimensions.marginSizeExtraSmall),
//                                   Text('Wallet',
//                                     //style: titilliumRegular
//                                   )
//                                 ],),
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//                                 TextFormField(
//                                   enabled: false,
//                                   controller: _phoneoneController,
//                                   decoration: InputDecoration(
//
//                                     hintText: "${student.studentData!.studentDataa![0].wallet}",
//                                     // labelText: "labelText",
//                                     // suffixIcon: suffixIcon,
//                                     enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.brown),
//                                         borderRadius: BorderRadius.circular(
//                                             12)),
//                                     hintStyle: TextStyle(color: Colors.black, fontSize: 12),
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     isDense: true,
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.brown),
//                                         borderRadius: BorderRadius.circular(12)),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.black),
//                                         borderRadius: BorderRadius.circular(15)),
//                                   ),
//                                 ),
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//                                 ///
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//                                 Row(children: [
//                             //      Icon(Icons.location_on, color: Colors.brown, size: 20),
//                                   SizedBox(width: Dimensions.marginSizeExtraSmall),
//                                   Text('Student Id',
//                                     //style: titilliumRegular
//                                   )
//                                 ],),
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//                                 TextFormField(
//                                   enabled: false,
//                                   controller: _addressController,
//                                   decoration: InputDecoration(
//
//                                     hintText: "${student.studentData!.studentDataa![0].studentId}",
//                                     // labelText: "labelText",
//                                     // suffixIcon: suffixIcon,
//                                     enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.brown),
//                                         borderRadius: BorderRadius.circular(
//                                             12)),
//                                     hintStyle: TextStyle(color: Colors.black, fontSize: 12),
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     isDense: true,
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.brown),
//                                         borderRadius: BorderRadius.circular(12)),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.black),
//                                         borderRadius: BorderRadius.circular(15)),
//                                   ),
//                                 ),
//                                 SizedBox(height: Dimensions.marginSizeExtraSmall),
//                                 ///
//                               ],
//                             )),
//                       ),
//
//                       CustomButton(
//                         onTap: ()async{
//
//
//
//                             Provider.of<AddSchoolUserProvider>(context, listen: false).getLinkSt(context,
//                                 "${student.studentData!.studentDataa![0].schoolId}",
//                                 "${student.studentData!.studentDataa![0].studentId}",);
//                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
//                               await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FamilyScreen()));
//
//                         },
//                         buttonText: 'Pair', ),
//                       // TextFormField(
//                       //   controller: scanCode,
//                       //   // onChanged: (val) {
//                       //   //   setState(() {
//                       //   //     // qrstr = val;
//                       //   //
//                       //   //   });
//                       //   // },
//                       //
//                       //   decoration: InputDecoration(
//                       //       hintText: '$getResult',
//                       //       border: OutlineInputBorder(
//                       //           borderSide: BorderSide(
//                       //               color: Colors.blue,
//                       //               width: 2))),
//                       // ),
//                       // SizedBox(height: 20,),
//                       // Container(
//                       //   height: 100,
//                       //   width: double.infinity,
//                       //   decoration: const BoxDecoration(
//                       //     color: Colors.white,
//                       //     borderRadius: BorderRadius.only(
//                       //       topLeft: Radius.circular(20.0),
//                       //       topRight: Radius.circular(20.0),
//                       //       bottomLeft: Radius.circular(20.0),
//                       //       bottomRight: Radius.circular(20.0),
//                       //     ),
//                       //     boxShadow: [
//                       //       BoxShadow(
//                       //         color: Color(0xffEDEDED),
//                       //         spreadRadius: 1,
//                       //         blurRadius: 15,
//                       //         offset: Offset(0, 3), // changes position of shadow
//                       //       ),
//                       //     ],
//                       //   ),
//                       //   child: Padding(
//                       //     padding: const EdgeInsets.all(8.0),
//                       //     child: InkWell(
//                       //       onTap: (){
//                       //         Navigator.push(context, MaterialPageRoute(builder: (context)=>MyQrCodeScreen()));
//                       //       },
//                       //       child: Row(
//                       //         children: [
//                       //           BarcodeWidget(
//                       //               padding: EdgeInsets.all(8),
//                       //               data: '${mac}${int.parse(userPhone!)*9999}${mac2}',
//                       //               barcode: Barcode.qrCode(),
//                       //               height: 50,
//                       //               width: 50,
//                       //               backgroundColor: Colors.brown,
//                       //               color: Colors.white),
//                       //           SizedBox(width: 20,),
//                       //           Text("MY QR CODE",
//                       //             style: TextStyle(
//                       //                 fontSize: 24,
//                       //                 fontWeight: FontWeight.w700
//                       //             ),
//                       //           ),
//                       //         ],
//                       //       ),
//                       //     ),
//                       //   ),
//                       // )
//                     ],
//                   ),
//                 ),
//               ):Center(child: CircularProgressIndicator(),);
//             },
//           )
//       ),
//     );
//   }
//
// }
