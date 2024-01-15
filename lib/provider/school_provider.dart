import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendy_station/data/model/allow_model.dart';
import 'package:vendy_station/data/model/forbidden_model.dart';
import 'package:vendy_station/data/model/limit_daily.dart';
import 'package:vendy_station/data/model/link_student.dart';
import 'package:vendy_station/data/model/school_product_list.dart';
import 'package:vendy_station/data/model/school_transiction.dart';
import 'package:vendy_station/data/model/student_data.dart';
import 'package:vendy_station/data/model/student_request.dart';
import '../data/model/add_school_model.dart';
import '../data/model/link_student.dart';
import '../data/model/link_student.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../data/model/machines_school.dart';
import '../data/model/preview_my_family.dart';
import '../data/model/school_list_model.dart';
import '../data/repo/base/api_response.dart';
import '../data/repo/shool_repo.dart';

class AddSchoolUserProvider with ChangeNotifier {
  final SchoolRepo? schoolRepo;

  AddSchoolUserProvider({required this.schoolRepo});

  AddSchoolModel? _addSchoolModel;
  AddSchoolModel? get addSchoolModel => _addSchoolModel;
  Future<void> getAddSchoolUser(BuildContext context,String studentId, String schoolName, String sustudentName) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await schoolRepo!.getSchool(studentId: studentId, schoolName: schoolName, sustudentName: sustudentName);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _addSchoolModel = AddSchoolModel.fromJson(apiResponse.response!.data);
      if(addSchoolModel!.status=="success"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.success)));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.fail)));

      }
    } else {
      //ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }


  SchoolListModel? _schoolListModel;
  SchoolListModel? get schoolListModel => _schoolListModel;

  Future<void> getAddSchoolList(BuildContext context) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await schoolRepo!.getSchoolList();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _schoolListModel = SchoolListModel.fromJson(apiResponse.response!.data);
    } else {
      //ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }

  MachinesSchool? _machinesSchool;
  MachinesSchool? get machinesSchool => _machinesSchool;
  Future<void> getMachinesSchool(BuildContext context,String schoolName,String schoolId) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await schoolRepo!.getMachinesSchools(schoolName: schoolName, schoolId: schoolId);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _machinesSchool = MachinesSchool.fromJson(apiResponse.response!.data);
    } else {
      //ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }
///
//   StudentData? _studentData;
//   StudentData? get studentData => _studentData;
  StudentRequest? _studentRequest;
  StudentRequest?get studentRequest => _studentRequest;
  Future<void> getStudentData(BuildContext context,String schoolName,String schoolId,String studentId,String studentName) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await schoolRepo!.getStudentData(schoolName: schoolName, schoolId: schoolId,studentId:studentId ,studentName: studentName);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
   //   _studentData = StudentData.fromJson(apiResponse.response!.data);
     _studentRequest = StudentRequest.fromJson(apiResponse.response!.data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(AppLocalizations.of(context)!.soon,
          style: TextStyle(color: Colors.white),
        ),),);
    } else {
      //ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }
///
PreviewMyFamily? _previewMyFamily;
PreviewMyFamily? get previewMyFamily =>_previewMyFamily;

  Future<void> getPreviewMyFamily(BuildContext context) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await schoolRepo!.getPreviewMyFamily();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _previewMyFamily = PreviewMyFamily.fromJson(apiResponse.response!.data);
    } else {
      //ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }

  LinkStudent? _linkStudent;
  LinkStudent? get linkStudent => _linkStudent;
  Future<void> getLinkSt(BuildContext context,String studentId,String schoolId) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await schoolRepo!.getLinkStudent(studentId: studentId, schoolId: schoolId);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _linkStudent = LinkStudent.fromJson(apiResponse.response!.data);
    } else {
      //ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }

  SchoolTransiction? _schoolTransiction;
  SchoolTransiction? get schoolTransiction =>_schoolTransiction;
  Future<void> getStudentTransic(BuildContext context,String studentId,String schoolId) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await schoolRepo!.getStudentTransiction(
        studentId: studentId,
        schoolId: schoolId);
    _machinesSchool = MachinesSchool.fromJson(apiResponse.response!.data);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _schoolTransiction = SchoolTransiction.fromJson(apiResponse.response!.data);

    } else {
      //ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }

  SchoolProductList? _schoolProductList;
  SchoolProductList? get schoolProductList => _schoolProductList;
  Future<void> getSchoolProductList(BuildContext context) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await schoolRepo!.getSchoolProductList();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _schoolProductList = SchoolProductList.fromJson(apiResponse.response!.data);

    } else {
      //ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }


ForbiddenModel? _forbiddenModel;
ForbiddenModel?get forbidden => _forbiddenModel;
  Future<void> getForbidden(BuildContext context,String itemCode,String itemCat,String itemName
  ,String studentId,String schoolId) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await schoolRepo!.getForbidden(itemCat: itemCat,
        itemCode: itemCode, itemName: itemName, studentId: studentId, schoolId: schoolId);
   // _machinesSchool = MachinesSchool.fromJson(apiResponse.response!.data);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _forbiddenModel = ForbiddenModel.fromJson(apiResponse.response!.data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(AppLocalizations.of(context)!.success,
          style: TextStyle(color: Colors.white),
        ),),);
    } else {
      //ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }

  AllowModel? _allowModel;
  AllowModel? get allowModel =>_allowModel;
  Future<void> getAllow(String itemCode,BuildContext context,
      String studentId) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await schoolRepo!.getAllow(
        itemCode: itemCode,  studentId: studentId,);
    // _machinesSchool = MachinesSchool.fromJson(apiResponse.response!.data);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _allowModel = AllowModel.fromJson(apiResponse.response!.data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(AppLocalizations.of(context)!.success,
          style: TextStyle(color: Colors.white),
        ),),);
    } else {
      //ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }

  LimitDaily? _limitDaily;
  LimitDaily? get limitDaily =>_limitDaily;
  Future<void> getLimit(String limit,BuildContext context,
      String studentId) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await schoolRepo!.getLimitDaily(limit: limit,
        studentId: studentId);
    // _machinesSchool = MachinesSchool.fromJson(apiResponse.response!.data);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _limitDaily = LimitDaily.fromJson(apiResponse.response!.data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(AppLocalizations.of(context)!.success,
          style: TextStyle(color: Colors.white),
        ),),);
    } else {
      //ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }
}