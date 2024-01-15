import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendy_station/screens/home/v_touch/vtouch_screen.dart';
import 'package:vendy_station/screens/home/vendy_school/family_school/family_screen.dart';
import '../../../provider/clints_provider.dart';
import 'package:shimmer/shimmer.dart';

class MiddleScreen extends StatefulWidget {
  const MiddleScreen({Key? key}) : super(key: key);

  @override
  State<MiddleScreen> createState() => _MiddleScreenState();
}

class _MiddleScreenState extends State<MiddleScreen> {
  int? _currentIndex;
  int? get currentIndex => _currentIndex;
  void setCurrentIndex(int index) {
    _currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ClientsProvider>(context, listen: false).getMiddle(context);
    var mdh = MediaQuery.of(context).size.height;
    var mdw = MediaQuery.of(context).size.width;
    return Consumer<ClientsProvider>(
      builder: (context, slider, child) {
        return slider.sliderMiddle != null
            ? SizedBox(
                // width: mdw,

                height: mdh / 3.9,
                child:
                    // CarouselSlider.builder(
                    //   options: CarouselOptions(
                    //     viewportFraction: 1,
                    //     // autoPlay: true,
                    //     // enlargeCenterPage: true,
                    //     // disableCenter: true,
                    //     // onPageChanged: (index, reason) {
                    //     //   setState(() {
                    //     //     setCurrentIndex(index);
                    //     //   });
                    //     // },
                    //   ),
                    //   itemCount: slider.sliderMiddle!.length,
                    //   //category.length,
                    //   itemBuilder: (context, index, _) {
                    //
                    //     return InkWell(
                    //       onTap: () {
                    //         // if(slider.sliderModl![index].link=="vendyschool")
                    //         //   Navigator.push(context, MaterialPageRoute(builder: (context)=>FamilyScreen()));
                    //         // if(slider.sliderModl![index].link=="vtouch")
                    //         //   Navigator.push(context, MaterialPageRoute(builder: (context)=>vTouchScreen()));
                    //
                    //       },
                    //       child: Container(
                    //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    //         child: ClipRRect(
                    //             borderRadius: BorderRadius.circular(10),
                    //             child: Image.network("${slider.sliderMiddle![index].image}")
                    //         ),
                    //       ),
                    //     );
                    //     //_buildCartegory(category[index], context);
                    //
                    //   },
                    // ),
                    ListView.separated(
                        // shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            //    width: mdw,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: FadeInImage.assetNetwork(
                                  placeholder: "assets/images/logo.png",
                                  image: "${slider.sliderMiddle![index].image}",
                                  fit: BoxFit.fill,
                                )),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 20,
                          );
                        },
                        itemCount: slider.sliderMiddle!.length),
              )
            : SizedBox(
                height: mdh / 5,
                child: Shimmer.fromColors(
                    child: Container(
                      color: Colors.grey,
                    ),
                    baseColor: Color.fromARGB(209, 158, 158, 158),
                    highlightColor: Color.fromARGB(137, 158, 158, 158)));
      },
    );
  }
}
