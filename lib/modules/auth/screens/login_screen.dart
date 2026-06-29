import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../providers/app_providers.dart';
import '../controllers/login_form_controller.dart';
import '../widgets/auth_header.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(loginFormControllerProvider);
    final authState = ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      if (previous?.isLoggedIn == false && next.isLoggedIn) {
        context.go(AppRoutes.home);
      }

      final errorMessage = next.errorMessage;
      if (errorMessage != null && errorMessage != previous?.errorMessage) {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthHeader(),
                  const SizedBox(height: 28),
                  TextField(
                    key: const Key('emailField'),
                    decoration: const InputDecoration(labelText: 'Email'),
                    controller: TextEditingController(text: formState.email)
                      ..selection = TextSelection.collapsed(
                        offset: formState.email.length,
                      ),
                    onChanged: ref
                        .read(loginFormControllerProvider.notifier)
                        .updateEmail,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    key: const Key('passwordField'),
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    controller: TextEditingController(text: formState.password)
                      ..selection = TextSelection.collapsed(
                        offset: formState.password.length,
                      ),
                    onChanged: ref
                        .read(loginFormControllerProvider.notifier)
                        .updatePassword,
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Demo login: test@test.com / 123456',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: authState.isLoading
                          ? null
                          : () {
                              ref.read(authControllerProvider.notifier).login(
                                    email: formState.email,
                                    password: formState.password,
                                  );
                            },
                      child: Text(
                        authState.isLoading ? 'Signing in...' : 'Login',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.go(AppRoutes.support),
                    child: const Text('Need help? Open support'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}