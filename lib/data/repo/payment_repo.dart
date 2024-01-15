// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:vendy_station/data/datasource/remote/dio/dio_payment.dart';
//
// import '../../util/constant.dart';
// import '../datasource/remote/exception/api_error_handler.dart';
// import 'base/api_response.dart';
//
// class PaymentRepo {
//   final DioHelperPayment? dioPayment;
//   final SharedPreferences? sharedPreferences;
//
//   PaymentRepo({required this.dioPayment, required this.sharedPreferences});
//
//   Future<ApiResponse> getAuthToken() async {
//     try {
//       final response = await dioPayment!.post(
//           AppConstants.authPayment,
//           data: {
//             "api_key":AppConstants.apiKeyPayment
//           }
//       );
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//     }
//   }
//
// //
//   Future<ApiResponse> getOrderPayment({
//     required String price,
//     required String firstName,
//     required String lastName,
//     required String email,
//     required String phone,
//   }) async {
//     try {
//       final response = await dioPayment!.post(
//           AppConstants.orderIdPayment,
//           data: {
//             'auth_token': AppConstants.paymentFirstToken,
//             "delivery_needed": "false",
//             "amount_cents": price,
//             "currency": "EGP",
//             "items": [],
//           }
//       );
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//     }
//   }
//
//
//
//   Future<ApiResponse> getPaymentRequest(
//     String priceOrder,
//     String firstName,
//     String lastName,
//     String email,
//     String phone,
//   ) async {
//     try{
//       final response = await  dioPayment!.post(AppConstants.paymentKey,
//         data: {
//           "auth_token": AppConstants.paymentFirstToken,
//           "amount_cents": priceOrder,
//           "expiration": 3600,
//           "order_id": AppConstants.paymentOrderId,
//           "billing_data": {
//             "apartment": "NA",
//             "email": email,
//             "floor": "NA",
//             "first_name": firstName,
//             "street": "NA",
//             "building": "NA",
//             "phone_number": phone,
//             "shipping_method": "NA",
//             "postal_code": "NA",
//             "city": "NA",
//             "country": "NA",
//             "last_name": lastName,
//             "state": "NA"
//           },
//           "currency": "EGP",
//           // "integration_id": AppContest.integrationIdCard,
//           "lock_order_when_paid": "false"
//         },
//       );
//       return ApiResponse.withSuccess(response);
//     }catch(e){
//       return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//     }
//   }
// }