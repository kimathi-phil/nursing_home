part of '../signin_screen.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 30),
      child: Center(
        child: Text(
          l10n.signIn,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .apply(color: kBlackColor800),
        ),
      ),
    );
  }
}
