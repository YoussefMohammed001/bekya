import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/widgets/app_image.dart';
import 'package:bekya/features/chats/view/screens/chat_screen.dart';
import 'package:bekya/features/product_details/manager/product_details_cubit.dart';
import 'package:bekya/features/product_details/view/widgets/product_details_header.dart';
import 'package:bekya/features/product_details/view/widgets/product_details_widget.dart';
import 'package:bekya/features/product_details/view/widgets/slider_details.dart';
import 'package:bekya/features/user_ads/view/screens/user_ads_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ProductDetailsScreen extends StatelessWidget {
ProductDetailsScreen({super.key, required this.productId, required this.catId});
final String productId;
final String catId;
final cubit = ProductDetailsCubit();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubit..geProducts(id: catId, productId: productId),
  child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
  builder: (context, state) {
   if(state is ProductDetailsLoading){
     return const Scaffold(
       backgroundColor: AppColors.second,
       body: Center(child: CircularProgressIndicator()),
     );
   }
   else{
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
               icon: InkWell(
                 onTap: () => push(context, ChatScreen(
                   receiverId: cubit.productModel.userId,
                   receiverName: cubit.productModel.userName,
                   userName: cubit.productModel.userName,)),
                 child: Container(

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
                       SliderDetails(imgList: cubit.productModel.images,),
                       ProductDetailsHeader(
                         name: cubit.productModel.title,
                         price: "${cubit.productModel.price} EGP",
                         location: cubit.productModel.location,
                         date: cubit.productModel.date,
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
                        ProductDetailsWidget(
                         type: cubit.productModel.vType,
                         area: cubit.productModel.area,
                         bedRooms: cubit.productModel.numberOfBedRooms,
                         bathRooms: cubit.productModel.numberOfPathRooms,
                         payment: '',
                         description:cubit.productModel.description),
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
                                   cubit.productModel.userName,
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
                                       onTap: () => push(context,  UserAdsScreen(id: cubit.productModel.userId, name: cubit.productModel.userName,
                                         image:cubit.productModel.userImage,)),
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
  },
),
);
  }



}