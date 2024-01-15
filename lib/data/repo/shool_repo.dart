import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constant.dart';
import '../datasource/remote/dio/cash.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import 'base/api_response.dart';

class SchoolRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  SchoolRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> getSchool({required String studentId,required String schoolName,required String sustudentName}) async {
    try {
      final response = await dioClient!.post(
          AppConstants.addSchoolUrl,
          data: {
            "student_id":studentId,
            "school_name":schoolName,
            "sustudent_name":sustudentName,
            "user_id":CacheHelper.getData(key: "userPhone"),
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
    ///
  }



  Future<ApiResponse> getSchoolList() async {
    try {
      final response = await dioClient!.get(
          AppConstants.schoolListUrl,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getMachinesSchools({required String schoolName,required String schoolId}) async {
    try {
      final response = await dioClient!.post(
          AppConstants.machinesSchoolUrl,
          data: {
            "school_name":schoolName,
            "school_id":schoolId,
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getStudentData({required String schoolName,required String schoolId,
    required studentId,required studentName,}) async {
    try {
      final response = await dioClient!.post(
          AppConstants.pickDigitalUrl,
          data: {
            "school_name":schoolName,
            "school_id":schoolId,
            "student_id":studentId,
            "student_name":studentName,
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

///
  Future<ApiResponse> getPreviewMyFamily() async {
    try {
      final response = await dioClient!.post(
          AppConstants.previewMyFamilyUrl,
          data: {
            "user_id":userPhone
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getLinkStudent({required String studentId,required String schoolId}) async {
    try {
      final response = await dioClient!.post(
          AppConstants.linkStudentUrl,
          data: {
            "user_id":userPhone,
            "school_id":schoolId,
            "student_id":studentId,
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getStudentDigital({required String studentId,required String schoolId,required String studentName}) async {
    try {
      final response = await dioClient!.post(
          AppConstants.pickDigitalUrl,
          data: {
            "student_name":studentName,
            "school_id":schoolId,
            "student_id":studentId,
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getStudentTransiction({required String studentId,required String schoolId}) async {
    try {
      final response = await dioClient!.post(
          AppConstants.StudentTransictionUrl,
          data: {
            "user_id":userPhone,
            "school_id":schoolId,
            "student_id":studentId,
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }


  Future<ApiResponse> getSchoolProductList() async {
    try {
      final response = await dioClient!.get(
          AppConstants.schoolProductListUrl,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getForbidden({required String itemCat,required String itemCode,
    required String itemName,required String studentId,required String schoolId}) async {
    try {
      final response = await dioClient!.post(
        AppConstants.forbiddenUrl,
        data: {
          "item_name":itemName,
          "item_code":itemCode,
          "item_cat":itemCat,
          "user_id":userPhone,
          "school_id":schoolId,
          "student_id":studentId,
        }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getAllow({required String itemCode,
   required String studentId}) async {
    try {
      final response = await dioClient!.post(
          AppConstants.allowUrl,
          data: {
            "item_code":itemCode,
            "student_id":studentId,
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getLimitDaily({required String limit,
    required String studentId}) async {
    try {
      final response = await dioClient!.post(
          AppConstants.allowUrl,
          data: {
            "daily_limit":limit,
            "student_id":studentId,
            "User_id":userPhone,
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }
}