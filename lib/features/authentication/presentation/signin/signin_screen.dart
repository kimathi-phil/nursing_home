import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/config/config.dart';
import 'package:flutter_playground/config/di/di.dart';
import 'package:flutter_playground/features/authentication/domain/entities/registered_user.dart';
import 'package:flutter_playground/features/features.dart';
import 'package:flutter_playground/features/shared/presentation/widgets/common.dart';
import 'package:flutter_playground/l10n/l10n.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:go_router/go_router.dart';

part 'widgets/email.dart';
part 'widgets/signin_form.dart';
part 'widgets/form_title.dart';
part 'widgets/logo.dart';
part 'widgets/password.dart';
part 'widgets/show_password.dart';
part 'widgets/signin_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthenticationCubit>(),
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationFailed) {
            setSnackbar(context, 'Something went wrong...');
          } else if (state is AuthenticationSuccess) {
            setSnackbar(context, 'Success');
            context.goNamed(
              AppRouter.home,
              queryParams: {'uid': state.user.uid},
            );
          }
        },
        child: Scaffold(
          // key: _scaffoldKey,
          body: SafeArea(
            child: Container(
              color: kGreyColor100,
              padding: const EdgeInsetsDirectional.only(
                bottom: size * 2,
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: size * 12),
                  const Logo(),
                  SignInForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
