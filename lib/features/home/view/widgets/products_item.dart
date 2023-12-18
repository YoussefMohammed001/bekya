import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/widgets/app_image.dart';
import 'package:bekya/features/product_details/view/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductsItem extends StatelessWidget {
  const ProductsItem({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 15.sp),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    color: AppColors.offWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  /// on Taaaaaaaaaaaaaap
                },
                child: Text(
                  "see all",
                  style: TextStyle(color: AppColors.offWhite, fontSize: 15.sp),
                ),
              ),
              SizedBox(width: 1.w,),
              Icon(Icons.arrow_forward_ios_rounded,color: AppColors.offWhite,size: 14.sp,)
            ],
          ),
        ),
        Container(
          color: AppColors.second,
          height: 36.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  push(context, const ProductDetailsScreen());
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15.sp),
                  width: 60.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.4.sp,
                        color: AppColors.offWhite
                      ),
                        color: AppColors.second,
                        borderRadius: BorderRadius.circular(10.sp)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppImage(
                          imageUrl:
                              'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dmlsbGF8ZW58MHx8MHx8fDA%3D',
                          width: 60.w,
                          height: 15.h,
                          topRightRadius: 10.sp,
                          topLeftRadius: 10.sp,
                        ),
                        Container(
                          margin: EdgeInsets.all(10.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 1.h,),
                               Row(
                                 children: [
                                   Text(
                                    "EGP 900",
                                    style: TextStyle(color: AppColors.offWhite,fontSize: 17.sp),
                              ),
                                   const Spacer(),
                                   const Icon(Icons.favorite_outline,color: AppColors.offWhite,)
                                 ],
                               ),
                              SizedBox(height: 1.h,),

                              Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Rattletrap sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyle(
                               color: AppColors.offWhite,
                               fontSize: 16.sp,
                       ),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.bed_outlined,color: AppColors.offWhite,),
                                      SizedBox(width: 1.w,),
                                      const Text('5',style: TextStyle(color:AppColors.offWhite ),)
                                    ],
                                  ),
                                  SizedBox(width: 3.w,),

                                  Row(
                                    children: [
                                      const Icon(Icons.shower,color: AppColors.offWhite,),
                                      SizedBox(width: 1.w,),
                                      const Text('2',style: TextStyle(color:AppColors.offWhite ),)
                                    ],
                                  ),
SizedBox(width: 3.w,),
                                  Row(
                                    children: [
                                      const Icon(Icons.space_dashboard_outlined,color: AppColors.offWhite,),
                                      SizedBox(width: 1.w,),
                                      const Text('120 m',style: TextStyle(color:AppColors.offWhite ),)
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              Text(
                                "Future City, Cairo",
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyle(
                               color: AppColors.offWhite,
                               fontSize: 14.sp,
                       ),
                              ),
                              SizedBox(height: 1.h,),

                              Text(
                                "2 days ago.",
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyle(
                               color: AppColors.offWhite,
                               fontSize: 14.sp,
                       ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              );
            },
            itemCount: 12,
          ),
        ),
        SizedBox(height: 1.h,),

      ],
    );
  }
}
