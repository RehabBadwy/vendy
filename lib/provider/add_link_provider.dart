import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendy_station/data/model/active_product.dart';
import 'package:vendy_station/data/model/add_link_model.dart';
import 'package:vendy_station/data/model/file_model.dart';
import 'package:vendy_station/data/model/profile_vtouch_model.dart';
import 'package:vendy_station/data/model/save_link.dart';
import 'package:vendy_station/data/model/save_profile_vtouch.dart';
import 'package:vendy_station/data/model/vtouch_order.dart';
import 'package:vendy_station/data/repo/add_link_repo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../data/datasource/remote/dio/cash.dart';
import '../data/model/delete_link.dart';
import '../data/model/login_model.dart';
import '../data/model/v_product_model.dart';
import '../data/repo/base/api_response.dart';
import '../screens/home/v_touch/vtouch_screen.dart';
import '../util/constant.dart';

class AddLinkProvider with ChangeNotifier {

  final AddLinkRepo? addLinkRepo;

  AddLinkProvider({required this.addLinkRepo});



  AddLinkModel? _addLinkModel;
  AddLinkModel? get addLinkModel => _addLinkModel;
  Future<void> getAddLinkUser(BuildContext context,String link, String cat,String subcat)async {
    ApiResponse apiResponse = await addLinkRepo!.getAddLink(
        link: link, cat: cat, subcat: subcat);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      _addLinkModel = AddLinkModel.fromJson(apiResponse.response!.data);
      if(addLinkModel!.status=="success"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.success)));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.fail)));

      }
    }else {
      // ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }

  FileModel? _fileModel;
  FileModel? get fileModel => _fileModel;
  Future<void> getUploadFile(BuildContext context /*FormData filee*//*,String path,String filename*/)async{

    ApiResponse apiResponse = await addLinkRepo!.getFile(/*path: path, fileName: filename*/);

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      _fileModel = FileModel.fromJson(apiResponse.response!.data);
      if(fileModel!.received=="success"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.success)));
      }
      print(apiResponse.response!.data);
    }else{
      print("gfhj");
    }
    notifyListeners();
  }


  Future<void> getUploadImage(BuildContext context /*FormData filee*//*,String path,String filename*/,file)async{

    ApiResponse apiResponse = await addLinkRepo!.getImageTwo(file);

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      // _fileModel = FileModel.fromJson(apiResponse.response!.data);
      // if(fileModel!.received=="success"){
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.success)));
      // }
      print(apiResponse.response!.data);
    }else{
      print("gfhj");
    }
    notifyListeners();
  }


  XFile? _imageFile ;
  final ImagePicker _picker = ImagePicker();
  Future getImage() async {

    final  pickedFile = (await _picker.getImage(source: ImageSource.gallery)) ;
  //  setState(() {
      _imageFile = XFile(pickedFile!.path)  ;
      // saveImage(pickedFile.path);
      // _load = false;
   // });
  }

  VProductModel? _vProductModel;
  VProductModel? get vProductModel => _vProductModel;
  Future<void> getVeProduct(BuildContext context/*,{bool reload = false}*/,) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await addLinkRepo!.getVProduct();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _vProductModel = VProductModel.fromJson(apiResponse.response!.data);
    } else {
      // ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }

  SaveLink? _saveLink;
  SaveLink? get saveLink => _saveLink;
  Future<void> getSaveSocial(BuildContext context/*,{bool reload = false}*/) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await addLinkRepo!.getSaveLink();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _saveLink = SaveLink.fromJson(apiResponse.response!.data);
      // CacheHelper.saveData(
      //     key: 'link', value: saveLink!.links![index].link);
      // link = CacheHelper.getData(key: 'link');
    } else {
      // ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }

  Future<void> getActiveLink(BuildContext context/*,{bool reload = false}*/,String subcat,String state) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await addLinkRepo!.getActiveLink(subcat,state);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {

    } else {
      // ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }

  DeleteLink? _deleteLink;
  DeleteLink? get deleteLink => _deleteLink;
  Future<void> getdeleteSocial(BuildContext context/*,{bool reload = false}*/,String id) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await addLinkRepo!.getDeleteLink(id);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _deleteLink = DeleteLink.fromJson(apiResponse.response!.data);
    } else {
      // ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }


  ProfileVtouchModel? _profileVtouchModel;
  ProfileVtouchModel? get profileVtouchModel => _profileVtouchModel;
  Future<void> getProfileVT(BuildContext context/*,{bool reload = false}*/,String name,
      String phone, String email, String phone1, String address,
      String web
      ) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await addLinkRepo!.getProfileVTouch(name: name, phone: phone, email: email, phone1: phone1, address: address,web: web);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _profileVtouchModel = ProfileVtouchModel.fromJson(apiResponse.response!.data);
      if(profileVtouchModel!.status=="success"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.success)));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>vTouchScreen()));

      }
    } else {
      // ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }


  // SaveProfileVtouch? _saveProfileVtouch;
  // SaveProfileVtouch? get saveProfileVtouch => _saveProfileVtouch;
  List<Data> _saveProfileVtouch=[];
  List<Data> get saveProfileVtouch =>_saveProfileVtouch;
  Future<void> getSaveProfile(BuildContext context/*,{bool reload = false}*/,) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await addLinkRepo!.getSaveProfileVTouch();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      if (SaveProfileVtouch.fromJson(apiResponse.response!.data).data != null) {
        _saveProfileVtouch = SaveProfileVtouch.fromJson(apiResponse.response!.data).data!;
      }


      print("fghjkl");
      _saveProfileVtouch = SaveProfileVtouch.fromJson(apiResponse.response!.data).data!;

      CacheHelper.saveData(
          key: 'nameVTouch', value: saveProfileVtouch[0].name);
      nameVTouch = CacheHelper.getData(key: 'nameVTouch');

      CacheHelper.saveData(
          key: 'phoneVTouch', value: saveProfileVtouch[0].phone1);
      phoneVTouch = CacheHelper.getData(key: 'phoneVTouch');

          CacheHelper.saveData(
          key: 'phoneVTouch2', value: saveProfileVtouch[0].phone2);
      phone2VTouch = CacheHelper.getData(key: 'phoneVTouch2');

      CacheHelper.saveData(
          key: 'emailVTouch', value: saveProfileVtouch[0].email);
      emailVTouch = CacheHelper.getData(key: 'emailVTouch');

      CacheHelper.saveData(
          key: 'addressVTouch', value: saveProfileVtouch[0].address);
      addressVTouch = CacheHelper.getData(key: 'addressVTouch');
      CacheHelper.saveData(
          key: 'imagePath', value: saveProfileVtouch[0].image);
      imagePath = CacheHelper.getData(key: 'imagePath');

      CacheHelper.saveData(
          key: 'webVTouch', value: saveProfileVtouch[0].website);
      webVTouch = CacheHelper.getData(key: 'webVTouch');
    } else {
      // ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }

  VtouchOrder? _vtouchOrder;
  VtouchOrder? get vtouchOrder =>_vtouchOrder;
  Future<void> getVTouchOrder(BuildContext context/*,{bool reload = false}*/,String name,
      String phone, String email,String address, String creditType
      ) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await addLinkRepo!.getVTouchOrder(name: name, phone: phone, email: email, address: address,creditType: creditType);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _vtouchOrder = VtouchOrder.fromJson(apiResponse.response!.data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.success),
        backgroundColor: Colors.green,
      ));
    } else {
      // ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }

  ActiveProduct? _activeProduct;
  ActiveProduct? get activeProduct =>_activeProduct;

  Future<void> getActiveProduct(BuildContext context/*,{bool reload = false}*/,
  String scan
      ) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await addLinkRepo!.getActiveProduct(scan);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _activeProduct = ActiveProduct.fromJson(apiResponse.response!.data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.activate),
        backgroundColor: Colors.green,
      ));
    } else {
      // ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }
}