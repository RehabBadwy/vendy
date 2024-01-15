import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendy_station/data/model/client_company_model.dart';
import 'package:vendy_station/data/model/clients_update.dart';
import 'package:vendy_station/data/model/dispense_product.dart';
import 'package:vendy_station/data/model/machine_category.dart';
import 'package:vendy_station/data/model/machine_code_scan.dart';

import '../data/datasource/remote/dio/cash.dart';
import '../data/model/inside_machine_product_model.dart';
import '../data/model/machine_order_model.dart';
import '../data/model/machines_lost_model.dart';
import '../data/model/slider_model.dart';
import '../data/repo/base/api_response.dart';
import '../data/repo/client_repo.dart';
import '../screens/camera/dispence_product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class ClientsProvider with ChangeNotifier {

  final ClientRepo? clientRepo;

  ClientsProvider({required this.clientRepo});

  // ClientCompanyModel? _clientCompanyModel;
  // ClientCompanyModel? get clientCompanyModel => _clientCompanyModel;


  List<Clients> _clientCompanyModel = [];

  List<Clients> get clientCompanyModel => _clientCompanyModel;

  Future<void> getClientCompany(BuildContext context) async {
    ApiResponse apiResponse = await clientRepo!.getClients();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      if (ClientCompanyModel
          .fromJson(apiResponse.response!.data)
          .clients != null) {
        _clientCompanyModel = ClientCompanyModel
            .fromJson(apiResponse.response!.data)
            .clients!;
      }


      if (_clientCompanyModel.isEmpty) {
        print(_clientCompanyModel[0].name);
      }
    } else {
      print(apiResponse.response?.data);
      print(_clientCompanyModel.length);
      print("oof Client");
      // تحقق مما إذا كان هناك بيانات متاحة قبل الوصول إلى الفهرس 0
      if (_clientCompanyModel.isNotEmpty) {
        print(_clientCompanyModel.length);
      }
    }
    notifyListeners();
  }

  //
  // List<Machines> _machinesListModel=[];
  // List<Machines> get machinesListModel =>_machinesListModel;
  MachinesListModel? _machinesListModel;

  MachinesListModel? get machinesListModel => _machinesListModel;

  Future<void> getMachinesList(BuildContext context,
      String name,
      // String desc,
      // String image,
      //int index

      ) async {
    ApiResponse apiResponse = await clientRepo!.getMachinesList(
        name /*,desc,image*/);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      if (MachinesListModel.fromJson(apiResponse.response!.data).machines != null) {
        _machinesListModel = MachinesListModel.fromJson(apiResponse.response!.data);
      }
      // CacheHelper.saveData(
      //     key: 'company', value: clientCompanyModel[index].companycode);
      if (_machinesListModel!.machines!.isEmpty) {
        //  print(_machinesListModel[0].orgName);
      }
    } else {
      print(apiResponse.response?.data);
      print(_machinesListModel!.machines!.length);
      print("oof Client");
      // تحقق مما إذا كان هناك بيانات متاحة قبل الوصول إلى الفهرس 0
      if (_machinesListModel!.machines!.isEmpty) {
        print(_machinesListModel!.machines!.length);
      }
    }
    notifyListeners();
  }

  ClientsUpdate? _clientsUpdate;
  ClientsUpdate? get clientsUpdate  => _clientsUpdate;
  Future<void> getClientsUpdate(BuildContext context, String company) async {
    ApiResponse apiResponse = await clientRepo!.getClientsUpdate(company, );
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _clientsUpdate = ClientsUpdate.fromJson(apiResponse.response!.data);
    }
    notifyListeners();
  }

  List<Products> _machinesProductModel = [];

  List<Products> get machinesProductModel => _machinesProductModel;

  Future<void> getMachinesProduct(BuildContext context, String Cname,
      String type) async {
    ApiResponse apiResponse = await clientRepo!.getMachinesProduct(Cname, type);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      if (InsideMachineProductModel
          .fromJson(apiResponse.response!.data)
          .products != null) {
        _machinesProductModel = InsideMachineProductModel
            .fromJson(apiResponse.response!.data)
            .products!;
      }
      if (_machinesProductModel.isEmpty) {
        //  print(_machinesListModel[0].orgName);
      }
    } else {
      print(apiResponse.response?.data);
      print(_machinesProductModel.length);
      print("oof Client");
      // تحقق مما إذا كان هناك بيانات متاحة قبل الوصول إلى الفهرس 0
      if (_machinesProductModel.isNotEmpty) {
        print(_machinesProductModel.length);
      }
    }
    notifyListeners();
  }

  MachineOrderModel? _machineOrderModel;

  MachineOrderModel? get machineOrderModel => _machineOrderModel;

  Future<void> getMachineOrder(BuildContext context /*,{bool reload = false}*/,
      String machineId, String SoltNum, String SoltPrice,
      String OType, String machineCode, String machineType,
      String itemName) async {
    // if(reload) {
    //   _CheckoutCompleteWallet = [];
    // }
    ApiResponse apiResponse = await clientRepo!.getMachinesOrder(
        machineId,
        SoltNum,
        SoltPrice,
        OType,
        machineCode,
        machineType,
        itemName);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");
      _machineOrderModel = MachineOrderModel.fromJson(apiResponse.response!.data);
      if (machineOrderModel!.status == "fail") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.customer),
              backgroundColor: Colors.red,
            ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.success)));
      }
    } else {
      // ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }


  List<Product> _machineCodeScan = [];

  List<Product> get machineCodeScan => _machineCodeScan;

  // MachineCodeScan? _machineCodeScan;
  // MachineCodeScan? get machineCodeScan => _machineCodeScan;
  Future<void> getMachineCode(BuildContext context, String machineId,
      String cat) async {
    ApiResponse apiResponse = await clientRepo!.getMachineCode(machineId, cat);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      if (MachineCodeScan
          .fromJson(apiResponse.response!.data)
          .product != null) {
        _machineCodeScan = MachineCodeScan
            .fromJson(apiResponse.response!.data)
            .product!;
      }


      //   _machineCodeScan = MachineCodeScan.fromJson(apiResponse.response!.data);
    } else {
      // تحقق مما إذا كان هناك بيانات متاحة قبل الوصول إلى الفهرس
    }
    notifyListeners();
  }

  List<Cat> _machineProduct = [];

  List<Cat> get machineProduct => _machineProduct;

  Future<void> getMachineProduct(BuildContext context, String machineId) async {
    ApiResponse apiResponse = await clientRepo!.getMachineCategory(machineId);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      if (MachineCategory
          .fromJson(apiResponse.response!.data)
          .cat != null) {
        _machineProduct = MachineCategory
            .fromJson(apiResponse.response!.data)
            .cat!;
      }

      //   _machineCodeScan = MachineCodeScan.fromJson(apiResponse.response!.data);
    } else {
      // تحقق مما إذا كان هناك بيانات متاحة قبل الوصول إلى الفهرس
    }
    notifyListeners();
  }

  // SliderModel? _sliderModel;
  // SliderModel? get sliderModl =>_sliderModel;
  List<HomeSlider>? _sliderModel;

  List<HomeSlider>? get sliderModl => _sliderModel;

  Future<void> getSlider(BuildContext context) async {
    ApiResponse apiResponse = await clientRepo!.getSlider();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      if (SliderModel.fromJson(apiResponse.response!.data).homeSlider != null) {
        _sliderModel = SliderModel.fromJson(apiResponse.response!.data).homeSlider!;
      }


      //   _machineCodeScan = MachineCodeScan.fromJson(apiResponse.response!.data);
    } else {
      // تحقق مما إذا كان هناك بيانات متاحة قبل الوصول إلى الفهرس
    }
    notifyListeners();
  }

  List<HomeSlider>? _sliderMiddle;

  List<HomeSlider>? get sliderMiddle => _sliderMiddle;
  Future<void> getMiddle(BuildContext context) async {
    ApiResponse apiResponse = await clientRepo!.getMiddle();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      if (SliderModel.fromJson(apiResponse.response!.data).homeSlider != null) {
        _sliderMiddle = SliderModel.fromJson(apiResponse.response!.data).homeSlider!;
      }


      //   _machineCodeScan = MachineCodeScan.fromJson(apiResponse.response!.data);
    } else {
      // تحقق مما إذا كان هناك بيانات متاحة قبل الوصول إلى الفهرس
    }
    notifyListeners();
  }


  DispenseProduct? _dispenseProduct;
  DispenseProduct? get dispenseProduct =>_dispenseProduct;
  Future<void> getDispenseProduct(BuildContext context,
      String machineId,
      String machineName,
      String machineType,
      String slotNum,
      String slotPrice,
      String orgName,
      String machineCode,
      String itemName,
      String catName,
      String btItemCode,
      String mac,) async {
    ApiResponse apiResponse = await clientRepo!.getDispenseProduct(machineId, machineName, machineType, slotNum,
        slotPrice, orgName, machineCode, itemName, catName, btItemCode, mac);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200 &&apiResponse.response!.data.toString() != '{}') {
      print("fghjkl");

          _dispenseProduct = DispenseProduct.fromJson(apiResponse.response!.data);
      if (dispenseProduct!.status == "success" && mac != "" ) {
      /*  ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("success qr only"),
              backgroundColor: Colors.green,
            ));*/


Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DispenceProduct(machineId,machineName,machineType,slotNum,slotPrice,orgName,machineCode,itemName,catName,btItemCode,mac)));











        // showDialog(context: context,
        //     builder:(context)=> AlertDialog(
        //       content: Text("success"),
        //       actions: [
        //         TextButton(
        //             onPressed: (){
        //               Navigator.pop(context);
        //             },
        //             child: Text("Agree"))
        //       ],
        //     ));
      } else if(dispenseProduct!.status == "success" && mac == "" ){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("dispense"),
              backgroundColor: Colors.green,
            ));
        // showDialog(context: context,
        //     builder:(context)=> AlertDialog(
        //       content: Text("Call Customer Service"),
        //
        //       actions: [
        //         TextButton(
        //             onPressed: (){
        //               Navigator.pop(context);
        //             },
        //             child: Text("Agree"))
        //       ],
        //     ));
      }
      
      
      
      
      else if(dispenseProduct!.status == "fail"){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Check Your Balance"),
              backgroundColor: Colors.red,
            ));
        // showDialog(context: context,
        //     builder:(context)=> AlertDialog(
        //       content: Text("Call Customer Service"),
        //
        //       actions: [
        //         TextButton(
        //             onPressed: (){
        //               Navigator.pop(context);
        //             },
        //             child: Text("Agree"))
        //       ],
        //     ));
      
      }
    } else {
      //ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }
}
