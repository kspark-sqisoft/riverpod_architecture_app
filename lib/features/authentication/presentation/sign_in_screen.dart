import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_app/features/authentication/presentation/sign_in_screen_controller.dart';
import 'package:riverpod_architecture_app/main.dart';
import 'package:riverpod_architecture_app/utils/async_value_ui.dart';

import '../../../common/provider/provider.dart';
import '../data/auth_repository.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(signInScreenControllerProvider, (_, next) {
      logger.d('SignInScreen listen signInScreenControllerProvider next:$next');
      next.showSnackbarOnError(context);
    });
    final state = ref.watch(signInScreenControllerProvider);
    logger.d('-------------------------------------');
    logger.d('SignInScreen ref.watch(helloProvider)');
    final hello = ref.watch(helloProvider);
    logger.d('SignInScreen ref.watch(hiProvider)');
    final hi = ref.watch(hiProvider);
    logger.d('SignInScreen ref.watch(nationProvider)');
    final nation = ref.watch(nationProvider);
    logger.d('SignInScreen ref.watch(nameProvider)');
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(hello),
            Text(hi),
            Divider(),
            Column(
              children: [
                Text(nation),
                ElevatedButton(
                  onPressed: () {
                    logger.d(
                        'SignInScreen ref.read(nationProvider.notifier).change(nationName)');
                    if (nation == 'korea') {
                      ref.read(nationProvider.notifier).change('japan');
                    } else {
                      ref.read(nationProvider.notifier).change('korea');
                    }
                  },
                  child: Text('nationProvider - keepAlive '),
                ),
              ],
            ),
            Divider(),
            Column(
              children: [
                Text(name),
                ElevatedButton(
                    onPressed: () {
                      logger.d(
                          'SignInScreen ref.read(nameProvider.notifier).change(name)');
                      if (name == 'keesoon') {
                        ref.read(nameProvider.notifier).change('younga');
                      } else {
                        ref.read(nameProvider.notifier).change('keesoon');
                      }
                    },
                    child: Text('nameProvider - autoDispose'))
              ],
            ),
            Divider(),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: state.isLoading
                    ? null
                    : () {
                        ref
                            .read(signInScreenControllerProvider.notifier)
                            .signInAnonymously();
                      },
                child: state.isLoading
                    ? CircularProgressIndicator()
                    : Text('Sign in anonymously'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
