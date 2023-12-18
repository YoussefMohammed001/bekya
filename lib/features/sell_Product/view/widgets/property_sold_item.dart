import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/widgets/app_text_field.dart';
import 'package:bekya/core/widgets/drop_down.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PropertySoldItem extends StatefulWidget {
 const  PropertySoldItem({super.key, required this.type, required this.bedRoomsEditingController, required this.bathRoomsEditingController, required this.areaEditingController});
  final SingleValueDropDownController type;
  final TextEditingController bedRoomsEditingController;
  final TextEditingController bathRoomsEditingController;
  final TextEditingController areaEditingController;
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
            hint: 'type',
            controller: widget.type,
            enabled: false,
            count: 5,
            dropDownList: const [
              DropDownValueModel(name: "name", value: "1"),
              DropDownValueModel(name: "name", value: "2"),
              DropDownValueModel(name: "name", value: "3"),
              DropDownValueModel(name: "name", value: "4"),
              DropDownValueModel(name: "name", value: "5"),
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
              hint: "..........",
              keyboardType: TextInputType.number,
              icon: Icons.space_dashboard_outlined,
              controller: widget.areaEditingController,
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
              hint: "..........",
              keyboardType: TextInputType.number,
              icon: Icons.bed_outlined,
              controller: widget.bedRoomsEditingController,
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
              hint: "..........",
              keyboardType: TextInputType.number,
              icon: Icons.shower,
              controller: widget.bathRoomsEditingController,
              isPassword: false,
              textInputAction: TextInputAction.done,
              title: "add number of bath rooms"),


        ],
      ),
    );
  }
}
