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
import 'package:movies/ui/Auth/forgetPassword/forgetPassStates/forget_password_states.dart';
import 'package:movies/ui/Auth/forgetPassword/viewModel/forget_password_viewModel.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ForgetPasswordViewmodel>(),
      child: BlocConsumer<ForgetPasswordViewmodel,ForgetPasswordStates>(
        listener: (context, state) {
          if(state is ForgetSuccessState){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password reset link has been sent to your email!'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 4),
              ),
            );
          }

          else if (state is ForgetErrorState) {
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
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                StringsManager.forgetPass,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontSize: 16.sp),
              ),
            ),
            body: Padding(
              padding: REdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        AssetsManager.forgetPassBg,
                        width: double.infinity,
                        height: 430.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 24.h),
                      CustomField(
                        hint: StringsManager.email,
                        prefix: AssetsManager.email,
                        validator: (value) => Validations.validateEmail(value),
                        controller: emailController,
                      ),
                      SizedBox(height: 24.h),
                      state is ForgetLoadingState? const Center(child: CircularProgressIndicator(color: Color(0xFFF6BD00),),):MainButton(onClick: (){
                        if(_formKey.currentState!.validate()){
                          context.read<ForgetPasswordViewmodel>().forgetPassword(model: UserModel(email: emailController.text));
                        }
                      }, title: StringsManager.verifyEmail)
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
