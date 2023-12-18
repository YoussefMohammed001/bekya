import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/widgets/main_category_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key, required this.icon, required this.title, required this.onTap});
final String icon;
final String title;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
  return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Row(
          children: [
            MainCategoryItem(icon: icon,),
            Text(
              title,
              style: TextStyle(
                color: AppColors.offWhite,
                fontSize: 18.sp,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded,color: AppColors.offWhite,)
          ],
        ),
      ),
    );
  }
}
