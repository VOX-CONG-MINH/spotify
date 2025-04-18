import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/routes/app_router.gr.dart';

import '../ui.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BasePageState<RegisterPage, RegisterPageBloc> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          Assets.icons.spotifyIcon.path,
          height: 40,
        ),
        leading: IconButton(
          highlightColor: Colors.transparent,
          onPressed: () {
            context.router.push(const IntroRoute());
          },
          icon: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.03),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 40,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TopSignupSigninWidget(
                title: 'Sign Up',
                body: Column(
                  children: [
                    BasicTextField(
                      controller: _name,
                      hintText: 'Full Name',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BasicTextField(
                      controller: _email,
                      hintText: 'Enter Email',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<RegisterPageBloc, RegisterPageState>(
                      buildWhen: (previous, current) {
                        return previous.isPasswordObscured !=
                            current.isPasswordObscured;
                      },
                      builder: (context, state) {
                        return BasicTextField(
                          controller: _password,
                          hintText: 'Password',
                          obscureText: state.isPasswordObscured,
                          onTap: () {
                            context.read<RegisterPageBloc>().add(
                                  const RegisterPasswordVisibility(),
                                );
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BlocListener<RegisterPageBloc, RegisterPageState>(
                      listener: (context, state) {
                        if (state.status == RegisterStatus.success) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else if (state.status == RegisterStatus.failure &&
                            state.errorMessage.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                      child: BlocBuilder<RegisterPageBloc, RegisterPageState>(
                        buildWhen: (previous, current) {
                          return previous.status != current.status;
                        },
                        builder: (context, state) {
                          return BasicAppButton(
                            onPressed: () {
                              context.read<RegisterPageBloc>().add(
                                    RegisterAccount(
                                      email: _email.text,
                                      password: _password.text,
                                      name: _name.text,
                                    ),
                                  );
                            },
                            title: 'Create Account',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              BottomSignupSigninWidget(
                signInOnTap: () {},
                signUpOnTap: () {},
                title: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
