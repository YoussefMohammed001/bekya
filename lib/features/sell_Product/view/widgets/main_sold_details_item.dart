import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/widgets/app_text_field.dart';
import 'package:bekya/core/widgets/main_category_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainSoldDetailsItem extends StatelessWidget {
 const  MainSoldDetailsItem({super.key, required this.priceEditingController, required this.titleEditingController, required this.descriptionEditingController, required this.image, required this.id, required this.category});
  final TextEditingController priceEditingController ;
  final TextEditingController titleEditingController ;
  final TextEditingController descriptionEditingController;
   final String image,id,category;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Category *",
              style: TextStyle(
                  color: AppColors.offWhite,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                MainCategoryItem(icon: image,),
                SizedBox(width: 2.w,),
                Text(
                  category,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),

          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title *",
              style: TextStyle(
                  color: AppColors.offWhite,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2.h,),
            AppTextField(
                hint: "..........",
                keyboardType: TextInputType.text,
                icon: Icons.title,
                controller: titleEditingController,
                isPassword: false,
                textInputAction: TextInputAction.next,
                title: "add title for your product"),


          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price *",
              style: TextStyle(
                  color: AppColors.offWhite,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2.h,),
            AppTextField(
                hint: "1,000,000 EGP",
                keyboardType: TextInputType.number,
                icon: Icons.attach_money_sharp,
                controller: priceEditingController,
                isPassword: false,
                textInputAction: TextInputAction.next,
                title: "add your price"),


          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description *",
              style: TextStyle(
                  color: AppColors.offWhite,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2.h,),
            AppTextField(
                hint: "... .... ... ... ",
                keyboardType: TextInputType.text,
                icon: Icons.description_outlined,
                controller: descriptionEditingController,
                isPassword: false,
                textInputAction: TextInputAction.next,
                title: "add description for your product"),


          ],
        ),
      ),
    ],);
  }
}
