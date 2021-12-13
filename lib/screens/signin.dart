import 'package:blood_donation/cubits/signin.cubit.dart';
import 'package:blood_donation/custom_widgets/buttons.dart';
import 'package:blood_donation/custom_widgets/text_fields.dart';
import 'package:blood_donation/repositories/authentication_repository.dart';
import 'package:blood_donation/screens/bottom_navigation.dart';
import 'package:blood_donation/screens/signup.dart';
import 'package:blood_donation/utils/colors.dart';
import 'package:blood_donation/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  static const ROUTE_NAME = "/signin";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationRepository repository =
        context.watch<AuthenticationRepository>();
    return BlocProvider<SignInCubit>(
      create: (context) => SignInCubit(authRepository: repository),
      child: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state.loaded) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => BottomNavigationScreen(),
              ),
            );
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Image.asset(
                          'assets/drawing.png',
                          scale: .9,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "BLOODFRIEND",
                          style: CustomFontStyle.bolderFontStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("A Friend in Need is a\n Friend indeed",
                            textAlign: TextAlign.center,
                            style: CustomFontStyle.subtitleFontStyle),
                        const SizedBox(
                          height: 30,
                        ),
                        BlocBuilder<SignInCubit, SignInState>(
                          builder: (context, state) {
                            return CustomTextField(
                              hintText: "Email",
                              onChenge: context.read<SignInCubit>().updateEmail,
                            );
                          },
                        ),
                        BlocBuilder<SignInCubit, SignInState>(
                          builder: (context, state) {
                            return CustomTextField(
                              hintText: "password",
                              onChenge:
                                  context.read<SignInCubit>().updatePassword,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        BlocBuilder<SignInCubit, SignInState>(
                          builder: (context, state) {
                            return PrimaryButton(
                              text: "Login",
                              onTap: () {
                                context.read<SignInCubit>().login();
                              },
                            );
                          },
                        ),
                        Expanded(child: Container()),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, SignUpScreen.ROUTE_NAME);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Not A User? "),
                              Text(
                                "Signup!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.redAccent1),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
