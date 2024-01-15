import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DispenceProduct extends StatefulWidget {
      final String machineId;
      final String machineName;
      final String machineType;
      final String slotNum;
      final String slotPrice;
      final String orgName;
      final String machineCode;
      final String itemName;
      final String catName;
      final String btItemCode;
      final String mac;
  DispenceProduct(this.machineId,this.machineName,this.machineType,this.slotNum,this.slotPrice,this.orgName,this.machineCode,this.itemName,this.catName,this.btItemCode,this.mac);
  @override
  _DispenceProductState createState() => _DispenceProductState(this.machineId,this.machineName,this.machineType,this.slotNum,this.slotPrice,this.orgName,this.machineCode,this.itemName,this.catName,this.btItemCode,this.mac);
}

class _DispenceProductState extends State<DispenceProduct> {

      final String machineId;
      final String machineName;
      final String machineType;
      final String slotNum;
      final String slotPrice;
      final String orgName;
      final String machineCode;
      final String itemName;
      final String catName;
      final String btItemCode;
      final String mac;
  _DispenceProductState(this.machineId,this.machineName,this.machineType,this.slotNum,this.slotPrice,this.orgName,this.machineCode,this.itemName,this.catName,this.btItemCode,this.mac);

 late BluetoothConnection connection;

 bool isConnecting = true;
  bool get isConnected => connection != null && connection.isConnected;

  bool isDisconnecting = false;
  bool buttonClicado = false;

  @override
  void initState() {
    super.initState();
      
     BluetoothConnection.toAddress(mac).then((_connection) {
      //    BluetoothConnection.toAddress("64:5D:86:C2:47:72").then((_connection) {

    
      connection = _connection;
      setState(() {
        
        isConnecting = false;
        isDisconnecting = false;
      });


  connection.output.add(Uint8List.fromList(utf8.encode(btItemCode)));
  




    }).catchError((error) {
      print('Failed to connect, something is wrong!');
      print(error);

       showDialog(context: context,
            builder:(context)=> AlertDialog(
              content: Text(AppLocalizations.of(context)!.bluetooth,),
      
              actions: [
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.pop(context);
                   },
                    child: Text(AppLocalizations.of(context)!.agree,))
              ],
            ));
    
    });

  /*  BluetoothConnection.toAddress("64:5D:86:C2:47:72").then((_connection) {
      print('Connected to device');
  showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Notification"),
              content: Text("Machine ready"),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });

      connection = _connection;
      setState(() {
        
        isConnecting = false;
        isDisconnecting = false;
      });

      connection!.input!.listen(_onDataReceived).onDone(() {
        // Example: Detect which side closed the connection
        // There should be `isDisconnecting` flag to show are we are (locally)
        // in middle of disconnecting process, should be set before calling
        // `dispose`, `finish` or `close`, which all causes to disconnect.
        // If we except the disconnection, `onDone` should be fired as result.
        // If we didn't except this (no flag set), it means closing by remote.
        if (isDisconnecting) {
          print('Disconnected localy!');
        } else {
          print('Disconnected remote!');
        }
        if (mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      print('Failed to connect, something is wrong!');
      print(error);
       showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Notification"),
              content: Text("Fail to connect"),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });*/
  }


   Widget build(BuildContext context) {
    var mdh =MediaQuery.of(context).size.height;
    var mdw = MediaQuery.of(context).size.width;
 

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
      height: mdh/2,
      width: mdw/2,
      child: Center(child: CircularProgressIndicator(),)
    ),

    SizedBox(
      height: 150,
    ),

      ],
    ),
      
    );
  }
}