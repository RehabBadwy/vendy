import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constant.dart';
import '../datasource/remote/dio/cash.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import 'base/api_response.dart';

class AddLinkRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  AddLinkRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> getAddLink({required String link,required String cat,required String subcat}) async {
    try {

      final response = await dioClient!.post(
          AppConstants.addLinkUrl,
          data: {
            "link":link,
            "cat":cat,
            "subcat":subcat,
            "priority":"1",
            "status":"1",
            "User_id":userPhone,
            "activate":"0"
          }

      );
      // print(isSelected);
      // print(status);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }



  Future<ApiResponse> getFile(/*{required FormData filee}*/ /*{required String path,required String fileName}*/) async {

    try {
        FilePickerResult? result = await FilePicker.platform.pickFiles() ;
      // //
         File file = File(result!.files.single.path??"");
         String fileName = file.path.split('/').last;
         String path = file.path;
        FormData Xfilee = FormData.fromMap({
          "user_id":userPhone,
          "upl_file" : await MultipartFile.fromFile(path,filename: fileName)
        } );

        CacheHelper.saveData(key: "fileNAME", value: file.path.split('/').last);
        fileNAME = CacheHelper.getData(key: 'fileNAME');
      //   print(file);

      final response = await dioClient!.post(
          AppConstants.uploadFile,
          data: Xfilee
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getImage() async {

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles() ;
      // //
      File file = File(result!.files.single.path??"");
      String fileName = file.path.split('/').last;
      String path = file.path;
      FormData Xfilee = FormData.fromMap({
        "user_id":userPhone,
        "upl_file" : await MultipartFile.fromFile(path,filename: fileName)
      } );

      CacheHelper.saveData(key: "fileNAME", value: file.path.split('/').last);
      fileNAME = CacheHelper.getData(key: 'fileNAME');
      //   print(file);

      final response = await dioClient!.post(
          AppConstants.uploadImage,
          data: Xfilee
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> getImageTwo(XFile file) async {
    try {
      // final ImagePicker _picker = ImagePicker();
      // final  pickedFile = await _picker.getImage(source: ImageSource.gallery) ;

      FormData formData = FormData.fromMap({
        "user_id": userPhone,
        "upl_file": await MultipartFile.fromFile(file.path
          ,filename:  file.path.split('/').last,
        ),
      });

      final response = await dioClient!.post(
        AppConstants.uploadImage,
        data: formData
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }



  Future<void> uploadFile() async {
    String url = 'https://example.com/upload'; // Replace with your upload endpoint
    String filePath = '/path/to/your/file.txt'; // Replace with the actual file path


    File file = File(filePath);
    String fileName = file.path
        .split('/')
        .last;

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });
  }

  // Future<void> downloadFile() async {
  //   String url = 'https://example.com/sample.pdf'; // Replace with your file URL
  //   var response = await http.get(Uri.parse(url));
  //
  //   final documentDirectory = await getApplicationDocumentsDirectory();
  //   final file = File('${documentDirectory.path}/sample.pdf');
  //
  //   file.writeAsBytesSync(response.bodyBytes);
  //   print('File downloaded to: ${file.path}');
  // }

  Future<ApiResponse> getVProduct() async {
    try {
      final response = await dioClient!.get(
          AppConstants.vProductUrl,

      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getSaveLink() async {
    try {
      final response = await dioClient!.post(
        AppConstants.saveLinkUrl,
        data: {
          "user_id":userPhone
        }
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getActiveLink(String subcat,String status) async {
    try {
      final response = await dioClient!.post(
          AppConstants.activeUrl,
          data: {
            "User_id" : userPhone,
            "subcat" : subcat,
            "state" : status
          }
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }
  Future<ApiResponse> getDeleteLink(String id) async {
    try {
      final response = await dioClient!.post(
          AppConstants.deleteLinkUrl,
          data: {
            "id":id
          }
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getProfileVTouch({
    required String name,
    required String phone,
    required String email,
    required String phone1,
    required String address,
    required String web,

  }) async {
    try {
      final response = await dioClient!.post(
          AppConstants.profileVtouchUrl,
          data: {
              "name":name,
              "phone1":phone,
              "email":email,
              "phone2":phone1,
              "address":address,
              "website":web,
              "User_id":userPhone,
          }
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getSaveProfileVTouch() async {
    try {
      final response = await dioClient!.post(
          AppConstants.saveProfileVTouchUrl,
          data: {
            "user_id":userPhone
          }
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getVTouchOrder({
    required String name,
    required String phone,
    required String email,
    required String address,
    required String creditType,
}) async {
    try {
      final response = await dioClient!.post(
          AppConstants.vTouchOrderUrl,
          data: {
            "name":name,
            "phone":phone,
            "email":email,
            "address":address,
            "credit_type":creditType
          }
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getActiveProduct(String scan) async {
    try {
      final response = await dioClient!.post(
          AppConstants.activeProductUrl,
          data: {
            "user_id":scan
          }
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }
}