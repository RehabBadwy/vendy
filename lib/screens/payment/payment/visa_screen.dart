import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../../util/component_screen.dart';
import '../../../util/constant.dart';
import '../../auth/register_screen.dart';

class VisaScreenWallet extends StatefulWidget {
  const VisaScreenWallet({Key? key}) : super(key: key);

  @override
  State<VisaScreenWallet> createState() => _VisaScreenWalletState();
}

class _VisaScreenWalletState extends State<VisaScreenWallet> {
  final Completer<WebViewController> _controllerWallet =
      Completer<WebViewController>();

bool Isvisible = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }




    //webView.loadDataWithBaseURL("",result,"text/html", "UTF-8","");
  }



  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    var mdh = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [WebView(
          initialUrl:
          //Uri.dataFromString(AppConstants.walletCode, mimeType: 'text/html')
          //     .toString(),
          AppConstants.walletCode,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controllerWallet.complete(webViewController);
          },

          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
             setState(() {
                Isvisible = true;
              });
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('http://www.google.co.uk')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
             setState(() {
                Isvisible = true;
              });
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
             setState(() {
                Isvisible = false;
              });
          },
          gestureNavigationEnabled: true,
          backgroundColor: const Color(0x00000000),

        ),

        Visibility(
              visible: Isvisible,
              child: Container(
                height: mdh,
                width: mdw,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(70),
                        // height: 250,
                        // width: 250,
                        child: Image.asset("assets/images/payn.gif"),
                      ),
                      Text(
                        'Please Wait Little ...',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: const Color(0xff0e3e42),
                          //  fontWeight: FontWeight.w100,
                          // height: 1.1666666666666667,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                      Container(
                        // margin: EdgeInsets.all(20),
                        height: 15,
                        width: mdw,
                        child: Divider(
                          thickness: 1,
                          height: 20,
                          color: const Color(0xff0e3e42),
                        ),
                      ),
                      Text(
                        'VendyStation',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: const Color(0xff0e3e42),
                          //  fontWeight: FontWeight.w100,
                          // height: 1.1666666666666667,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      )
                      /*Container(
                        height: 30,
                        width: 30,
                        child: ,
                      )*/
                    ],
                  ),
                ),
              ))],
        )
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    );
  }

  // to exit from app
  void paymentExitApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            'Are you sure completed the pay',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                navigateAndFinish(
                  context,
                  RegisterScreen(),
                );
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}










