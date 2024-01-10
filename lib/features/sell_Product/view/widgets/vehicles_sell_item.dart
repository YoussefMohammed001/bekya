import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/widgets/app_text_field.dart';
import 'package:bekya/features/sell_Product/manager/sell_product__cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VehiclesSellItem extends StatelessWidget {
  const VehiclesSellItem({super.key, });

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
              validators: (value) {
                if(value!.isEmpty){
                  return "this field is required";
                }
              },
              hint: "..........",
              keyboardType: TextInputType.text,
              icon: Icons.drive_file_rename_outline,
              controller: context.read<SellProductCubit>().vehiclesNameEditingController,
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
              validators: (value) {
                if(value!.isEmpty){
                  return "this field is required";
                }
              },
              hint: "..........",
              keyboardType: TextInputType.text,
              icon: Icons.model_training_outlined,
              controller: context.read<SellProductCubit>().vehiclesModelEditingController,
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
              validators: (value) {
                if(value!.isEmpty){
                  return "this field is required";
                }
              },
              hint: "..........",
              keyboardType: TextInputType.text,
              icon: Icons.format_paint,
              controller: context.read<SellProductCubit>().vehiclesColorEditingController,
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
            validators: (value) {
              if(value!.isEmpty){
                return "this field is required";
              }
            },
              hint: "..........",
              keyboardType: TextInputType.text,
              icon: Icons.merge_type_outlined,
              controller: context.read<SellProductCubit>().vehiclesTypeEditingController,
              isPassword: false,
              textInputAction: TextInputAction.done,
              title: "rent / sale"),


        ],
      ),
    );
  }


}
