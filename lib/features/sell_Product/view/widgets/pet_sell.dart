import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/widgets/app_text_field.dart';
import 'package:bekya/features/sell_Product/manager/sell_product__cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PetSell extends StatelessWidget {
  const PetSell({super.key,});


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
              controller: context.read<SellProductCubit>().petNameEditingController,
              isPassword: false,
              textInputAction: TextInputAction.next,
              title: "ketty"),
          SizedBox(height: 4.h,),

          Text(
            "Age *",
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
              icon: Icons.format_list_numbered_rtl_outlined,
              controller: context.read<SellProductCubit>().petAgeEditingController,
              isPassword: false,
              textInputAction: TextInputAction.done,
              title: "2 years"),
        ],
      ),
    );
  }
}
