import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/home/v_touch/vtouch_screen.dart';
import 'package:vendy_station/screens/home/vendy_school/family_school/family_screen.dart';
import '../../../provider/clints_provider.dart';


class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}


class _SliderWidgetState extends State<SliderWidget> {
  int? _currentIndex;
  int? get currentIndex => _currentIndex;
  void setCurrentIndex(int index) {
    _currentIndex = index;

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientsProvider>(

      builder: (context,slider,child){
        return slider.sliderModl!=null ?
        SizedBox(

          // height: 100,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              disableCenter: true,
              onPageChanged: (index, reason) {
                setState(() {
                  setCurrentIndex(index);
                });
              },
            ),
            itemCount: slider.sliderModl!.length,
            //category.length,
            itemBuilder: (context, index, _) {

              return InkWell(
                onTap: () {
                  if(slider.sliderModl![index].link=="vendyschool")
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FamilyScreen()));
                  if(slider.sliderModl![index].link=="vtouch")
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>vTouchScreen()));

                },
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network("${slider.sliderModl![index].image}")
                  ),
                ),
              );
              //_buildCartegory(category[index], context);

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
        ):Center(child: CircularProgressIndicator(color: Colors.transparent,),);


      },
    );
  }
}