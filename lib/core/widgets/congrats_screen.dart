import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/widgets/app_button.dart';
import 'package:bekya/features/main/view/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class AppCongrats extends StatefulWidget {
  const AppCongrats({super.key, required this.title,required this.icon,});
  final String title;

  final String icon;


  @override
  State<AppCongrats> createState() => _AppCongratsState();
}

class _AppCongratsState extends State<AppCongrats> {
  double logoHeight = 7.5.h;
  double logoWidth = 15.w;

  double buttonOpacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 500),
          () {
        logoHeight = 15.h;
        logoWidth = 30.w;

        setState(() {});
      },
    );

    Future.delayed(
      const Duration(milliseconds: 2000),
          () {
        buttonOpacity = 1;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.second,
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      height: logoHeight,
                      width: logoWidth,
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.bounceOut,
                      child: Image.asset(
                        "assets/images/${widget.icon}",
                        height: logoHeight,
                        width: logoWidth,
                      ),
                    ),


                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      widget.title,
                      style:  TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 17.sp),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.bounceOut,
                      opacity: buttonOpacity,
                      child: AppButton(
                          bgColor: AppColors.primary.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(15.sp),
                          margin: EdgeInsets.symmetric(horizontal: 30.sp),
                          onPressed: (){
                            pushReplacement(context, const MainScreen());
                          },
                          label: "Back To Home"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}