import 'dart:async';
import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:vendy_station/screens/dashboard/dashboard.dart';
import 'package:vendy_station/util/color_manager.dart';
import 'package:vendy_station/util/constant.dart';
import '../../data/datasource/remote/dio/cash.dart';
import '../onBoarding/onboard_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen ({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}


class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  final GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();

  String connectionStatus = 'Unknown';
  bool firstTime = true;
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    token = CacheHelper.getData(key: 'token');

    checkInternetConnection();
    // Set up a listener to listen for changes in connectivity
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      checkInternetConnection();
    });
  //  _route();

  }

  checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        connectionStatus = 'No Internet connection';
      });
    } else {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          setState(() {
            connectionStatus = 'Connected to the Internet';
            _route();

          });
        }
      } on SocketException catch (_) {
        setState(() {
          connectionStatus = 'No Internet connection';

        });
      }
    }
  }








  void _route() {
    // bool openedFirstTime=false;
    ///
    Timer(const Duration(seconds: 5), () {
      token = CacheHelper.getData(key: 'token');
      // token != null  && token !="" ? const DashboardScreen() : const OnBoardingScreen();
      // if(openedFirstTime == null || openedFirstTime == true){
      //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const OnBoardingScreen()));
      // }
      // else
        if(token!=null && token !=""){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const DashboardScreen()));
       }else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const OnBoardingScreen()));
       }
    });
  }


  @override
  Widget build(BuildContext context) {

    return  connectionStatus=="Connected to the Internet"?
      Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: ColorManager.brown,
            child:
            // Image.asset(
            //   'assets/splach.gif',
            //   width: 1200.00, // adjust the width as needed
            //   height: 1800.00, // adjust the height as needed
            //
            // ),
            Image.asset(
              'assets/images/logo.png',
            ),
          ),
        )
    ): Scaffold(
        body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child:Center(
               child:   Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.asset('assets/images/wifii-.png'),
                   //adjust the height as neededwidth: 250),
                   SizedBox(height: 20,),
                   Text("No Internet",
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 18
                   ),
                   )
                 ],
               ),
              )
          ),
        )
    );
  }

  Widget loading() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      ),
    );
  }

  Widget connected(String type) {
    return Center(
      child: Text(
        "$type Connected",
        style: const TextStyle(
          color: Colors.green,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget noInternet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/no_internet.png',
          color: Colors.red,
          height: 100,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: const Text(
            "No Internet connection",
            style: TextStyle(fontSize: 22),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: const Text("Check your connection, then refresh the page."),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          onPressed: () async {
            // You can also check the internet connection through this below function as well
            ConnectivityResult result = await Connectivity().checkConnectivity();
            print(result.toString());
          },
          child: const Text("Refresh"),
        ),
      ],
    );
  }
  // showDialogBox() => showCupertinoDialog<String>(
  //   context: context,
  //   builder: (BuildContext context) => CupertinoAlertDialog(
  //     title: const Text('No Connection'),
  //     content: const Text('Please check your internet connectivity'),
  //     actions: <Widget>[
  //       TextButton(
  //         onPressed: () async {
  //           Navigator.pop(context, 'Cancel');
  //           setState(() => isAlertSet = false);
  //           isDeviceConnected =
  //           await InternetConnectionChecker().hasConnection;
  //           if (!isDeviceConnected && isAlertSet == false) {
  //             showDialogBox();
  //             setState(() => isAlertSet = true);
  //           }
  //         },
  //         child: const Text('OK'),
  //       ),
  //     ],
  //   ),
  // );
}
