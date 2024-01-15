import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constant.dart';
import '../datasource/remote/dio/cash.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import 'base/api_response.dart';

class ClientRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  ClientRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> getClients() async {
    try {
      final response = await dioClient!.post(
          AppConstants.clients,
          data: {}
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getClientsUpdate(String company) async {
    try {
      final response = await dioClient!.post(
          AppConstants.clientsUpdate,
          data: {
            "phone":userPhone,
            "company":company
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getMachinesList(String name/*,String desc,String image*/) async {
    try {
      final response = await dioClient!.post(
          AppConstants.machinesList,
          data: {
            "org_name":name,
            // "dec":desc,
            // "image":image,
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getMachinesProduct(String Cname,String type) async {
    try {
      final response = await dioClient!.post(
          AppConstants.machinesProduct,
          data: {
            "cat_name":Cname,
            "machine_code":type,
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }
  Future<ApiResponse> getMachinesOrder(String machineId,String SoltNum,String SoltPrice,
      String OType,String machineCode,String machineType,String itemName
      ) async {
    try {
      final response = await dioClient!.post(
          AppConstants.machinesOrder,
          data: {
            "machine_id":machineId,
            "phone":CacheHelper.getData(key: "userPhone"),
            "slot_num":SoltNum,
            "slot_price":SoltPrice,
            "orgname":OType,
            "machine_code":machineCode,
            "machine_type":machineType,
            "item_name":itemName,
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getMachineCode(String machineId,String cat) async {
    try {
      final response = await dioClient!.post(
          AppConstants.machineCodeScanUrl,
          data: {
            "machine_code":machineId,
            "cat":cat
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getSlider() async {
    try {
      final response = await dioClient!.post(
          AppConstants.sliderUrl,
          data: {
            "cat":"top"
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }


  Future<ApiResponse> getMiddle() async {
    try {
      final response = await dioClient!.post(
          AppConstants.sliderUrl,
          data: {
            "cat":"middle"
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getMachineCategory(String machineId) async {
    try {
      final response = await dioClient!.post(
          AppConstants.machineProductCategoryUrl,
          data: {
            "machine_code":machineId
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getDispenseProduct(String machineId,
      String machineName,
      String machineType,
      String slotNum,
      String slotPrice,
      String orgName,
      String machineCode,
      String itemName,
      String catName,
      String btItemCode,
      String mac,

      ) async {
    try {
      final response = await dioClient!.post(
          AppConstants.dispenseProductUrl,
          data: {
            "machine_id":machineId,
            "machine_name":machineName,
            "machine_type":machineType,
            "phone":userPhone,
            "slot_num":slotNum,
            "slot_price":slotPrice,
            "orgname":orgName,
            "machine_code":machineCode,
            "item_name":itemName,
            "cat_name":catName,
            "bt_item_code":btItemCode,
            "mac":mac,
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }
}