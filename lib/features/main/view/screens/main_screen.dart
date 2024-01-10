import 'package:bekya/core/shared/my_shared.dart';
import 'package:bekya/core/shared/my_shared_keys.dart';
import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/utils/safe_print.dart';
import 'package:bekya/features/main/manager/main_cubit.dart';
import 'package:bekya/features/sell_Product/view/screens/sell_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
   const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
final cubit = MainCubit();
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,

      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return Scaffold(

              backgroundColor: AppColors.second,
              body:SafeArea(child: Column(
                children: [
                  Visibility(
                    visible:  MyShared.getBoolean(key: MySharedKeys.isVerified) == false,
                    child: Container(
                      color: AppColors.red,
                      padding: EdgeInsets.all(13.sp),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Your account is not verified",style: TextStyle(
                            color: Colors.white
                          ),),
                          SizedBox(width: 1.w,),
                          InkWell(
                            onTap: () {

                            },
                            child: const Text("go to your mail inbox and verify your account",style: TextStyle(
                                color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: cubit.screens[cubit.index]),
                ],
              ),),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: AppColors.offWhite,
                            width: 1.sp)
                    )
                ),
                child: BottomNavigationBar(
                  currentIndex: cubit.index,

                  onTap: (value) {

                    safePrint(value);

                    if(value == 0){
                      cubit.goToHome();
                      safePrint(cubit.index);
                      setState(() {

                      });
                    }

                    if(value == 3){
                      cubit.goToAds();
                      safePrint(cubit.index);
                      setState(() {

                      });
                    }


                    if(value == 2){
                 push(context,  SellProductScreen());
                   //   Scaffold.of(context).showBottomSheet((context) => SellProductScreen());
                    //   showBottomSheet(context: context, builder: (context) {
                    //
                    //     return SellProductScreen();
                    //   },);

                    // showModalBottomSheet(context: context, builder: (context) =>SellProductScreen() ,);
                     }


                    if(value == 1){
                      safePrint(value);
                      cubit.goToChats();
                      safePrint(cubit.index);
                      setState(() {

                      });
                    }

                    if(value == 4){
                      cubit.goToProfile();
                      safePrint(cubit.index);
                      setState(() {

                      });
                    }



                  },
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: AppColors.second,
                  unselectedItemColor: AppColors.offWhite,
                  selectedItemColor: AppColors.primary,
                  items: [
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.home_filled), label: "Home"),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.wechat_sharp), label: "Chats"),
                    BottomNavigationBarItem(
                        icon: Container(
                            padding: EdgeInsets.all(9.sp),
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(20.sp)
                            ),
                            child:  Icon(Icons.add,color:AppColors.offWhite,size: 17.sp,)), label: "Sell"),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.my_library_books_outlined), label: "My Ads"),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: "Profile"),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
