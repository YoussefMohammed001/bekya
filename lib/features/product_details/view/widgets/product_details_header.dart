import 'package:bekya/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({super.key, required this.name, required this.price, required this.location, required this.date});
final String name;
final String price;
final String location;
final String date;
  @override
  Widget build(BuildContext context) {
return Container(
  margin: EdgeInsets.all(13.sp),
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        price,
        style: TextStyle(
          color: AppColors.offWhite,
          fontSize: 21.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 2.h,),
      Text(
        name,
        style: TextStyle(
          color: AppColors.offWhite,
          fontSize: 17.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 2.h,),
      Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: AppColors.offWhite,
          ),
          SizedBox(width: 2.w,),
          Text(
            location,
            style: TextStyle(
              color: AppColors.offWhite,
            ),
          ),
          Spacer(),
          Text(
            date,
            style: TextStyle(
              color: AppColors.offWhite,
            ),
          ),
        ],
      )
    ],
  ),
);
  }
}
