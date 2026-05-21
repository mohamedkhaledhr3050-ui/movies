import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/DI/di.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/strings_manager.dart';
import 'package:movies/core/resources/validations.dart';
import 'package:movies/core/reusable/custom_field.dart';
import 'package:movies/core/reusable/main_button.dart';
import 'package:movies/data/model/user_model.dart';
import 'package:movies/ui/Auth/register/registerStates/register_states.dart';
import 'package:movies/ui/Auth/register/viewModel/register_view_model.dart';
import 'package:movies/ui/Auth/register/widgets/avatar_widget.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/routes_manager.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late PageController _pageController;
  final List<String> avatars = [
    AssetsManager.avatar2,
    AssetsManager.avatar1,
    AssetsManager.avatar3,
  ];
  int _selectedIndex = 1;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 1, viewportFraction: 0.35);
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<RegisterViewModel>(),
      child: BlocConsumer<RegisterViewModel, RegisterStates>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Account Created Successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushReplacementNamed(context, RoutesManager.home);
          }

          else if(state is RegisterErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                StringsManager.register,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontSize: 16.sp),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Padding(
              padding: REdgeInsets.all(18),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 195.h,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: avatars.length,
                          onPageChanged: (index) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            bool isCenter = index == _selectedIndex;
                            return Center(
                              child: Column(
                                children: [
                                  AvatarWidget(
                                    size: isCenter ? 161.h : 94.h,
                                    imagePath: avatars[index],
                                  ),
                                  SizedBox(height: 8.h),
                                  AnimatedOpacity(
                                    duration: const Duration(milliseconds: 200),
                                    opacity: isCenter ? 1.0 : 0.0,
                                    child: Text(
                                      "Avatar",
                                      style: Theme.of(context).textTheme.labelSmall
                                          ?.copyWith(fontSize: 16.sp),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 12.h),
                      CustomField(
                        hint: StringsManager.name,
                        prefix: AssetsManager.name,
                        validator: (value) => Validations.validateUsername(value),
                        controller: nameController,
                      ),
                      SizedBox(height: 24.h,),
                      CustomField(
                        hint: StringsManager.email,
                        prefix: AssetsManager.email,
                        validator: (value) => Validations.validateEmail(value),
                        controller: emailController,
                      ),
                      SizedBox(height: 24.h,),
                      CustomField(
                        hint: StringsManager.password,
                        prefix: AssetsManager.password,
                        validator: (value) => Validations.validatePassword(value),
                        controller: passwordController,
                        isObscure: true,
                      ),
                      SizedBox(height: 24.h,),
                      CustomField(
                        hint: StringsManager.confirmPassword,
                        prefix: AssetsManager.password,
                        validator: (value) => Validations.validateConfirmPassword(value, passwordController.text),
                        controller: confirmPasswordController,
                        isObscure: true,
                      ),
                      SizedBox(height: 24.h,),
                      CustomField(
                        hint: StringsManager.phoneNumber,
                        prefix: AssetsManager.phone,
                        validator: (value) => Validations.validatePhoneNumber(value),
                        controller: phoneController,
                      ),
                      SizedBox(height: 24.h,),
                      state is RegisterLoadingState? const Center(child: CircularProgressIndicator(),) : MainButton(onClick: (){
                        if(_formKey.currentState!.validate()){
                          context.read<RegisterViewModel>().register(model: UserModel(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            avatarId: _selectedIndex,
                          ), password: passwordController.text);
                        }
                      }, title: StringsManager.createAcc),
                      SizedBox(height: 17.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringsManager.alreadyHaveAcc,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: ColorsManager.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RoutesManager.login);
                            },
                            child: Text(
                              StringsManager.login,
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),

                    ],
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
