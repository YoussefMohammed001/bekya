import 'package:bekya/features/home/manager/home_cubit.dart';
import 'package:bekya/features/home/view/widgets/home_app_bar.dart';
import 'package:bekya/features/home/view/widgets/home_categories_wdget.dart';
import 'package:bekya/features/home/view/widgets/home_slider.dart';
import 'package:bekya/features/home/view/widgets/products_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cubit = HomeCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>cubit..getCat(),
      child: Container(
        margin: EdgeInsets.all(13.sp),

        child: LayoutBuilder(
          builder: (context, constrains) =>
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constrains.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [

                        const HomeAppBar(),
                        HomeCategoriesWidgets(cats: cubit.cats,),
                        HomeSlider(),
                        const ProductsItem(title: 'Villa For Sale',),
                        const ProductsItem(title: 'Villa For Rent',),
                      ],),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
