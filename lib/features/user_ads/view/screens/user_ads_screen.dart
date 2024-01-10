import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/widgets/app_image.dart';
import 'package:bekya/core/widgets/main_product_item.dart';
import 'package:bekya/features/user_ads/manager/user_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserAdsScreen extends StatelessWidget {
  UserAdsScreen(
      {super.key, required this.id, required this.name, required this.image});

  final String id;
  final String name;
  final String image;

  final cubit = UserAdsCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..geProducts(id: id),
      child: Scaffold(
        appBar: AppBar(
          title: Text("${name}' s adds",style: TextStyle(
            color: Colors.white
          ),),
          backgroundColor: AppColors.second,
          iconTheme: const IconThemeData(color: AppColors.offWhite),
        ),
        backgroundColor: AppColors.second,
        body: BlocBuilder<UserAdsCubit, UserAdsState>(
          builder: (context, state) {
if(state is UserAdsLoading){
  return Center(child: CircularProgressIndicator());
}else{
               return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(13.sp),
          child: Row(
            children: [
              image.isEmpty ?
              Container(
                width: 40.w,
                height: 15.h,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(14.sp)
                ),
                child: Center(
                  child: Text("${name[0]}", style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              )

                  : AppImage(
                  bottomRightRadius: 14.sp,
                  bottomLeftRadius: 14.sp,
                  topLeftRadius: 14.sp,
                  topRightRadius: 14.sp,
                  imageUrl: image,
                  width: 40.w,
                  height: 15.h),
              SizedBox(
                width: 5.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: AppColors.offWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "Published ads: ${cubit.productModel.length}",
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
            return MainProductItem(
              price: cubit.productModel[index].price,
              title:
              'sdf sdfsdf sdf sdfsd fsd f sdf dsf sdf sd fds fsd f sdf dsf dsf sd fsd fsdfs',
              date: '3 days ago.',
              city: 'Cairo, Future City',
              bed: 5,
              bath: 7,
              area: 500,
              isFav: false,
              image:
              'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dmlsbGF8ZW58MHx8MHx8fDA%3D',
              onFavTap: () {

              }, productId: '', catId: '',
            );
          },
          itemCount: cubit.productModel.length,
        )
      ],
    ),
  );

}

},
        ),
      ),
    );
  }
}
