import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/widgets/app_image.dart';
import 'package:bekya/features/product_details/view/widgets/product_details_header.dart';
import 'package:bekya/features/product_details/view/widgets/product_details_widget.dart';
import 'package:bekya/features/product_details/view/widgets/slider_details.dart';
import 'package:bekya/features/user_ads/view/screens/user_ads_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(13.sp),
                    border: Border.all(color: AppColors.primary)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      color: AppColors.primary,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "SMS",
                      style: TextStyle(
                          color: AppColors.offWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    )
                  ],
                ),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(13.sp),
                    border: Border.all(color: AppColors.primary)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.wechat_sharp,
                      color: AppColors.primary,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Chat",
                      style: TextStyle(
                          color: AppColors.offWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    )
                  ],
                ),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(13.sp),
                    border: Border.all(color: AppColors.primary)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.call,
                      color: AppColors.offWhite,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    const Text(
                      "Call",
                      style: TextStyle(
                          color: AppColors.offWhite,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
        ],
      ),
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constrains) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constrains.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SliderDetails(),
                      const ProductDetailsHeader(
                        name: 'Huawei',
                        price: 'EGP 6000',
                        location: 'Future City, Cairo',
                        date: '30/11/2023',
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Divider(
                          color: AppColors.offWhite,
                          thickness: 1.5.sp,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const ProductDetailsWidget(
                        type: 'Villa',
                        area: '450',
                        bedRooms: '4',
                        bathRooms: '6',
                        payment: 'cash',
                        description:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Divider(
                          color: AppColors.offWhite,
                          thickness: 1.5.sp,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(15.sp),
                        child: Row(
                          children: [
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
                                  height: 2.h,
                                ),
                                Row(

                                  children: [
                                    InkWell(
                                      onTap: () => push(context, const UserAdsScreen()),
                                      child: Text(
                                        "See profile",
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 18.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1.h,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 16.sp,
                                      color: AppColors.primary,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            AppImage(
                                imageUrl:
                                    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                width: 20.w,
                                height: 10.h)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: 25.sp, bottom: 17.sp, left: 15.sp, right: 15.sp),
            color: Colors.black.withOpacity(0.4),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.offWhite,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.favorite_outline,
                  color: AppColors.offWhite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
