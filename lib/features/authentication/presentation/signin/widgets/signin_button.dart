part of '../signin_screen.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({super.key});

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: size,
        bottom: size * 3,
        start: size * 3,
        end: size * 3,
      ),
      child: DefaultButton(
        widget: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationLoading) {
              return const Center(
                child: SizedBox(
                  width: size * 2,
                  height: size * 2,
                  child: CircularProgressIndicator(
                    color: kWhiteColor,
                  ),
                ),
              );
            } else {
              return Text(
                l10n.signIn,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: kWhiteColor,
                      fontWeight: FontWeight.normal,
                    ),
              );
            }
          },
        ),
        color: kPrimaryColor,
        onBtnSelected: () => login(context),
      ),
    );
  }
}

Future<void> login(BuildContext context) {
  return context.read<AuthenticationCubit>().logIn(
        UserDetails(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
}
