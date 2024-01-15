import '../data/model/language_model.dart';

class AppConstants{
  static const String langKey = 'lang';
  static const String token = '';
  static const String phone = 'phone';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String baseurl = 'https://vendycloud.com';
  static const String registrationUri = '/mobile_files/auth/Register_users.php';
  static const String topic = 'vendyStation';
  static const String tokenUri = '/mobile_files/cm-firebase-token';
  static const String loginUri = '/mobile_files/auth/Login.php';
  static const String forgetPassword = '/mobile_files/auth/otp.php';
  static const String updatePassword = '/mobile_files/auth/update_password.php';
  static const String clients = '/mobile_files/clients/clients_data.php';
  static const String clientsUpdate = '/mobile_files/clients/update_user_company.php';
  static const String machinesList = '/mobile_files/clients/machines_list.php';
  static const String machinesProduct = '/mobile_files/clients/product_inside_machine.php';
  static const String machinesOrder = '/mobile_files/clients/app_remotly_order.php';
  static const String walletUser = '/mobile_files/wallet/user_wallet.php';
  static const String processBuyingUrl = '/mobile_files/wallet/process_buying.php';
  static const String transferUrl = '/mobile_files/wallet/transaction.php';
  static const String notificationUrl = '/mobile_files/notification/notify.php';
  static const String addSchoolUrl = '/mobile_files/schools/school_request.php';
  static const String addLinkUrl= '/mobile_files/vtouch/add_link.php';
  static const String uploadFile= '/mobile_files/vtouch/upload_files.php';
  static const String uploadImage= '/mobile_files/vtouch/vtouch_image.php';
  static const String vProductUrl= '/mobile_files/vtouch/vtouch_product.php';
  static const String schoolListUrl= '/mobile_files/schools/schools_list.php';
  static const String machinesSchoolUrl= '/mobile_files/schools/machines_schools.php';
  static const String saveLinkUrl= '/mobile_files/vtouch/preview_links.php';
  static const String activeUrl= '/mobile_files/vtouch/activate_link.php';
  static const String deleteLinkUrl= '/mobile_files/vtouch/delete_link.php';
  static const String profileVtouchUrl= '/mobile_files/vtouch/vtouch_basic.php';
  static const String saveProfileVTouchUrl= '/mobile_files/vtouch/preview_basic_data.php';
  static const String machineCodeScanUrl= '/mobile_files/wallet/scan_qr.php';
  static const String sliderUrl= '/mobile_files//home_slider.php/home_slider.php';
  static const String machineProductCategoryUrl= '/mobile_files/wallet/product_categories.php';
  static const String previewMyFamilyUrl= '/mobile_files/schools/preview_myfamily.php';
  static const String pickDigitalUrl= '/mobile_files/schools/student_data.php';
  static const String linkStudentUrl= '/mobile_files/schools/link_student_to_account.php';
  static const String StudentTransictionUrl= '/mobile_files/schools/student_transaction.php';
  static const String schoolProductListUrl= '/mobile_files/schools/school_product_list.php';
  static const String forbiddenUrl= '/mobile_files/schools/insert_forbidden.php';
  static const String allowUrl= '/mobile_files/schools/allow.php';
  static const String vTouchOrderUrl= '/mobile_files/vtouch/vtouch_order.php';
  static const String activeProductUrl= '/mobile_files/vtouch/activate_product.php';
  static const String dailyLimitUrl= '/mobile_files/schools/set_limit.php';
  static const String dispenseProductUrl= '/mobile_files/wallet/dispense_product.php';
  static const String saveCardUrl= '/mobile_files/wallet/get_saved_card.php';
  static const String deleteCardUrl= '/mobile_files/wallet/delete_card.php';
  //https://accept.paymob.com/api/auth/tokens
  static const String baseUrlAuthPayment = 'https://accept.paymob.com/api';
  static const String authPayment = '/auth/tokens';
  static const String apiKeyPayment = 'ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0luQnliMlpwYkdWZmNHc2lPalk0TVRreUxDSmpiR0Z6Y3lJNklrMWxjbU5vWVc1MEluMC43Q3BfWDRNX2gwZHE4eExISjdaQnZNSjVFb3I0cVZMSE9TeGR0ajdtcnBYWDMyc2NHTm9lTFJqNGdkSGdjQUp3dXFVOS1VUnB1WVpGSTVPcUNvaUtKQQ==';
  static const String orderIdPayment = '/ecommerce/orders';
  static const String paymentKey = '/acceptance/payment_keys';
  static const String referCode = '/acceptance/payments/pay';
  // static const String paymentFirstToken = '';
  // static const String paymentOrderId = '';
  // static String visaUrl =
  //     '$baseUrlAuthPayment/acceptance/iframes/424000?payment_token=$apiKeyPayment';



///Payment
  static const String baseUrlPayment = 'https://accept.paymob.com/api';
  static const String paymentApiKey = "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2libUZ0WlNJNkltbHVhWFJwWVd3aUxDSndjbTltYVd4bFgzQnJJam8zTVRjeU5qSjkuNnZ2bHEwMEYxaWlKcmhkbFdHNXQ5Tm81NUZjTnktMXFjU3RoOWFZZ3RLeTN2NjZYc0tpRG1wSThSRDZiNjVsNEtHNE1wbEkxTXYteTBZMkZEbnRBUFE=";
  static const String getAuthToken = '/auth/tokens';
  static const getOrderId = '/ecommerce/orders';
  static const getPaymentRequest = '/acceptance/payment_keys';
  static const getRefCode = '/acceptance/payments/pay';
  static  String getWallet = '/acceptance/payments/pay';
  static String visaUrl =
      '$baseUrlPayment/acceptance/iframes/740843?payment_token=$finalToken';
  //https://accept.paymob.com/api/acceptance/iframes/740843?
  static String cash = '$baseUrlPayment/acceptance/iframes?payment_token=$finalToken';
  static String paymentFirstToken = '';

  static String paymentOrderId = '';

  static String finalToken = '';

  static const String integrationIdCard = '3526288';
  static const String integrationIdWallet = '3542964';
//  String IntegrationIdWallet = '3542964';
  // static const String integrationIdKiosk = '3708964';

  static String refCode = '';
  static String walletCode = '';
  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: '', languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: '', languageName: 'Arabic', countryCode: 'EG', languageCode: 'ar'),
  ];
}
String? token;
String? userPhone;
String? lang;

String? mac;
String? mac2;

String? email;
String? updateEmail;
String? imagePath;
String? name;
String? pass;

///
String? nameVTouch;
String? phoneVTouch;
String? phone2VTouch;
String? emailVTouch;
String? addressVTouch;
String? webVTouch;


///
String? point;
List<bool>? switchOn;
String? fileNAME;
 bool openedFirstTime = false;
 String? company;