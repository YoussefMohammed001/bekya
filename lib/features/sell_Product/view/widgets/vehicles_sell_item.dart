import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VehiclesSellItem extends StatelessWidget {
  const VehiclesSellItem({super.key, required this.vehiclesNameEditingController, required this.vehiclesColorEditingController, required this.vehiclesModelEditingController, required this.vehiclesTypeEditingController});
 final  TextEditingController vehiclesNameEditingController ;
   final TextEditingController vehiclesColorEditingController ;
   final  TextEditingController vehiclesModelEditingController ;
   final TextEditingController vehiclesTypeEditingController ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.sp),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Name *",
            style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.h,),
          AppTextField(
              hint: "..........",
              keyboardType: TextInputType.text,
              icon: Icons.drive_file_rename_outline,
              controller: vehiclesNameEditingController,
              isPassword: false,
              textInputAction: TextInputAction.next,
              title: "mercedes"),
          SizedBox(height: 2.h,),



          Text(
            "Model *",
            style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.h,),
          AppTextField(
              hint: "..........",
              keyboardType: TextInputType.text,
              icon: Icons.model_training_outlined,
              controller: vehiclesModelEditingController,
              isPassword: false,
              textInputAction: TextInputAction.next,
              title: "c200"),
          SizedBox(height: 2.h,),



          Text(
            "Color *",
            style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.h,),
          AppTextField(
              hint: "..........",
              keyboardType: TextInputType.text,
              icon: Icons.format_paint,
              controller: vehiclesColorEditingController,
              isPassword: false,
              textInputAction: TextInputAction.next,
              title: "red"),
          SizedBox(height: 2.h,),

          Text(
            "offer Type *",
            style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.h,),
          AppTextField(
              hint: "..........",
              keyboardType: TextInputType.text,
              icon: Icons.merge_type_outlined,
              controller: vehiclesTypeEditingController,
              isPassword: false,
              textInputAction: TextInputAction.done,
              title: "rent / sale"),


        ],
      ),
    );
  }


}
