import 'package:bekya/core/styles/colors.dart';
import 'package:bekya/core/utils/navigators.dart';
import 'package:bekya/core/utils/safe_print.dart';
import 'package:bekya/core/utils/snack_bar.dart';
import 'package:bekya/core/widgets/app_button.dart';
import 'package:bekya/core/widgets/app_text_field.dart';
import 'package:bekya/features/login/manager/login_cubit.dart';
import 'package:bekya/features/login/model/login_model.dart';
import 'package:bekya/features/main/view/screens/main_screen.dart';
import 'package:bekya/features/register/view/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailEditingController = TextEditingController();

  final TextEditingController passEditingController = TextEditingController();

  final cubit = LoginCubit();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Form(
        key: _formKey,
        child: Scaffold(
            backgroundColor: AppColors.second,
            body: Container(
              margin: EdgeInsets.all(15.sp),
              child: LayoutBuilder(
                builder: (context, constrains) =>
                    SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constrains.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text("BEKYA",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.offWhite,
                                  fontSize: 30.sp,
                                ),),
                              SizedBox(height: 2.h,),
                              AppTextField(
                                  validators: (value) {
                                    if(value!.isEmpty){
                                      return "This field is Required";
                                    }

                                    return null;
                                  },
                                  hint: "example@email.com",
                                  keyboardType: TextInputType.emailAddress,
                                  icon: Icons.email_outlined,
                                  controller: emailEditingController,
                                  isPassword: false,
                                  textInputAction: TextInputAction.next,
                                  title: "Email"),
                              SizedBox(height: 2.h,),
                              AppTextField(
                                  validators: (value) {
                                    if(value!.isEmpty){
                                      return "This field is Required";
                                    }

                                    return null;
                                  },
                                  hint: "**************",
                                  keyboardType: TextInputType.visiblePassword,
                                  icon: Icons.password,
                                  controller: passEditingController,
                                  isPassword: true,
                                  textInputAction: TextInputAction.done,
                                  title: "Password"),
                              SizedBox(height: 2.h,),
                              InkWell(
                                onTap: () {
                                  /// /// /// /// /// /// /// /// /// ///
                                },
                                child: Container(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: const Text("Forget Password",
                                    style: TextStyle(
                                      color: AppColors.offWhite,
                                    ),),
                                ),
                              ),
                              SizedBox(height: 2.h,),

                              BlocConsumer<LoginCubit, LoginState>(
                                listener: (context, state) {

                                  if(state is LoginLoading){
                                    safePrint("loading");
                                  }
                                  if(state is LoginSuccess){
                                    pushReplacement(context, MainScreen());

                                    safePrint("success");
                                  }
                                  if(state is LoginFailure){
                                    snackBar(context,state.message,AppColors.red);
                                    safePrint("failure");
                                  }
                                },
                                builder: (context, state) {
                                  return cubit.state is LoginLoading ? CircularProgressIndicator(color: AppColors.primary,) :AppButton(
                                      margin: const EdgeInsets.all(0),
                                      padding: EdgeInsets.all(12.sp),
                                      bgColor: AppColors.primary,
                                      borderRadius: BorderRadius.circular(12.sp),
                                      onPressed: () {

                                        if(_formKey.currentState!.validate()){
                                          cubit.login(loginModel: LoginModel(
                                              email: emailEditingController.text.trim(),
                                              pass:passEditingController.text ));

                                        }

                                       },
                                      label: "Sign In");
                                },
                              ),
                              SizedBox(height: 2.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't have account?",
                                    style: TextStyle(
                                      color: AppColors.offWhite,
                                    ),),
                                  SizedBox(width: 1.w,),
                                  InkWell(
                                    onTap: () {
                                      push(context, RegisterScreen());
                                    },
                                    child: const Text("Sign Up",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                      ),),
                                  ),

                                ],)

                            ],),
                        ),
                      ),
                    ),
              ),
            )
        ),
      ),
    );
  }
}
