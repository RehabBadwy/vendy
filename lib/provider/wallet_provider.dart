import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendy_station/data/model/delete_scave.dart';

import '../data/datasource/remote/dio/cash.dart';
import '../data/model/delete_scave.dart';
import '../data/model/save_card.dart';
import '../data/model/tramsfer_model.dart';
import '../data/model/wallet_user_model.dart';
import '../data/model/process_buying_model.dart';
import '../data/repo/base/api_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../data/repo/wallet_user_repo.dart';
import '../util/constant.dart';

class WalletUserProvider with ChangeNotifier {

  final WalletRepo? walletRepo;
  WalletUserProvider({required this.walletRepo});

  ///walletUser

  WalletUserModel? _walletUserModel;
  WalletUserModel? get walletUserModel => _walletUserModel;
  Future<void> getWallet(BuildContext context/*,{bool reload = false}*/,) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await walletRepo!.getWalletUser();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _walletUserModel = WalletUserModel.fromJson(apiResponse.response!.data);
      CacheHelper.saveData(
          key: 'point', value: walletUserModel!.wallet![0].walletBalance);
      point = CacheHelper.getData(key: 'point');
    } else {
      // ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }


  ///process Buying
  ProcessBuyingModel? _processBuyingModel;
  ProcessBuyingModel? get processBuyingModel => _processBuyingModel;
  Future<void> getProcessWallet(BuildContext context) async {
    ApiResponse apiResponse = await walletRepo!.getProcessBuying();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      if (ProcessBuyingModel.fromJson(apiResponse.response!.data).wallet != null) {
        _processBuyingModel = ProcessBuyingModel.fromJson(apiResponse.response!.data);
      }
      if (_processBuyingModel!.wallet!.isNotEmpty) {
        print(_processBuyingModel!.wallet![0].price);
      }
    } else {
      print(apiResponse.response?.data);
      print(_processBuyingModel!.wallet!.length);
      print("oof Client");
      // تحقق مما إذا كان هناك بيانات متاحة قبل الوصول إلى الفهرس 0
      if (_processBuyingModel!.wallet!.isNotEmpty) {
        print(_processBuyingModel!.wallet!.length);
      }
    }
    notifyListeners();
  }

///transfer
  TramsferModel? _tramsferModel;
  TramsferModel? get tramsferModel => _tramsferModel;
  Future<void> getTransfer(BuildContext context,String points, String clientfrom)async {
    ApiResponse apiResponse = await walletRepo!.getTransferWallet(points: points, clientfrom: clientfrom);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      _tramsferModel = TramsferModel.fromJson(apiResponse.response!.data);
      if(tramsferModel!.status=="success"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.success)));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.fail)));

      }
    }else {
      // ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
    }

    List<Cards> _cards= [];
    List<Cards> get cards =>_cards;
    // SaveCard? _card;
    // SaveCard? get cards =>_card;
    Future<void> getSave(BuildContext context) async {
    ApiResponse apiResponse = await walletRepo!.getSaveCard();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      if (SaveCard.fromJson(apiResponse.response!.data).cards != null) {
        _cards = SaveCard.fromJson(apiResponse.response!.data).cards!;
      }

      // if (_clientCompanyModel.isEmpty) {
      //   print(_clientCompanyModel[0].name);
      // }
    } else {
      print(apiResponse.response?.data);
     // print(_clientCompanyModel.length);
      print("oof Client");
      // تحقق مما إذا كان هناك بيانات متاحة قبل الوصول إلى الفهرس 0
      // if (_clientCompanyModel.isNotEmpty) {
      //   print(_clientCompanyModel.length);
      // }
    }
    notifyListeners();
  }

  DeleteScave? _deleteScave;
  DeleteScave? get deleteScave =>_deleteScave;
  Future<void> getDelete(BuildContext context) async {
    ApiResponse apiResponse = await walletRepo!.getDeleteCard();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      // if (SaveCard.fromJson(apiResponse.response!.data).cards != null) {
      _deleteScave = DeleteScave.fromJson(apiResponse.response!.data);



      // if (_clientCompanyModel.isEmpty) {
      //   print(_clientCompanyModel[0].name);
      // }
    } else {
      print(apiResponse.response?.data);
      // print(_clientCompanyModel.length);
      print("oof Client");
      // تحقق مما إذا كان هناك بيانات متاحة قبل الوصول إلى الفهرس 0
      // if (_clientCompanyModel.isNotEmpty) {
      //   print(_clientCompanyModel.length);
      // }
    }
    notifyListeners();
  }
}