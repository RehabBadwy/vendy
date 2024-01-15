import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendy_station/data/model/wallet_payment.dart';

import 'package:vendy_station/screens/payment/payment/cubit/state.dart';
import 'package:vendy_station/util/constant.dart';

import '../../../../data/datasource/remote/dio/dio_payment.dart';
import '../../../../data/model/authentication_request_model.dart';
import '../../../../data/model/order_registration_model.dart';



class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialStates());
  static PaymentCubit get(context) => BlocProvider.of(context);
  AuthenticationRequestModel? authTokenModel;
  WalletPayment? walletPayment;
  Future<void> getAuthToken() async {
    emit(PaymentAuthLoadingStates());
    DioHelperPayment.postData(url: AppConstants.getAuthToken, data: {
      'api_key': AppConstants.paymentApiKey,
    }).then((value) {
      authTokenModel = AuthenticationRequestModel.fromJson(value.data);
      AppConstants.paymentFirstToken = value.data["token"].toString();
        //  authTokenModel!.token;
      print('The token 🍅');
      emit(PaymentAuthSuccessStates());
    }).catchError((error) {
      print('Error in auth token 🤦‍♂️');
      emit(
        PaymentAuthErrorStates(error.toString()),
      );
    });
  }

  Future getOrderRegistrationID({
     required String price,
    // required String firstName,
    // required String lastName,
    // required String email,
    // required String phone,
  }) async {
    emit(PaymentOrderIdLoadingStates());
    DioHelperPayment.postData(url: AppConstants.getOrderId, data: {
      'auth_token': AppConstants.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": "${price}",
      "currency": "EGP",
      "items": [],
    }).then((value) {
      OrderRegistrationModel orderRegistrationModel = OrderRegistrationModel.fromJson(value.data);
      AppConstants.paymentOrderId = value.data["id"].toString();
          //orderRegistrationModel.id.toString();
      getPaymentRequest(price/*, firstName, lastName, email, phone*/);
      print('The order id 🍅 =${AppConstants.paymentOrderId}');
      emit(PaymentOrderIdSuccessStates());
    }).catchError((error) {
      print('Error in order id ${AppConstants.paymentOrderId}️');
      emit(
        PaymentOrderIdErrorStates(error.toString()),
      );
    });
  }

  // for final request token

  Future<void> getPaymentRequest(
    String priceOrder,
    // String firstName,
    // String lastName,
    // String email,
    // String phone,
  ) async {
    emit(PaymentRequestTokenLoadingStates());
    DioHelperPayment.postData(
      url: AppConstants.getPaymentRequest,
      data: {
        "auth_token": AppConstants.paymentFirstToken,
        "amount_cents": priceOrder,
        "expiration": 3600,
        "order_id": AppConstants.paymentOrderId,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": name,
          "street": "NA",
          "building": "NA",
          "phone_number": userPhone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": name,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": AppConstants.integrationIdCard,
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      //PaymentRequestModel paymentRequestModel = PaymentRequestModel.fromJson(value.data);
      AppConstants.finalToken = value.data["token"].toString();
        //  paymentRequestModel.token;
      print('Final token 🚀 ${AppConstants.finalToken}');
      emit(PaymentRequestTokenSuccessStates());
    }).catchError((error) {
      print('Error in final token 🤦‍♂️');
      emit(
        PaymentRequestTokenErrorStates(error.toString()),
      );
    });
  }
///
  Future getRefCode() async {
    DioHelperPayment.postData(
      url: AppConstants.getRefCode,
      data: {
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR",
        },
        "payment_token": AppConstants.finalToken,
      },
    ).then((value) {
      AppConstants.refCode = value.data['id'].toString();
      print('The ref code 🍅${AppConstants.refCode}');
      emit(PaymentRefCodeSuccessStates());
    }).catchError((error) {
      print("Error in ref code 🤦‍♂️");
      emit(PaymentRefCodeErrorStates(error.toString()));
    });
  }
  Future getOrderWalletRegistrationID({
    required String price,
     required String walletNumber,
    // required String lastName,
    // required String email,
    // required String phone,
  }) async {
    emit(PaymentWalletOrderLoadingStates());
    DioHelperPayment.postData(url: AppConstants.getOrderId, data: {
      'auth_token': AppConstants.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": "${price}",
      "currency": "EGP",
      "items": [],
    }).then((value) {
      OrderRegistrationModel orderRegistrationModel = OrderRegistrationModel.fromJson(value.data);
      AppConstants.paymentOrderId = value.data["id"].toString();
      //orderRegistrationModel.id.toString();
      getPaymentWalletRequest(price/*, firstName, lastName, email, phone*/,walletNumber);

      print('The order id 🍅 =${AppConstants.paymentOrderId}');
      emit(PaymentWalletOrderSuccessStates());
    }).catchError((error) {
      print('Error in order id ${AppConstants.paymentOrderId}️');
      emit(
        PaymentWalletOrderErrorStates(error.toString()),
      );
    });
  }

  Future<void> getPaymentWalletRequest(
      String priceOrder,
      String walletNumber,
      // String firstName,
      // String lastName,
      // String email,
      // String phone,
      ) async {
    emit(PaymentRequestWalletTokenLoadingStates());
    DioHelperPayment.postData(
      url: AppConstants.getPaymentRequest,
      data: {
        "auth_token": AppConstants.paymentFirstToken,
        "amount_cents": "${priceOrder}",
        "expiration": 3600,
        "order_id": AppConstants.paymentOrderId,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": name,
          "street": "NA",
          "building": "NA",
          "phone_number": userPhone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": name,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": AppConstants.integrationIdWallet,
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      //PaymentRequestModel paymentRequestModel = PaymentRequestModel.fromJson(value.data);
      AppConstants.finalToken = value.data["token"].toString();
      //  paymentRequestModel.token;

      print('Final token 🚀 ${AppConstants.finalToken}');
      walletUrl(walletNumber,AppConstants.finalToken);
      emit(PaymentRequestWalletTokenSuccessStates());
    }).catchError((error) {
      print('Error in final token 🤦‍♂️');
      emit(
        PaymentRequestWalletTokenErrorStates(error.toString()),
      );
    });
  }

  Future walletUrl(String walletNumber,Overfinal) async {
    print("getwalleturl");

    DioHelperPayment.postData(
      url: AppConstants.getWallet,
      data: {
        "source": {
          "identifier": walletNumber,
          "subtype": "WALLET",
        },
        "payment_token": Overfinal,
      },

    ).then((value) {
    //  WalletPayment walletPayment = WalletPayment.fromJson(value.data);
    //   print("Response Status Code: ${value.statusCode}");
    //
    //   print("Response Data: ${value.data["redirect_url"]}");
    //   if (value.data['redirect_url'] != null&&value.data['redirect_url'] =="") {
    //
    //     AppConstants.walletCode = value.data['redirect_url'].toString();
    //
    //     print("wallet url : ${AppConstants.walletCode}");
    //   } else {
    //     print("redirect_url is null in the response");
    //   }

      AppConstants.walletCode  = "${value.data['redirect_url'].toString()}";
      print(value.data['redirect_url'].toString());
      print(value.data['pending'].toString());

      print("wallet url : ${AppConstants.walletCode}");
      print('The wallet 🍅${AppConstants.walletCode}');
      emit(PaymentWalletSuccessStates());
    }).catchError((error) {
      print("Error wallet 🤦‍♂️");
      emit(PaymentWalletErrorStates(error.toString()));
    });
  }

  // Future getWalletUrl(String phone, String finaltokenvar) async {
  //   print("getwalleturl");
  //   DioHelperPayment.postData(url: 'acceptance/payments/pay', data: {
  //     "source": {"identifier": phone, "subtype": "WALLET"},
  //     "payment_token": finaltokenvar
  //   }).then((value) {
  //     WalletUrl = value.data['redirect_url'].toString();
  //     print('WalletUrl : ${WalletUrl}');
  //     emit(PaymentwalletCodeSuccessState());
  //   }).catchError((error) {
  //     print("error");
  //     print(error);
  //     emit(PaymentwalletCodeErrorState(error));
  //   });
  // }
}
