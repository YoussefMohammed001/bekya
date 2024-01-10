import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/widgets/main_product_item.dart';
import 'package:bekya/features/category_products/manager/categories_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryProducts extends StatelessWidget {
   CategoryProducts({super.key, required this.id, required this.category});
  final cubit = CategoriesProductCubit();

  final String id;
  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      cubit
        ..geProducts(id: id),
      child: BlocBuilder<CategoriesProductCubit, CategoriesProductState>(
        builder: (context, state) {
          return Scaffold(

            appBar: AppBar(
              backgroundColor: Colors.grey[900],
              toolbarHeight: 0,
            ),
            backgroundColor: AppColors.second,
            body: Column(
              children: [
                Container(
                  color: Colors.grey[900],
                  padding: EdgeInsets.all(13.sp),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.offWhite,
                          )),
                      Text(
                        category,
                        style: TextStyle(
                            color: AppColors.offWhite,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return MainProductItem(
                        price: cubit.productModel[index].price,
                        title: cubit.productModel[index].title,
                        date: cubit.productModel[index].date.substring(0,10),
                        city: cubit.productModel[index].location,

                        bed: 5,
                        bath: 7,
                        area: 500,
                        isFav: true,
                        image:  cubit.productModel[index].images[0],
                        onFavTap: () {}, productId: cubit.productModel[index].productId,
                        catId: id,
                      );
                    },
                    itemCount: cubit.productModel.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
