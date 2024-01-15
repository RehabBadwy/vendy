import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendy_station/data/datasource/remote/dio/cash.dart';

import '../../util/constant.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import 'base/api_response.dart';

class WalletRepo{
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  WalletRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> getWalletUser() async {
    try {
      final response = await dioClient!.post(
          AppConstants.walletUser,
          data: {
            "phone":CacheHelper.getData(key: "userPhone"),
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getProcessBuying() async {
    try {
      final response = await dioClient!.post(
          AppConstants.processBuyingUrl,
          data: {
            "phone":CacheHelper.getData(key: "userPhone"),
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getTransferWallet({required String points,required String clientfrom}) async {
    try {
      final response = await dioClient!.post(
          AppConstants.transferUrl,
          data: {
            "phoneto":clientfrom,
            "points":points,
            "clientphonefrom":CacheHelper.getData(key: "userPhone"),
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getSaveCard() async {
    try {
      final response = await dioClient!.post(
          AppConstants.saveCardUrl,
          data: {
            "email":email
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }

  Future<ApiResponse> getDeleteCard() async {
    try {
      final response = await dioClient!.post(
          AppConstants.deleteCardUrl,
          data: {
            "email":email
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }
}