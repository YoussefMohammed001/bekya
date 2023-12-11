import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/widgets/app_image.dart';
import 'package:bekya/features/product_details/view/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainProductItem extends StatelessWidget {
  const MainProductItem({super.key, required this.price, required this.title, required this.date, required this.city, required this.bed, required this.bath, required this.area, required this.isFav, required this.image, required this.onFavTap});
final String image, price,title,date,city;
final int bed,bath,area;
final bool isFav;
final VoidCallback onFavTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        push(context, const ProductDetailsScreen());
      },
      child: Container(
          margin: EdgeInsets.all( 10.sp),
          width: 60.w,
          height: 21.h,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2.4.sp,
                  color: AppColors.offWhite
              ),
              color: AppColors.second,
              borderRadius: BorderRadius.circular(10.sp)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImage(
                imageUrl:image,
                width: 40.w,
                height: 21.h,
                topRightRadius: 10.sp,
                topLeftRadius: 10.sp,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1.h,),
                      Row(
                        children: [
                          Text(
                            price,
                            style: TextStyle(color: AppColors.offWhite,fontSize: 17.sp),
                          ),
                          const Spacer(),
                           InkWell(
                             onTap: onFavTap,
                             child: Icon( isFav == false ? Icons.favorite_outline : Icons.favorite,
      color: AppColors.offWhite,),
                           )
                        ],
                      ),
                      SizedBox(height: 1.h,),

                      Text(
                        title,
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
                               Text("$bed",style: TextStyle(color:AppColors.offWhite ),)
                            ],
                          ),
                          SizedBox(width: 4.w,),

                          Row(
                            children: [
                              const Icon(Icons.shower,color: AppColors.offWhite,),
                              SizedBox(width: 1.w,),
                               Text("$bath",style: TextStyle(color:AppColors.offWhite ),)
                            ],
                          ),
                          SizedBox(width: 4.w,),
                          Row(
                            children: [
                              const Icon(Icons.space_dashboard_outlined,color: AppColors.offWhite,),
                              SizedBox(width: 1.w,),
                               Text('$area',style: TextStyle(color:AppColors.offWhite ),)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h,),
                      Text(
                        city,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.offWhite,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 1.h,),

                      Text(
                        date,
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
              ),
            ],
          )),
    );
  }
}
