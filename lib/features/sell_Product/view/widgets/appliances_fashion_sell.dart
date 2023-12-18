import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppliancesFashionSell extends StatelessWidget {
  const AppliancesFashionSell({super.key, required this.modelEditingController, required this.conditionEditingController});
 final TextEditingController modelEditingController ;
  final TextEditingController conditionEditingController;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.sp),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Type *",
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
              controller: modelEditingController,
              isPassword: false,
              textInputAction: TextInputAction.next,
              title: ""),
          SizedBox(height: 2.h,),

          Text(
            "Condition *",
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
              controller: conditionEditingController,
              isPassword: false,
              textInputAction: TextInputAction.done,
              title: "new / used"),



        ],
      ),
    );
  }
}
