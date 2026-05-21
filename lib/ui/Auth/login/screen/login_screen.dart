import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/DI/di.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/routes_manager.dart';
import 'package:movies/core/resources/strings_manager.dart';
import 'package:movies/core/resources/validations.dart';
import 'package:movies/core/reusable/custom_field.dart';
import 'package:movies/core/reusable/main_button.dart';
import 'package:movies/ui/Auth/login/loginStates/login_states.dart';
import 'package:movies/ui/Auth/login/viewModel/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<LoginViewModel>(),
      child: BlocConsumer<LoginViewModel, LoginStates>(
        listener: (context, state) {
          if (state is SuccessState) {
            Navigator.pushReplacementNamed(context, RoutesManager.home);
          }
          else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: REdgeInsets.all(19),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(AssetsManager.logo),
                        SizedBox(height: 69.h),
                        CustomField(
                          controller: emailController,
                          validator: (value) =>
                              Validations.validateEmail(value),
                          hint: StringsManager.email,
                          prefix: AssetsManager.email,
                        ),
                        SizedBox(height: 22.h),
                        CustomField(
                          controller: passwordController,
                          validator: (value) =>
                              Validations.validatePassword(value),
                          hint: StringsManager.password,
                          prefix: AssetsManager.password,
                          isObscure: true,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RoutesManager.forgetPass);
                            },
                            child: Text(
                              StringsManager.forgetPassword,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                        SizedBox(height: 33.h),

                        state is LoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : MainButton(
                                onClick: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<LoginViewModel>().login(
                                      email: emailController.text.trim(),
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                title: StringsManager.login,
                              ),
                        SizedBox(height: 22.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StringsManager.dontHaveAcc,
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(color: ColorsManager.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, RoutesManager.register);
                              },
                              child: Text(
                                StringsManager.createOne,
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 27.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 110.84.w,
                              child: Divider(
                                color: Theme.of(context).colorScheme.primary,
                                thickness: 1.12.h,
                                endIndent: 10.w,
                              ),
                            ),
                            Text(
                              StringsManager.or,
                              style: Theme.of(
                                context,
                              ).textTheme.titleSmall?.copyWith(fontSize: 15.sp),
                            ),
                            SizedBox(
                              width: 110.84.w,
                              child: Divider(
                                color: Theme.of(context).colorScheme.primary,
                                thickness: 1.12.h,
                                indent: 10.w,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 28.h),
                        MainButton(
                          onClick: () {},
                          title: StringsManager.loginWithGoogle,
                          icon: SvgPicture.asset(AssetsManager.googleIcon),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
