import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_safelink/config/theme/app_theme.dart';
import 'package:test_safelink/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:test_safelink/presentation/widgets/inputs/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    const textStyle = TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold);

    return BlocProvider(
      create: (_) => LoginBloc(),
      child: BlocLoginView(colors: colors, textStyle: textStyle),
    );
  }
}

class BlocLoginView extends StatelessWidget {
  const BlocLoginView({
    super.key,
    required this.colors,
    required this.textStyle,
  });

  final ColorScheme colors;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomBackGround(colors: colors),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Center(
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 150,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text('INICIAR SESIÓN',
                          style: textStyle.copyWith(fontSize: 40)),
                    ),
                    const SizedBox(height: 70),
                    Text(
                      'Usuario',
                      style: textStyle,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      onChanged: (value) {
                        context
                            .read<LoginBloc>()
                            .add(LoginEmailChanged(email: value));
                      },
                      errorMessage: context.select((LoginBloc bloc) =>
                          bloc.state.isFormPosted
                              ? bloc.state.email.errorMessage
                              : null),
                      hint: 'email@example.com',
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Contraseña',
                      style: textStyle,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      obscureText: context
                          .select((LoginBloc bloc) => bloc.state.isObscure),
                      suffixIcon: InkWell(
                          onTap: () => context.read<LoginBloc>().showText(),
                          child: context.select(
                            (LoginBloc bloc) => bloc.state.isObscure
                                ? const Icon(
                                    Icons.visibility,
                                    size: 25,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    size: 25,
                                  ),
                          )),
                      onChanged: (value) => context
                          .read<LoginBloc>()
                          .add(LoginPasswordChanged(password: value)),
                      errorMessage: context.select((LoginBloc bloc) =>
                          bloc.state.isFormPosted
                              ? bloc.state.password.errorMessage
                              : null),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: const ButtonStyle(),
                            onPressed: () {
                              FocusScope.of(context).unfocus();

                              context
                                  .read<LoginBloc>()
                                  .add(LoginFormSubmitted(context));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                'INGRESAR',
                                style:
                                    textStyle.copyWith(color: colors.primary),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomBackGround extends StatelessWidget {
  const CustomBackGround({
    super.key,
    required this.colors,
  });

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colors.primary,
            AppTheme.lightSeedColor,
          ],
        ),
      ),
      width: double.infinity,
      height: double.infinity,
    );
  }
}
