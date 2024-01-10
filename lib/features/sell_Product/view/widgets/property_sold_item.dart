import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/widgets/app_text_field.dart';
import 'package:bekya/core/widgets/drop_down.dart';
import 'package:bekya/features/sell_Product/manager/sell_product__cubit.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PropertySoldItem extends StatefulWidget {
 const  PropertySoldItem({super.key,});

 @override
  State<PropertySoldItem> createState() => _PropertySoldItemState();
}

class _PropertySoldItemState extends State<PropertySoldItem> {

  @override
  Widget build(BuildContext context) {
    return      Container(
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
          DropDownTextFormField(
            validators: (value) {
              if(value!.isEmpty){
                return "this field is required";
              }
            },
            hint: 'type',
            controller: context.read<SellProductCubit>().propertyType,
            enabled: false,
            count: 5,
            dropDownList: const [
              DropDownValueModel(name: "apartments for rent", value: "apartments for rent"),
              DropDownValueModel(name: "apartments for sale", value: "apartments for sale"),
              DropDownValueModel(name: "commercial for rent", value: "commercial for rent"),
              DropDownValueModel(name: "commercial for sale", value: "commercial for sale"),
              DropDownValueModel(name: "vacation homes for rent", value: "vacation homes for rent"),
              DropDownValueModel(name: "vacation homes for sale", value: "vacation homes for sale"),
              DropDownValueModel(name: "villa for rent", value: "villa for rent"),
              DropDownValueModel(name: "villa for sale", value: "villa for sale"),
            ],),
          SizedBox(height: 2.h,),

          Text(
            "Area *",
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
              keyboardType: TextInputType.number,
              icon: Icons.space_dashboard_outlined,
              controller: context.read<SellProductCubit>().areaEditingController,
              isPassword: false,
              textInputAction: TextInputAction.next,
              title: "area"),
          SizedBox(height: 2.h,),



          Text(
            "No. of rooms *",
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
              keyboardType: TextInputType.number,
              icon: Icons.bed_outlined,
              controller: context.read<SellProductCubit>().bedRoomsEditingController,
              isPassword: false,
              textInputAction: TextInputAction.next,
              title: "add number of rooms"),
          SizedBox(height: 2.h,),



          Text(
            "No. of bath rooms *",
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
              keyboardType: TextInputType.number,
              icon: Icons.shower,
              controller: context.read<SellProductCubit>().bathRoomsEditingController,
              isPassword: false,
              textInputAction: TextInputAction.done,
              title: "add number of bath rooms"),


        ],
      ),
    );
  }
}
