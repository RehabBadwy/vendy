// import 'package:flutter/cupertino.dart';
// import 'package:vendy_station/data/repo/payment_repo.dart';
// import 'package:vendy_station/util/constant.dart';
//
// import '../data/repo/base/api_response.dart';
//
// class PaymentProvider with ChangeNotifier {
//
//   final PaymentRepo? paymentRepo;
//
//   PaymentProvider({required this.paymentRepo});
//
//
//   Future<void> getAuthPayment(BuildContext context) async {
//     ApiResponse apiResponse = await paymentRepo!.getAuthToken();
//     if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
//       AppConstants.paymentFirstToken;
//       apiResponse.response!.data.token;
//       return apiResponse.response!.data["token"];
//
//     }else{
//       print("${AppConstants.paymentFirstToken}");
//       print("fghjk");
//     }
//   }
//
//
//   Future<void> getAuthPaymentOrder(BuildContext context) async {
//     ApiResponse apiResponse = await paymentRepo!.getOrderPayment(
//         price: "10", firstName: "firstName", lastName: "lastName", email: "email", phone: "phone");
//     if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
//       AppConstants.paymentFirstToken;
//       apiResponse.response!.data.token;
//       return apiResponse.response!.data["id"];
//     }else{
//       print("id");
//     }
//   }
//
//
//
//   Future<void> getPaymentKey(BuildContext context) async {
//     ApiResponse apiResponse = await paymentRepo!.getPaymentRequest(
//         "10", "firstName", "lastName", "email", "phone");
//     if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
//       // AppConstants.paymentFirstToken;
//       // apiResponse.response!.data.token;
//       String fToken;
//       apiResponse.response!.data["token"];
//       fToken =apiResponse.response!.data["token"];
//       return apiResponse.response!.data["token"];
//
//     }else{
//       print("id");
//     }
//   }
// }