import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googlebooksi/src/core/constants/strings.dart';
import 'package:googlebooksi/src/core/routes.dart';
import 'package:googlebooksi/src/services/navigation_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      //theme: AppTheme.lightTheme,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: ref.read(navigationService).navigatorKey,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card();
  }
}
