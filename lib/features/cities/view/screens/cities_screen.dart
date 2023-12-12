import 'package:bekya/core/shared/my_shared.dart';
import 'package:bekya/core/shared/my_shared_keys.dart';
import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/utils/safe_print.dart';
import 'package:bekya/core/widgets/app_text_field.dart';
import 'package:bekya/features/cities/manager/cities_cubit.dart';
import 'package:bekya/features/main/view/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CitiesScreen extends StatefulWidget {
 const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  final cubit = CitiesCubit();

final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => cubit..getCities(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.grey[900],
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
                        Icons.close,
                        color: AppColors.offWhite,
                      )),
                  Text(
                    "Pick Location",
                    style: TextStyle(
                        color: AppColors.offWhite,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            AppTextField(
                onFieldSubmitted: (value){
                  setState(() {

                  });
                },
                hint: "cairo",
                keyboardType: TextInputType.text,
                icon: Icons.search_outlined,
                controller: TextEditingController(),
                isPassword: false,
                textInputAction: TextInputAction.search,
                title: "search for city"),
            SizedBox(height: 2.h,),
            BlocBuilder<CitiesCubit, CitiesState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Visibility(
                        visible: searchController.text.contains(cubit.cities[index].city) || searchController.text.isEmpty,
                        child: InkWell(
                          onTap: () {
                            MyShared.putString(
                                    key: MySharedKeys.city,
                                    value: cubit.cities[index].city)
                                .then((value) {
                              MyShared.putString(
                                      key: MySharedKeys.cityId,
                                      value: cubit.cities[index].id)
                                  .then((value) {
                                pushReplacement(context, MainScreen());
                                safePrint(
                                    MyShared.getString(key: MySharedKeys.cityId));
                                safePrint(
                                    MyShared.getString(key: MySharedKeys.city));
                              });
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(12.sp),
                            child: Text(
                              cubit.cities[index].city,
                              style: TextStyle(
                                color: AppColors.offWhite,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: cubit.cities.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Divider(
                          thickness: 1.sp,
                          color: Colors.grey[200],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
