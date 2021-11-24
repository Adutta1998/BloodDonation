import 'package:blood_donation/cubits/signup.cubit.dart';
import 'package:blood_donation/custom_widgets/buttons.dart';
import 'package:blood_donation/custom_widgets/text_fields.dart';
import 'package:blood_donation/repositories/authentication_repository.dart';
import 'package:blood_donation/utils/common_utils.dart';
import 'package:blood_donation/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  static const ROUTE_NAME = "/signup";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var repo = context.watch<AuthenticationRepository>();
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(authRepository: repo),
      child: Scaffold(
        bottomNavigationBar: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (_, state) {
            if (state.error) {
              CommonUtils.showSnackBar(context, "Some Error Occured");
            }
            if (state.loaded) {
              CommonUtils.showSnackBar(context, "Data Got", variant: "success");
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: PrimaryButton(
                text: "Signup",
                isLoading: state.loading,
                onTap: () {
                  context.read<SignUpCubit>().signup();
                },
              ),
            );
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "SIGNUP",
                  style: CustomFontStyle.bolderFontStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                Image.asset("assets/drawing.png"),
                const SizedBox(
                  height: 32,
                ),
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return CustomTextField(
                        hintText: "Enter Email",
                        onChenge: context.read<SignUpCubit>().changeEmail);
                  },
                ),
                const SizedBox(height: 8),
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return CustomTextField(
                        hintText: "Enter Password",
                        isPassword: true,
                        onChenge: context.read<SignUpCubit>().changePassword);
                  },
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: "Confirm Password",
                  isPassword: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
