import 'package:shared_preferences/shared_preferences.dart';
import '../../util/constant.dart';
import '../datasource/remote/dio/cash.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import 'base/api_response.dart';


class NotificationRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  NotificationRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> getNotification() async {
    try {
      final response = await dioClient!.post(
          AppConstants.notificationUrl,
          data: {
            "phone":userPhone,
          }
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }
  }


}