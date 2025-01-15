import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_app/features/authentication/data/auth_repository.dart';
import 'package:riverpod_architecture_app/features/authentication/presentation/account_screen.dart';
import 'package:riverpod_architecture_app/features/authentication/presentation/sign_in_screen.dart';
import 'package:riverpod_architecture_app/main.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  @override
  void initState() {
    logger.d('######################################');
    logger.d('AuthScreen initState');
    super.initState();
  }

  @override
  void dispose() {
    logger.d('AuthScreen dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userStream = ref.watch(userStreamProvider);
    return userStream.maybeWhen(
      data: (user) => user != null ? AccountScreen() : SignInScreen(),
      orElse: () => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
