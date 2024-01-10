import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/widgets/main_category_item.dart';
import 'package:bekya/features/categories/view/screens/categories_screen.dart';
import 'package:bekya/features/category_products/view/screens/category_products.dart';
import 'package:bekya/features/home/manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeCategoriesWidgets extends StatelessWidget {
  const HomeCategoriesWidgets({
    super.key,
    required this.cats,
  });
  final List cats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 15.sp),
          child: Row(
            children: [
              Text(
                "Categories",
                style: TextStyle(
                    color: AppColors.offWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  push(
                      context,
                      CategoriesScreen(
                        cats: cats,
                      ));
                },
                child: Text(
                  "see all",
                  style: TextStyle(color: AppColors.offWhite, fontSize: 15.sp),
                ),
              ),
              SizedBox(
                width: 1.w,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.offWhite,
                size: 14.sp,
              )
            ],
          ),
        ),
        SizedBox(
          height: 13.h,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      push(context,  CategoryProducts(id: cats[index].id, category: cats[index].category,));
                    },
                    child: Column(
                      children: [
                        MainCategoryItem(icon: cats[index].image),
                        Text(
                          cats[index].category,
                          style: TextStyle(
                              color: AppColors.offWhite, fontSize: 14.sp),
                        )
                      ],
                    ),
                  );
                },
                itemCount: cats.length,
              );
            },
          ),
        )
      ],
    );
  }
}
