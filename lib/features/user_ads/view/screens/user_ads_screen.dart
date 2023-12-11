import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/widgets/app_image.dart';
import 'package:bekya/core/widgets/main_product_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserAdsScreen extends StatelessWidget {
  const UserAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.second,
        iconTheme: const IconThemeData(color: AppColors.offWhite),
      ),
      backgroundColor: AppColors.second,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(13.sp),
              child: Row(
                children: [
                  AppImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                      width: 40.w,
                      height: 15.h),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Youssef Mohamed",
                        style: TextStyle(
                            color: AppColors.offWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "Published ads: 120",
                        style: TextStyle(
                            color: AppColors.offWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 13.sp, vertical: 5.sp),
                        decoration: BoxDecoration(
                            color: Colors.grey[900],
                            border: Border.all(
                              color: AppColors.primary,
                            ),
                            borderRadius: BorderRadius.circular(12.sp)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.share,
                              color: AppColors.primary,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "Share Profile",
                              style: TextStyle(
                                  color: AppColors.offWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Divider(
                color: AppColors.offWhite,
                thickness: 1.5.sp,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return  MainProductItem(
                  price: 'EGP 1,000,000',
                  title:
                      'sdf sdfsdf sdf sdfsd fsd f sdf dsf sdf sd fds fsd f sdf dsf dsf sd fsd fsdf s',
                  date: '3 days ago.',
                  city: 'Cairo, Future City',
                  bed: 5,
                  bath: 7,
                  area: 500,
                  isFav: false,
                  image:
                      'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dmlsbGF8ZW58MHx8MHx8fDA%3D', onFavTap: () {

                },
                );
              },
              itemCount: 3,
            )
          ],
        ),
      ),
    );
  }
}
