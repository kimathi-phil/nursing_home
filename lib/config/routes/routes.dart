import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_playground/features/features.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  const AppRouter._();

  static const signIn = 'login';
  static const home = 'home';
  static const todoDetail = 'todoDetail';

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    routes: [
      // GoRoute(
      //   name: signIn,
      //   path: '/signIn',
      //   pageBuilder: (context, state) => MaterialPage(
      //     key: state.pageKey,
      //     child: const SignInScreen(),
      //   ),
      // ),
      // GoRoute(
      //   name: home,
      //   path: '/home',
      //   pageBuilder: (context, state) => MaterialPage(
      //     key: state.pageKey,
      //     child: TasksScreen(uid: state.queryParams['uid']!),
      //   ),
      // ),
    ],
    initialLocation: '/signIn',
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: ErrorScreen(error: state.error),
    ),
  );
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.error});
  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const CloseButton()),
      body: const Center(
        child: Text('Something went wrong!'),
      ),
    );
  }
}
