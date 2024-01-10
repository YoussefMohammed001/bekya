import 'package:bekya/core/widgets/app_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SliderDetails extends StatelessWidget {
   SliderDetails({super.key, required this.imgList});

final List<dynamic> imgList;
  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      items: imgList.map((e) {
        return AppImage( imageUrl: e,width: double.infinity,height: 35.h,);
      }).toList(),
      options: CarouselOptions(
        height: 35.h,

        viewportFraction: 1,


      ),
    );
  }
}
