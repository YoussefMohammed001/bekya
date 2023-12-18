import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MobileSellItem extends StatelessWidget {
   const MobileSellItem({super.key, required this.mobileModelEditingController, required this.mobileConditionEditingController, required this.mobileRamEditingController, required this.mobileStorageEditingController});
 final  TextEditingController mobileModelEditingController;
   final TextEditingController mobileConditionEditingController;
   final TextEditingController mobileRamEditingController;
   final TextEditingController mobileStorageEditingController;

   @override
   Widget build(BuildContext context) {
     return Container(
       margin: EdgeInsets.all(15.sp),

       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [

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
               keyboardType: TextInputType.number,
               icon: Icons.model_training_outlined,
               controller: mobileModelEditingController,
               isPassword: false,
               textInputAction: TextInputAction.next,
               title: "15 pro max"),
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
               controller: mobileConditionEditingController,
               isPassword: false,
               textInputAction: TextInputAction.next,
               title: "new / used"),
           SizedBox(height: 2.h,),





           Text(
             "Ram *",
             style: TextStyle(
                 color: AppColors.offWhite,
                 fontSize: 18.sp,
                 fontWeight: FontWeight.bold),
           ),
           SizedBox(height: 2.h,),
           AppTextField(
               hint: "..........",
               keyboardType: TextInputType.number,
               icon: Icons.sd_storage_outlined,
               controller: mobileRamEditingController,
               isPassword: false,
               textInputAction: TextInputAction.next,
               title: "8 ram"),
           SizedBox(height: 2.h,),

           Text(
             "Storage *",
             style: TextStyle(
                 color: AppColors.offWhite,
                 fontSize: 18.sp,
                 fontWeight: FontWeight.bold),
           ),
           SizedBox(height: 2.h,),
           AppTextField(
               hint: "..........",
               keyboardType: TextInputType.number,
               icon: Icons.storage_outlined,
               controller: mobileStorageEditingController,
               isPassword: false,
               textInputAction: TextInputAction.done,
               title: "128 giga"),


         ],
       ),
     );
   }
}
