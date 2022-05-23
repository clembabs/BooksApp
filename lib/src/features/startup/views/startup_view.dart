import 'package:flutter/material.dart';
import 'package:googlebooksi/src/features/authentication/views/login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartupView extends ConsumerWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Login();
    //   if (ref.watch(startupNotifierProvider.notifier).currentUser == null) {
    //     return LoginView();
    //   } else {
    //     return const HomeView();
    //   }
    // }
  }
}
