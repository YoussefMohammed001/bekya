import 'package:bekya/core/styles/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  AppTextField({
    Key? key,
    required this.hint,
    required this.keyboardType,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = Colors.black,
    required this.icon,
    required this.controller,
    required this.isPassword,
    this.validators,
    required this.textInputAction,
    required this.title,
    this.obscureText = false,
    this.enabled,
    this.onFieldSubmitted,
    this.focusNode,
  }) : super(key: key);
  final Color textColor;
  final String hint;
  final TextInputType keyboardType;

  final bool isPassword;
  final FormFieldValidator<String>? validators;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final String title;
  final IconData icon;
  bool obscureText = false;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  final bool? enabled;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: AppColors.offWhite
      ),
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      validator: widget.validators,
      obscureText: widget.obscureText,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        labelText: widget.title,
        labelStyle:  TextStyle(color: Colors.grey[300]),
        prefixIcon: Icon(widget.icon,color: AppColors.primary,),
        suffixIcon: Visibility(
          visible: widget.isPassword,
          child: InkWell(
            onTap: () {
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },
            child: Icon(
              widget.obscureText
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: AppColors.primary,
            ),
          ),
        ),
        border: OutlineInputBorder(
    //<-- SEE HERE
    borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
    ),
        enabledBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
        ),
        hintText: widget.hint,
        hintStyle:  const TextStyle(color: Colors.grey),





      ),
    );
  }
}
