import 'package:flutter/material.dart';
import 'package:vendy_station/screens/camera/camera_screen.dart';
import 'package:vendy_station/screens/more/more_screen.dart';
import 'package:vendy_station/screens/wallet/wallet_screen.dart';

import '../../data/datasource/remote/dio/cash.dart';
import '../../util/constant.dart';
import '../../util/image.dart';
import '../home/home.dart';
import '../home/home_page.dart';
import '../wallet/view/home_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final PageController _pageController = PageController();
  int _pageIndex = 0;
  late List<Widget> _screens ;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  bool singleVendor = false;

// late int index;
  @override
  void initState() {
    super.initState();
   // singleVendor = Provider.of<SplashProvider>(context, listen: false).configModel!.businessMode == "single";


    _screens = [
      const Home(),
       CameraScreen(),
      const MoreScreen(),
      const HomePageView(),

    ];
    token = CacheHelper.getData(key: 'token');

 //   NetworkInfo.checkConnectivity(context);

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(_pageIndex != 0) {
          _setPage(0);
          return false;
        }else {
          return true;
        }
      },

      child: Scaffold(
        key: _scaffoldKey,
        // floatingActionButton : FloatingActionButton(
        //   backgroundColor: Color(0xffC3AA94),
        //   onPressed: (){
        //     setState(() {
        //     //  showAddTaskSheet(context);
        //     });
        //   },
        //   shape: StadiumBorder(
        //       side: BorderSide(
        //           color: Color(0xffC3AA94),
        //         //  width: 4
        //       )
        //   ),
        //   elevation: 1.5,
        //   child: Image.asset(Images.qr),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Color(0xffC3AA94),
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          items: _getBottomWidget(singleVendor),
          onTap: (int index) {
            _setPage(index);
          },
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return _screens[index];
          },
        ),
      ),
    );
  }


  BottomNavigationBarItem _barItem(String image,  int index) {
    return BottomNavigationBarItem(
      icon: Image.asset(image, color: index == _pageIndex ?
      Color(0xffC3AA94) : Colors.white,
        height: 25, width: 25,
      ),
      label: "",
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }

  List<BottomNavigationBarItem> _getBottomWidget(bool isSingleVendor) {
    List<BottomNavigationBarItem> list = [];

    if(!isSingleVendor){
      list.add(_barItem(Images.homeImage,  0));
      list.add(_barItem(Images.qr,  1));
      list.add(_barItem(Images.profile, 2));
      list.add(_barItem(Images.wallet,  3));
    }else{
      // list.add(_barItem(Images.homeImage, getTranslated('home', context), 0));
      // list.add(_barItem(Images.shoppingImage, getTranslated('orders', context), 1));
      // list.add(_barItem(Images.notification, getTranslated('notification', context), 2));
      // list.add(_barItem(Images.moreImage, getTranslated('more', context), 3));
    }

    return list;
  }
}
