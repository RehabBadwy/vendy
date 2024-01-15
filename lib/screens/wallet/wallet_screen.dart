import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with TickerProviderStateMixin{
  final List<Map<String, dynamic>> cards = [
    {
      'id': 0,
      'cardName': 'My Balance',
      'cardType': '285,410.12',
      'name': 'Phone Number',
      'date': '01003080915',
      //'cardNo': '1234 **** **** 5678',
      'color': Colors.black,
    },
    {
      'id': 0,
      'cardName': 'My Balance',
      'cardType': '285,410.12',
      'name': 'Phone Number',
      'date': '01003080915',
      //'cardNo': '1234 **** **** 5678',
      'color': Colors.black,
    },
  ];
  String _favoriteCard = 'Visa';
  Widget _buildCardItem(Map<String, dynamic> card) {

    return Container(
      // height: 200,
       width: 300,
      decoration: BoxDecoration(
        color: card['color'],
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(card["cardName" ],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16

                    ),
                    //style: titleRegular.copyWith(fontSize: Dimensions.fontSizeLarge,color: Theme.of(context).cardColor,),
                  ),
                  Text(card["cardType" ],
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400
                    ),
                  ),

                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            card['name'],
            style: TextStyle(
                color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500

            ),
          ),
          Text(
            card['date'],
            style: TextStyle(
                color: Color(0xffC3AA94),
                fontSize: 16,
                fontWeight: FontWeight.w500

            ),
          ),

        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
        initialIndex: 0,
        length: 2,
        vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:  Column(
            children: [
              Container(
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SizedBox(
                  height: 300,
                  child: ListView.separated(
                    separatorBuilder: (context,index){
                      return SizedBox(width: 20,);
                    },
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: cards.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildCardItem(cards[index])),

                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 1000,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TabBar(
                          indicator: BoxDecoration(
                            color: Colors.brown,
                              borderRadius: BorderRadius.circular(25)

                          ),
                          labelColor: Colors.white,
                          indicatorColor: Colors.black,
                          unselectedLabelColor: Colors.black,

                          controller: _tabController,
                          tabs: const <Widget>[
                            Tab(text: 'Overview',
                            ),
                            Tab(text: 'Specifications'),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(25)
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            Container(
                              child: Center(child: Text(' Overview tab')),
                            ),
                            Container(
                              child: Center(child: Text(' Overview tab')),
                            ),
                            // Card(
                            //   margin: const EdgeInsets.all(16.0),
                            //   child: Center(child: Text(' Overview tab')),
                            // ),
                            // Card(
                            //   margin: const EdgeInsets.all(16.0),
                            //   child: Center(
                            //       child: Text(' Specifications tab')),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
