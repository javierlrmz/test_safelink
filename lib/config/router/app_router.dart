import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/blocs/auth_bloc/bloc/auth_bloc.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return FutureBuilder<void>(
          future: Future.delayed(const Duration(milliseconds: 100), () {
            context.read<AuthBloc>().add(GetAuthToken());
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              String? token; 
              token = context.select((AuthBloc bloc) => bloc.state.token);
              if (token != null && token.isNotEmpty) {
                return const HomeScreen();
              } else {
                return const LoginScreen();
              }
            } else {              
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
