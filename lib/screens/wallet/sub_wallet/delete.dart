import 'package:flutter/material.dart';

import '../../../util/color_manager.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("data")
        // TextFormField(
        //   controller: _nameController,
        //   decoration: const InputDecoration(
        //     border: OutlineInputBorder(
        //       borderSide: BorderSide(
        //           width: 3, color: Colors.brown),
        //       borderRadius: BorderRadius.all(Radius.circular(20),),
        //
        //     ),
        //     labelText: "Wallet Name",
        //     hintText: "Wallet Name",
        //   ),
        //   keyboardType: TextInputType.phone,
        // ),
        // const SizedBox(
        //   height: 16,
        // ),
        // TextFormField(
        //   controller: _relationController,
        //   decoration:  InputDecoration(
        //     border: OutlineInputBorder(
        //       borderSide: BorderSide(
        //           width: 3, color: Colors.brown),
        //       borderRadius: BorderRadius.all(Radius.circular(20),),
        //       //<-- SEE HERE
        //     ),
        //     labelText: "Relationship",
        //     hintText: "Relationship",
        //   ),
        //   keyboardType: TextInputType.phone,
        // ),
        // const SizedBox(
        //   height:16,
        // ),
        // SizedBox(
        //   width: double.infinity,
        //   height: 55,
        //   child: ElevatedButton(
        //     onPressed: (){},
        //     style: ElevatedButton.styleFrom(
        //         backgroundColor: Colors.brown
        //     ),
        //     child:Text(
        //       "Create",
        //       style: TextStyle(
        //           color: ColorManager.white
        //       ),
        //     ),
        //
        //   ),
        // ),
        // const SizedBox(
        //   height: 16,
        // ),
        // SizedBox(
        //   width: double.infinity,
        //   height: 55,
        //   child: ElevatedButton(
        //     onPressed: (){},
        //     style: ElevatedButton.styleFrom(
        //         backgroundColor: ColorManager.primary
        //     ),
        //     child:Text(
        //       "back",
        //       style: TextStyle(
        //           color: ColorManager.white
        //       ),
        //     ),
        //
        //   ),
        // ),
      ],
    );
  }
}
