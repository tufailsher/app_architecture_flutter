import 'package:custody_rx/app/app_routes.dart';
import 'package:custody_rx/app/app_strings.dart';
import 'package:custody_rx/app/app_theme.dart';
import 'package:custody_rx/app/extensions.dart';
import 'package:custody_rx/app/navigation_service.dart';
import 'package:custody_rx/bloc/auth_bloc/auth_bloc.dart';
import 'package:custody_rx/bloc/auth_bloc/auth_events.dart';
import 'package:custody_rx/bloc/auth_bloc/auth_states.dart';
import 'package:custody_rx/widgets/custody_logo.dart';
import 'package:custody_rx/screens/auth/login_mixin.dart';
import 'package:custody_rx/widgets/login_button.dart';
import 'package:custody_rx/widgets/my_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppMaterialColor.primarySwatch.shade900,
      body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SizedBox(
              // color: Colors.red,
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const CustodyLogo(),
                        LoginCard(),
                      ],
                    ),
                  ),
                  if (state is AuthPageLoading) ...[
                    Positioned.fill(
                      child: Container(
                        color: AppColors.lightGrey.withOpacity(0.5),
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  ]
                ],
              ),
            );
          }),
    );
  }
}

// ignore: must_be_immutable
class LoginCard extends StatelessWidget with LoginMixin {
  LoginCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthPageLoaded) {
        NavigationService.popToDashboard();
      }
    }, builder: (context, state) {
      // }
      // else if (state is AuthPageLoaded || state is AuthPageError) {
      //  Future.microtask(() => {
      //    FullScreenLoader().hide()
      //  });
      // }
      return Form(
        key: formKey,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.loginAccount,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      MyFormField(
                          filled: true,
                          controller: emailController,
                          // decoration: const InputDecoration(
                          labelText: AppStrings.userName,
                          autofocus: true,
                          // ),
                          validator: (value) => value!.validateEmail()),
                      const SizedBox(height: 16.0),
                      MyFormField(
                        obscureText: state is PasswordVisibilityToggled
                            ? !state.isPasswordVisible
                            : true,
                        suffixIcon: IconButton(
                          icon: Icon(
                            state is PasswordVisibilityToggled &&
                                    state.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(TogglePasswordVisibilityEvent());
                          },
                        ),
                        filled: true,
                        controller: passwordController,
                        // decoration: const InputDecoration(
                        labelText: AppStrings.password,
                        // ),
                        validator: (value) => value!.validatePassword(),
                      ),
                      const SizedBox(height: 16.0),
                      LoginButton(
                        onPressed: () => onClick(
                          () {
                            BlocProvider.of<AuthBloc>(context).add(
                                AuthFetchDataEvent(emailController.text.trim(),
                                    passwordController.text.trim()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
