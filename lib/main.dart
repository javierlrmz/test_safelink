import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_safelink/config/router/app_router.dart';
import 'package:test_safelink/config/theme/app_theme.dart';
import 'package:test_safelink/presentation/blocs/auth_bloc/bloc/auth_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => AuthBloc(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
