
import 'package:bekya/core/styles/colors.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DropDownTextFormField extends StatefulWidget {
  DropDownTextFormField({Key? key,  required this.hint, this.validators, required this.controller, required this.enabled, required this.dropDownList,  this.count = 0, this.onChanged}) : super(key: key);
  final String hint;
  final FormFieldValidator<dynamic>? validators;
  final SingleValueDropDownController  controller;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  final List<DropDownValueModel> dropDownList;
  EdgeInsetsGeometry? padding;
  final bool enabled;
  final int count;
  final ValueSetter? onChanged;


  @override
  State<DropDownTextFormField> createState() => _DropDownTextFormFieldState();
}


class _DropDownTextFormFieldState extends State<DropDownTextFormField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        children: [
          DropDownTextField(
            dropdownColor: AppColors.second,
               listTextStyle: TextStyle(color: AppColors.offWhite),
              textStyle: TextStyle(color: AppColors.offWhite),
              dropDownItemCount: widget.count,
              clearOption: false,
              onChanged: widget.onChanged,
              validator: widget.validators,
              controller: widget.controller,
              textFieldDecoration: InputDecoration(
                enabled: false,

                suffixIcon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.offWhite,
                ),
                hintText: widget.hint,
                hintStyle:   TextStyle(color: Colors.grey[200]),
                border: OutlineInputBorder(
                  //<-- SEE HERE
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
                ),
                enabledBorder: OutlineInputBorder(
                  //<-- SEE HERE
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
                ),

              ),
              dropDownList: widget.dropDownList


          ),
        ],
      ),
    );
  }

}

