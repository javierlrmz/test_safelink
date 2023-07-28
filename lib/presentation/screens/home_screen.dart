import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_safelink/presentation/blocs/auth_bloc/bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const BlocHomeView(),
    );
  }
}

class BlocHomeView extends StatelessWidget {
  const BlocHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 40),
              const Text(
                'Bienvenido a mi app',
                style: TextStyle(fontSize: 25),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  context.read<AuthBloc>().add(DeleteAuthToken(context));
                  context.go('/');
                },
                icon: const Icon(Icons.logout, size: 30,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
