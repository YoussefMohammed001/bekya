import 'package:bekya/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key, required this.type, required this.area, required this.bedRooms, required this.bathRooms, required this.payment, required this.description});
final String type,area,bedRooms,bathRooms,payment,description;
  @override
  Widget build(BuildContext context) {
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(15.sp),
          width: double.infinity,
          color: Colors.grey[850],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Details",
                style: TextStyle(
                    color: AppColors.offWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              SizedBox(height: 3.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "Type:",
                        style: TextStyle(
                            color: AppColors.offWhite,

                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 1.h,),
                      Text(
                        "Area:",
                        style: TextStyle(
                            color: AppColors.offWhite,

                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 1.h,),
                      Text(
                        "BedRooms:",
                        style: TextStyle(
                            color: AppColors.offWhite,

                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 1.h,),
                      Text(
                        "BathRooms:",
                        style: TextStyle(
                            color: AppColors.offWhite,

                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 1.h,),
                      // Text(
                      //   "Payment Option:",
                      //   style: TextStyle(
                      //       color: AppColors.offWhite,
                      //
                      //       fontSize: 18.sp),
                      // ),
                      // SizedBox(height: 1.h,),
                    ],
                  ),
                  SizedBox(width: 9.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        type,
                        style: TextStyle(
                            color: AppColors.offWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 1.h,),
                      Text(
                        "$area m",
                        style: TextStyle(
                            color: AppColors.offWhite,
                            fontWeight: FontWeight.bold,

                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 1.h,),
                      Text(
                        bedRooms,
                        style: TextStyle(
                            color: AppColors.offWhite,
                            fontWeight: FontWeight.bold,

                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 1.h,),
                      Text(
                        bathRooms,
                        style: TextStyle(
                            color: AppColors.offWhite,

                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 1.h,),
                      // Text(
                      //   payment,
                      //   style: TextStyle(
                      //       color: AppColors.offWhite,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 18.sp),
                      // ),
                      // SizedBox(height: 1.h,),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.all(15.sp),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              "Description",
              style: TextStyle(
                  color: AppColors.offWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp),
            ),
              SizedBox(height: 2.h,),
            Text(
              description,
              style: TextStyle(
                  color: AppColors.offWhite,

                  fontSize: 15.sp),
            ),
          ],),
        )
      ],
    );
  }
}
