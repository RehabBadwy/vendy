import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/datasource/remote/dio/cash.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/clints_provider.dart';
import '../../../util/constant.dart';
import 'clients_screen.dart';
import 'machine_company.dart';

class ClientWidget extends StatefulWidget {
  const ClientWidget({Key? key}) : super(key: key);

  @override
  State<ClientWidget> createState() => _ClientWidgetState();
}

class _ClientWidgetState extends State<ClientWidget> {
  int? _currentIndex;
  int? get currentIndex => _currentIndex;
  void setCurrentIndex(int index) {
    _currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientsProvider>(
      builder: (context, clientProvider, child) {
        return clientProvider.clientCompanyModel.isNotEmpty
            ? SizedBox(
                // height: 100,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    aspectRatio: 4,
                    viewportFraction: 0.3,
                    autoPlay: true,
                    enlargeFactor: 0.6,
                    //enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    disableCenter: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        setCurrentIndex(index);
                      });
                    },
                  ),
                  itemCount: clientProvider.clientCompanyModel.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Container(
                      decoration: const BoxDecoration(

                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Color(0xffEDEDED),
                          //     spreadRadius: 1,
                          //     blurRadius: 15,
                          //    offset: Offset(0, 3), // changes position of shadow
                          //   ),
                          // ],
                          ),
                      child: InkWell(
                          onTap: () {
                            Provider.of<ClientsProvider>(context, listen: false)
                                .getMachinesList(
                              context,
                              "${clientProvider.clientCompanyModel[index].name}",
                              //index
                              // "${clientProvider.clientCompanyModel[index].description}",
                              // "${clientProvider.clientCompanyModel[index].image}",
                            );

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ClientsScreen(
                                          index: index,
                                        )));
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                              "${clientProvider.clientCompanyModel[index].image}",
                            ),
                          )),
                    );
                  },
                ),
                // ListView.separated(
                //     shrinkWrap: true,
                //     physics: ScrollPhysics(),
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context,index){
                //       return Container(
                //         // width: 130,
                //         // height: 130,
                //         decoration: const BoxDecoration(
                //           // boxShadow: [
                //           //   BoxShadow(
                //           //     color: Color(0xffEDEDED),
                //           //    // spreadRadius: 1,
                //           //     //blurRadius: 15,
                //           //    // offset: Offset(0, 3), // changes position of shadow
                //           //   ),
                //           // ],
                //         ),
                //         child: InkWell(
                //           onTap: (){
                //
                //             if((!Provider.of<AuthProvider>(context, listen: false).isLoading)){
                //               Provider.of<ClientsProvider>(context, listen: false).getMachinesList(context,
                //                   "${clientProvider.clientCompanyModel[index].name}");
                //               Navigator.push(context, MaterialPageRoute(builder: (context)=>MachineCompanyScreen()));
                //
                //             }
                //
                //
                //
                //
                //           },
                //           child: Container(
                //             child:Image.network("${clientProvider.clientCompanyModel[index].image}"),
                //             decoration: BoxDecoration(
                //               color: Colors.white,
                //               borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(20.0),
                //                 topRight: Radius.circular(20.0),
                //                 bottomLeft: Radius.circular(20.0),
                //                 bottomRight: Radius.circular(20.0),
                //               ),
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //     separatorBuilder: (context,index){
                //       return SizedBox(width: 20,);
                //     },
                //     itemCount: clientProvider.clientCompanyModel.length),
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.transparent,
                ),
              );
      },
    );
  }
}
