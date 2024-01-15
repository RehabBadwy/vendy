import 'package:flutter/material.dart';
import 'package:vendy_station/screens/vocher/voucher_item.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
        initialIndex: 0,
        length: 4,
        vsync: this);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/images/back.png",width: 40,height: 40,)),
                    SizedBox(width: 30,),
                    Center(
                        child: Text(
                          "Voucher",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff1E232C)
                          ),
                          textAlign: TextAlign.center,
                        )),

                  ],
                ),
                SizedBox(
                  height: 700,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                        //  width: 300,
                          child: TabBar(
                            indicator: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.circular(10)

                            ),
                            labelColor: Colors.white,
                            indicatorColor: Colors.black,
                            unselectedLabelColor: Colors.black,

                            controller: _tabController,
                            tabs: const <Widget>[
                              Tab(text: 'All',),
                              Tab(text: 'Ice'),
                              Tab(text: 'Food',),
                              Tab(text: 'Coffee'),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(25)
                          ),
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: <Widget>[
                              VoucherItem(),
                              Container(
                                child: Center(child: Text(' Overview tab')),
                              ),
                              Container(
                                child: Center(child: Text(' Overview tab')),
                              ), Container(
                                child: Center(child: Text(' Overview tab')),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
