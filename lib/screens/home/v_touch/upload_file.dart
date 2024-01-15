import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../../provider/add_link_provider.dart';
import '../../../util/constant.dart';

class UploadFileScreen extends StatefulWidget {
  const UploadFileScreen({Key? key}) : super(key: key);

  @override
  State<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {

  // FilePickerResult? result;
  // String? _fileName;
  // PlatformFile? pickedFile;
  // bool isLoading=false;
  // File? fileToDisplay;
  //
  // late    File file = File(result!.files.single.path??"");
  // late   String fileName = file.path.split('/').last;
  // void filePicker()async{
  //  // FilePickerResult? result = await FilePicker.platform.pickFiles() ;
  // //   result = await FilePicker.platform.pickFiles();
  // // //  File file = File(result!.files.single.path??"");
  // //   String fileName = file.path.split('/').last;
  // //  String path = file.path;
  // //  print("fghjk${file.path}");
  // //  print(fileName);
  //  Provider.of<AddLinkProvider>(context, listen: false).getUploadFile(context);
  // }
@override
  void initState() {
    // TODO: implement initState
  request();
    super.initState();

  }
void request()async{
  var status = await Permission.storage.status;
  if(status.isGranted){
    await Permission.storage.request();
  }

  var status1 = await Permission.manageExternalStorage.status;
  if(status1.isGranted){
    await Permission.manageExternalStorage.request();
  }
}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
           child: TextButton(onPressed: ()async{

             //  FilePickerResult? result = await FilePicker.platform.pickFiles() ;
             // // if(result!=null){
             //    File file = File(result!.files.single.path??"");
             //   String fileName = file.path.split('/').last;
             //    String path = file.path;
             //   FormData Xfilee = FormData.fromMap({
             //     "upl_file" : await MultipartFile.fromFile(path,filename: fileName)
             //   } );
             //   print(file);
             //
             // }
            // filePicker();
             Provider.of<AddLinkProvider>(context, listen: false).getUploadFile(context);

           }, child:
           // fileNAME!=null?
           //     Text(fileNAME!):
           Column(

             children: [
               fileNAME!=null ?
               Container(
                   height: 50,
                   width: double.infinity,
                   decoration:  BoxDecoration(
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
                   child: Center(child: Text(AppLocalizations.of(context)!.upload))):
               Container(
                 height: 50,
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
                   child: Center(child: Text(
                     textAlign:TextAlign.start,
                     fileNAME!,
                   style: TextStyle(
                     color: Colors.black
                   ),
                   ))),
             ],
           ),
            ),
          ),

           // SizedBox(height: 300,width: 300,child: Image.file(fileToDisplay!),)
        ],
      ),
    );
  }

  void _showFilesinDir({required Directory dir}) {
    dir.list(recursive: false, followLinks: false)
        .listen((FileSystemEntity entity) {
      print(entity.path);
    });
  }

  Future upload()async{

    // PermissionStatus permissionResult = await SimplePermissions.requestPermission(Permission. WriteExternalStorage);
    // if (permissionResult == PermissionStatus.authorized){
    //   // code of read or write file in external storage (SD card)
    // }
    ///
    // final permissionStatus = await Permission.storage.status;
    // if (permissionStatus.isDenied) {
    //
    //   // Here just ask for the permission for the first time
    //   await Permission.storage.request();
    // print("fghjkl");
    //   // I noticed that sometimes popup won't show after user press deny
    //   // so I do the check once again but now go straight to appSettings
    //   if (permissionStatus.isDenied) {
    //     await openAppSettings();
    //
    //   }
    // } else if (permissionStatus.isPermanentlyDenied) {
    //   // Here open app settings for user to manually enable permission in case
    //   // where permission was permanently denied
    //   await openAppSettings();
    //
    // } else {
    //   // FilePickerResult? result =  FilePicker.platform.pickFiles() as FilePickerResult?;
    //   // if(result!=null){
    //   //   File file = File(result.files.single.path??"");
    //   //   String fileName = file.path.split('/').last;
    //   //   String path = file.path;
    //   //   FormData data = FormData.fromMap({
    //   //     "file" : await MultipartFile.fromFile(path,filename: fileName)
    //   //   } );
    //   //   print(data);
    //   // }
    //   // Do stuff that require permission here
    // }
    FilePickerResult? result = await FilePicker.platform.pickFiles() ;
    if(result!=null){
      File file = File(result.files.single.path??"");
      String fileName = file.path.split('/').last;
      String path = file.path;
      FormData data = FormData.fromMap({
        "file" : await MultipartFile.fromFile(path,filename: fileName)
      } );
      print(data);
    }
  }
}
