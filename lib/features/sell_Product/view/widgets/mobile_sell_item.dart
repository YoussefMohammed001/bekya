import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/widgets/app_text_field.dart';
import 'package:bekya/core/widgets/drop_down.dart';
import 'package:bekya/features/sell_Product/manager/sell_product__cubit.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MobileSellItem extends StatelessWidget {
   const MobileSellItem({super.key,});

   @override
   Widget build(BuildContext context) {
     return  Container(
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
                 validators: (value) {
                   if(value!.isEmpty){
                     return "this field is required";
                   }
                 },
                 hint: "..........",
                 keyboardType: TextInputType.text,
                 icon: Icons.model_training_outlined,
                 controller: context.read<SellProductCubit>().mobileModelEditingController,
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
                 validators: (value) {
                   if(value!.isEmpty){
                     return "this field is required";
                   }
                 },
                 hint: "..........",
                 keyboardType: TextInputType.text,
                 icon: Icons.drive_file_rename_outline,
                 controller: context.read<SellProductCubit>().mobileConditionEditingController,
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
             DropDownTextFormField(
               validators: (value) {
                 if(value!.isEmpty){
                   return "this field is required";
                 }
               },
               hint: '4 giga',
               controller: context.read<SellProductCubit>().mobileRamEditingController,
               enabled: false,
               count: 6,
               dropDownList: const [
                 DropDownValueModel(name: "- 4 Giga", value: "- 4 Giga"),
                 DropDownValueModel(name: "4 Giga", value: "4 Giga"),
                 DropDownValueModel(name: "8 Giga", value: "8 Giga"),
                 DropDownValueModel(name: "16 Giga", value: "16 Giga"),
                 DropDownValueModel(name: "32 Giga", value: "32 Giga"),
                 DropDownValueModel(name: "64 Giga", value: "64 Giga"),
                 DropDownValueModel(name: "+ 64 Giga", value: "+64 Giga"),

               ],),

             SizedBox(height: 2.h,),

             Text(
               "Storage *",
               style: TextStyle(
                   color: AppColors.offWhite,
                   fontSize: 18.sp,
                   fontWeight: FontWeight.bold),
             ),
             SizedBox(height: 2.h,),
             DropDownTextFormField(
               validators: (value) {
                 if(value!.isEmpty){
                   return "this field is required";
                 }
               },
               hint: '64 giga',
               controller: context.read<SellProductCubit>().mobileStorageEditingController,
               enabled: false,
               count: 7,
               dropDownList: const [
                 DropDownValueModel(name: "32 Giga", value: "32 Giga"),
                 DropDownValueModel(name: "64 Giga", value: "64 Giga"),
                 DropDownValueModel(name: "128 Giga", value: "128 Giga"),
                 DropDownValueModel(name: "256 Giga", value: "256 Giga"),
                 DropDownValueModel(name: "512 Giga", value: "512 Giga"),
                 DropDownValueModel(name: "1 tera Giga", value: "1 tera"),
                 DropDownValueModel(name: "+ tera", value: "+ tera"),

               ],),


           ],
         ),
       );

   }
}
