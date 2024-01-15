// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Special Discount`
  String get special {
    return Intl.message(
      'Special Discount',
      name: 'special',
      desc: '',
      args: [],
    );
  }

  /// `Machine Scan`
  String get machine {
    return Intl.message(
      'Machine Scan',
      name: 'machine',
      desc: '',
      args: [],
    );
  }

  /// `Profile Company`
  String get profile {
    return Intl.message(
      'Profile Company',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about {
    return Intl.message(
      'About Us',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Machines`
  String get offer {
    return Intl.message(
      'Machines',
      name: 'offer',
      desc: '',
      args: [],
    );
  }

  /// `Enter ID`
  String get enter {
    return Intl.message(
      'Enter ID',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `ID Wrong`
  String get wrong {
    return Intl.message(
      'ID Wrong',
      name: 'wrong',
      desc: '',
      args: [],
    );
  }

  /// `Activate Bussiness Card`
  String get activate {
    return Intl.message(
      'Activate Bussiness Card',
      name: 'activate',
      desc: '',
      args: [],
    );
  }

  /// `Make Order`
  String get order {
    return Intl.message(
      'Make Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Order Now`
  String get now {
    return Intl.message(
      'Order Now',
      name: 'now',
      desc: '',
      args: [],
    );
  }

  /// `Choose How To Activeate your Product`
  String get choose {
    return Intl.message(
      'Choose How To Activeate your Product',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Credit Type`
  String get credit {
    return Intl.message(
      'Credit Type',
      name: 'credit',
      desc: '',
      args: [],
    );
  }

  /// `Create Now`
  String get create {
    return Intl.message(
      'Create Now',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Add New Link`
  String get link {
    return Intl.message(
      'Add New Link',
      name: 'link',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Share VTouch`
  String get share {
    return Intl.message(
      'Share VTouch',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Do You Want Delete`
  String get delete {
    return Intl.message(
      'Do You Want Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Add Whatsapp`
  String get whatsapp {
    return Intl.message(
      'Add Whatsapp',
      name: 'whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Whatsapp`
  String get whats {
    return Intl.message(
      'Whatsapp',
      name: 'whats',
      desc: '',
      args: [],
    );
  }

  /// `Whatsapp Number`
  String get number {
    return Intl.message(
      'Whatsapp Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `back`
  String get back {
    return Intl.message(
      'back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Social Media`
  String get social {
    return Intl.message(
      'Social Media',
      name: 'social',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get music {
    return Intl.message(
      'Music',
      name: 'music',
      desc: '',
      args: [],
    );
  }

  /// `Web`
  String get web {
    return Intl.message(
      'Web',
      name: 'web',
      desc: '',
      args: [],
    );
  }

  /// `Save Profile VTouch`
  String get save {
    return Intl.message(
      'Save Profile VTouch',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Profile VTouch`
  String get vTouch {
    return Intl.message(
      'Profile VTouch',
      name: 'vTouch',
      desc: '',
      args: [],
    );
  }

  /// `Scan VTouch`
  String get scan {
    return Intl.message(
      'Scan VTouch',
      name: 'scan',
      desc: '',
      args: [],
    );
  }

  /// `Share App`
  String get app {
    return Intl.message(
      'Share App',
      name: 'app',
      desc: '',
      args: [],
    );
  }

  /// `Upload File`
  String get upload {
    return Intl.message(
      'Upload File',
      name: 'upload',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profileone {
    return Intl.message(
      'Profile',
      name: 'profileone',
      desc: '',
      args: [],
    );
  }

  /// `New Product`
  String get product {
    return Intl.message(
      'New Product',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get sea {
    return Intl.message(
      'See all',
      name: 'sea',
      desc: '',
      args: [],
    );
  }

  /// `Our Clients`
  String get partners {
    return Intl.message(
      'Our Clients',
      name: 'partners',
      desc: '',
      args: [],
    );
  }

  /// `Machines`
  String get machines {
    return Intl.message(
      'Machines',
      name: 'machines',
      desc: '',
      args: [],
    );
  }

  /// `Your request has been \nsent successfully`
  String get successfully {
    return Intl.message(
      'Your request has been \nsent successfully',
      name: 'successfully',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get home {
    return Intl.message(
      'Back to Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `About Vendy`
  String get vendy {
    return Intl.message(
      'About Vendy',
      name: 'vendy',
      desc: '',
      args: [],
    );
  }

  /// `Vendy is a leading  Service ,we seamlessly connect customers with their favourite,it takes just few taps from our platefrom to place an order through vendy from your favourite place`
  String get service {
    return Intl.message(
      'Vendy is a leading  Service ,we seamlessly connect customers with their favourite,it takes just few taps from our platefrom to place an order through vendy from your favourite place',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `Get Help`
  String get help {
    return Intl.message(
      'Get Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Terms Condition`
  String get terms {
    return Intl.message(
      'Terms Condition',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `Discover the features of your account now`
  String get discover {
    return Intl.message(
      'Discover the features of your account now',
      name: 'discover',
      desc: '',
      args: [],
    );
  }

  /// `My Wallet`
  String get wallet {
    return Intl.message(
      'My Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get out {
    return Intl.message(
      'Log Out',
      name: 'out',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Visa`
  String get visa {
    return Intl.message(
      'Visa',
      name: 'visa',
      desc: '',
      args: [],
    );
  }

  /// `you can pay directly by your credit card \n when check save card box in next screen \n but you must pay minimum 1 EGP  first time \n to save your data`
  String get check {
    return Intl.message(
      'you can pay directly by your credit card \n when check save card box in next screen \n but you must pay minimum 1 EGP  first time \n to save your data',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message(
      'Balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get transfer {
    return Intl.message(
      'Transfer',
      name: 'transfer',
      desc: '',
      args: [],
    );
  }

  /// `Charge`
  String get charge {
    return Intl.message(
      'Charge',
      name: 'charge',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get transaction {
    return Intl.message(
      'Transaction',
      name: 'transaction',
      desc: '',
      args: [],
    );
  }

  /// `Saved cards`
  String get cards {
    return Intl.message(
      'Saved cards',
      name: 'cards',
      desc: '',
      args: [],
    );
  }

  /// `myPoints`
  String get point {
    return Intl.message(
      'myPoints',
      name: 'point',
      desc: '',
      args: [],
    );
  }

  /// `braceletsOrCards`
  String get braceletsOrCards {
    return Intl.message(
      'braceletsOrCards',
      name: 'braceletsOrCards',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get deletee {
    return Intl.message(
      'Delete',
      name: 'deletee',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget {
    return Intl.message(
      'Forget Password?',
      name: 'forget',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get account {
    return Intl.message(
      'Don’t have an account?',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Register Now `
  String get registernow {
    return Intl.message(
      'Register Now ',
      name: 'registernow',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmpassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmpassword',
      desc: '',
      args: [],
    );
  }

  /// `Hello! Register to get \nstarted`
  String get hello {
    return Intl.message(
      'Hello! Register to get \nstarted',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already {
    return Intl.message(
      'Already have an account?',
      name: 'already',
      desc: '',
      args: [],
    );
  }

  /// `Login Now`
  String get loginnow {
    return Intl.message(
      'Login Now',
      name: 'loginnow',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back! Glad \nto see you, Again!`
  String get welcome {
    return Intl.message(
      'Welcome back! Glad \nto see you, Again!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed!`
  String get passwordchanged {
    return Intl.message(
      'Password Changed!',
      name: 'passwordchanged',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed \n successfully.`
  String get passwordchang {
    return Intl.message(
      'Your password has been changed \n successfully.',
      name: 'passwordchang',
      desc: '',
      args: [],
    );
  }

  /// `Back To Login`
  String get backtologin {
    return Intl.message(
      'Back To Login',
      name: 'backtologin',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get verification {
    return Intl.message(
      'OTP Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `verification code`
  String get verificationcode {
    return Intl.message(
      'verification code',
      name: 'verificationcode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t received code?`
  String get receivedcode {
    return Intl.message(
      'Didn’t received code?',
      name: 'receivedcode',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry! It occurs. Please enter the email address linked with your account.`
  String get dontworry {
    return Intl.message(
      'Don\'t worry! It occurs. Please enter the email address linked with your account.',
      name: 'dontworry',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Remember Password?`
  String get rememberpassword {
    return Intl.message(
      'Remember Password?',
      name: 'rememberpassword',
      desc: '',
      args: [],
    );
  }

  /// `Create new password`
  String get createnewpassword {
    return Intl.message(
      'Create new password',
      name: 'createnewpassword',
      desc: '',
      args: [],
    );
  }

  /// `Your new password must be unique from those previously used.`
  String get unique {
    return Intl.message(
      'Your new password must be unique from those previously used.',
      name: 'unique',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetpassword {
    return Intl.message(
      'Reset Password',
      name: 'resetpassword',
      desc: '',
      args: [],
    );
  }

  /// `Scan QR Code`
  String get scanqrcode {
    return Intl.message(
      'Scan QR Code',
      name: 'scanqrcode',
      desc: '',
      args: [],
    );
  }

  /// `MY QR CODE`
  String get myqrcode {
    return Intl.message(
      'MY QR CODE',
      name: 'myqrcode',
      desc: '',
      args: [],
    );
  }

  /// `QR Code List`
  String get qr {
    return Intl.message(
      'QR Code List',
      name: 'qr',
      desc: '',
      args: [],
    );
  }

  /// `check your bluetooth or try again`
  String get bluetooth {
    return Intl.message(
      'check your bluetooth or try again',
      name: 'bluetooth',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get agree {
    return Intl.message(
      'Agree',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `Machine Scan`
  String get machinescan {
    return Intl.message(
      'Machine Scan',
      name: 'machinescan',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get goodmorning {
    return Intl.message(
      'Good Morning',
      name: 'goodmorning',
      desc: '',
      args: [],
    );
  }

  /// `Add Family`
  String get addfamily {
    return Intl.message(
      'Add Family',
      name: 'addfamily',
      desc: '',
      args: [],
    );
  }

  /// `All My Family`
  String get allmyfamily {
    return Intl.message(
      'All My Family',
      name: 'allmyfamily',
      desc: '',
      args: [],
    );
  }

  /// `Pick Your school`
  String get pickyourschool {
    return Intl.message(
      'Pick Your school',
      name: 'pickyourschool',
      desc: '',
      args: [],
    );
  }

  /// `Add Your School`
  String get addyourschool {
    return Intl.message(
      'Add Your School',
      name: 'addyourschool',
      desc: '',
      args: [],
    );
  }

  /// `School Name`
  String get schoolname {
    return Intl.message(
      'School Name',
      name: 'schoolname',
      desc: '',
      args: [],
    );
  }

  /// `Id Number`
  String get idnumber {
    return Intl.message(
      'Id Number',
      name: 'idnumber',
      desc: '',
      args: [],
    );
  }

  /// `Student Name`
  String get studentname {
    return Intl.message(
      'Student Name',
      name: 'studentname',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Call Customer Service`
  String get customer {
    return Intl.message(
      'Call Customer Service',
      name: 'customer',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Fail`
  String get fail {
    return Intl.message(
      'Fail',
      name: 'fail',
      desc: '',
      args: [],
    );
  }

  /// `We will communicate soon`
  String get soon {
    return Intl.message(
      'We will communicate soon',
      name: 'soon',
      desc: '',
      args: [],
    );
  }

  /// `PLEASE READ THESE TERMS CAREFULLY BEFORE ACCESSING OR USING THE APPLICATION. YOU ACKNOWLEDGE THAT THE TERMS ARE SUBJECT TO CONTINOUS MODIFICATIONS, PLEASE REVIEW FREQUENTLY. BY ACCESS AND USE YOU AGREE TO THE TERMS AS MODIFThe present terms of use (the “Terms”) represent the mutual understanding and binding agreement between yourself (and any person you choose to associate with your account) (“you” and/or “the user”) and vendy L.L.C. (“vendy”) governing the access to and the usage of vendy website, mobile, tablet or other smart devices applications in addition to such software stored on servers whether owned or used by us (collectively “Application”) and any associated vendy Digital ID or wearable accessory of any kindYour installation, maintenance on your device and/or use of the Application is on the premise and pursuant to the provisions of these present Terms as may be unilaterally amended from time to timeYour installation, maintenance on your device and/or use of the Application is on the premise and pursuant to the provisions of these present Terms as may be unilaterally amended from time to time.By using the services offered by vendy you acknowledge that (i) you have unconditionally and irrevocably agreed to be legally bound by the provisions of the Terms, and (ii) you declare that you are a natural person with full capacity to enter into this agreement.vendy has developed a smart payment and information solution whereby the user will use the Application and digital IDs supplied by vendy as a substitute for cash and an attendance logging system, in a way that the digital ID will be linked to the user’s app and the user shall be able to use the Application and/or Digital ID as a means of payment with the agreed upon third parties service providers, recharging by credit card in-app or by cash on school premises or using other recharge methods.vendy hereby may not be held responsible for any wrongful, mistaken, invalid or erroneous information, damages, lost data, and software viruses, resulting from or in connection with the use or inability to use the services of vendy. Moreover vendy may not be held responsible for the theft, loss of, damage to the digital ID or any wearable accessory used to operate the vendy Application. In case the digital ID is lost, stolen or damaged in any way whatsoever, the user shall purchase a new digital ID in full price.vendy shall not incur any liability for any damages, including but not limited to, direct, indirect, special, or consequential damages arising out of, resulting from, or any way connected to the use of their services.You understand that your user name and pin code, any passwords do exclusively belong to you, thus, you should not disclose them to any third party `
  String get termscontent {
    return Intl.message(
      'PLEASE READ THESE TERMS CAREFULLY BEFORE ACCESSING OR USING THE APPLICATION. YOU ACKNOWLEDGE THAT THE TERMS ARE SUBJECT TO CONTINOUS MODIFICATIONS, PLEASE REVIEW FREQUENTLY. BY ACCESS AND USE YOU AGREE TO THE TERMS AS MODIFThe present terms of use (the “Terms”) represent the mutual understanding and binding agreement between yourself (and any person you choose to associate with your account) (“you” and/or “the user”) and vendy L.L.C. (“vendy”) governing the access to and the usage of vendy website, mobile, tablet or other smart devices applications in addition to such software stored on servers whether owned or used by us (collectively “Application”) and any associated vendy Digital ID or wearable accessory of any kindYour installation, maintenance on your device and/or use of the Application is on the premise and pursuant to the provisions of these present Terms as may be unilaterally amended from time to timeYour installation, maintenance on your device and/or use of the Application is on the premise and pursuant to the provisions of these present Terms as may be unilaterally amended from time to time.By using the services offered by vendy you acknowledge that (i) you have unconditionally and irrevocably agreed to be legally bound by the provisions of the Terms, and (ii) you declare that you are a natural person with full capacity to enter into this agreement.vendy has developed a smart payment and information solution whereby the user will use the Application and digital IDs supplied by vendy as a substitute for cash and an attendance logging system, in a way that the digital ID will be linked to the user’s app and the user shall be able to use the Application and/or Digital ID as a means of payment with the agreed upon third parties service providers, recharging by credit card in-app or by cash on school premises or using other recharge methods.vendy hereby may not be held responsible for any wrongful, mistaken, invalid or erroneous information, damages, lost data, and software viruses, resulting from or in connection with the use or inability to use the services of vendy. Moreover vendy may not be held responsible for the theft, loss of, damage to the digital ID or any wearable accessory used to operate the vendy Application. In case the digital ID is lost, stolen or damaged in any way whatsoever, the user shall purchase a new digital ID in full price.vendy shall not incur any liability for any damages, including but not limited to, direct, indirect, special, or consequential damages arising out of, resulting from, or any way connected to the use of their services.You understand that your user name and pin code, any passwords do exclusively belong to you, thus, you should not disclose them to any third party ',
      name: 'termscontent',
      desc: '',
      args: [],
    );
  }

  /// `Round Policy`
  String get roundpolicy {
    return Intl.message(
      'Round Policy',
      name: 'roundpolicy',
      desc: '',
      args: [],
    );
  }

  /// `-Users must contact customer support within 14 days of the recharge date to request a refund.\n- Refund requests must be submitted in writing, providing transaction details and a clear explanation.\n- Approved refunds will be initiated within 21 business days.\n- Refunds will only be considered for registered members of the closed community who have utilized the Provider's payment services.\n- You agree and understand that the Provider has the final decision on refund requests, except in cases where the closed community management has the final say.\n- Refunds may be denied for incomplete information, fraudulent requests, or violations of terms of service.\n- The Provider will engage with the closed community management in cases of disputes to reach a resolution.`
  String get roundcontent {
    return Intl.message(
      '-Users must contact customer support within 14 days of the recharge date to request a refund.\n- Refund requests must be submitted in writing, providing transaction details and a clear explanation.\n- Approved refunds will be initiated within 21 business days.\n- Refunds will only be considered for registered members of the closed community who have utilized the Provider\'s payment services.\n- You agree and understand that the Provider has the final decision on refund requests, except in cases where the closed community management has the final say.\n- Refunds may be denied for incomplete information, fraudulent requests, or violations of terms of service.\n- The Provider will engage with the closed community management in cases of disputes to reach a resolution.',
      name: 'roundcontent',
      desc: '',
      args: [],
    );
  }

  /// `What is Vendy?`
  String get vendyhelp {
    return Intl.message(
      'What is Vendy?',
      name: 'vendyhelp',
      desc: '',
      args: [],
    );
  }

  /// `Vendy is a leading online Service ,we seamlessly connect customers with their favourite,it takes just few taps from our platefrom`
  String get vendyhelpcontent {
    return Intl.message(
      'Vendy is a leading online Service ,we seamlessly connect customers with their favourite,it takes just few taps from our platefrom',
      name: 'vendyhelpcontent',
      desc: '',
      args: [],
    );
  }

  /// `Do you have special offer?`
  String get specialoffer {
    return Intl.message(
      'Do you have special offer?',
      name: 'specialoffer',
      desc: '',
      args: [],
    );
  }

  /// `yes, You can view that latest promotions and discount coupon in offers`
  String get specialoffercontent {
    return Intl.message(
      'yes, You can view that latest promotions and discount coupon in offers',
      name: 'specialoffercontent',
      desc: '',
      args: [],
    );
  }

  /// `How do i place an order on Vendy?`
  String get ordervendy {
    return Intl.message(
      'How do i place an order on Vendy?',
      name: 'ordervendy',
      desc: '',
      args: [],
    );
  }

  /// `Go to Vendy App , log in with your account, then place an order from favorite`
  String get ordervendycontent {
    return Intl.message(
      'Go to Vendy App , log in with your account, then place an order from favorite',
      name: 'ordervendycontent',
      desc: '',
      args: [],
    );
  }

  /// `Why should i use Vendy on a Phone?`
  String get phonevendy {
    return Intl.message(
      'Why should i use Vendy on a Phone?',
      name: 'phonevendy',
      desc: '',
      args: [],
    );
  }

  /// `Vendy is the one huge vendy machine,so you dont need to go through the hassle of finding machines`
  String get phonevendycontent {
    return Intl.message(
      'Vendy is the one huge vendy machine,so you dont need to go through the hassle of finding machines',
      name: 'phonevendycontent',
      desc: '',
      args: [],
    );
  }

  /// `How can i contact Vendy.com?`
  String get contact {
    return Intl.message(
      'How can i contact Vendy.com?',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `You can contact us anytime through call us (we operate 24 hours) or send your feedback through the Facebook`
  String get contactcontent {
    return Intl.message(
      'You can contact us anytime through call us (we operate 24 hours) or send your feedback through the Facebook',
      name: 'contactcontent',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address`
  String get emailmust {
    return Intl.message(
      'Enter a valid email address',
      name: 'emailmust',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get phonemust {
    return Intl.message(
      'Enter a valid phone number',
      name: 'phonemust',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get namemust {
    return Intl.message(
      'Enter your name',
      name: 'namemust',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid Password`
  String get passmust {
    return Intl.message(
      'Enter a valid Password',
      name: 'passmust',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid Confirm Password`
  String get passconfirmmust {
    return Intl.message(
      'Enter a valid Confirm Password',
      name: 'passconfirmmust',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Amount in EGP !`
  String get amountmust {
    return Intl.message(
      'Please enter Amount in EGP !',
      name: 'amountmust',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to Exit`
  String get exit {
    return Intl.message(
      'Do you want to Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `links`
  String get links {
    return Intl.message(
      'links',
      name: 'links',
      desc: '',
      args: [],
    );
  }

  /// `Preview`
  String get preview {
    return Intl.message(
      'Preview',
      name: 'preview',
      desc: '',
      args: [],
    );
  }

  /// `No Available Preview`
  String get no {
    return Intl.message(
      'No Available Preview',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Share data`
  String get data {
    return Intl.message(
      'Share data',
      name: 'data',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
