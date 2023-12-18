import 'package:bekya/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.title, required this.body, required this.icon, required this.onTap});
final String title,body;
final IconData icon;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(15.sp),

        child: Row(children: [
          Icon(icon,color: AppColors.offWhite,
            size: 23.sp,
          ),
          SizedBox(width: 5.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,

              ),),
              Text(body,style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 16.sp,

              ),),
            ],
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios_rounded,color: AppColors.offWhite,
            size: 23.sp,
          ),
        ],),
      ),
    );
  }
}
