part of '../signin_screen.dart';

late final String email;
final emailController = TextEditingController();
final FocusNode emailFocus = FocusNode();

class Email extends StatelessWidget {
  const Email({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: size,
        start: size * 3,
        end: size * 3,
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        focusNode: emailFocus,
        textInputAction: TextInputAction.next,
        controller: emailController,
        style: const TextStyle(
          color: kBlackColor900,
          fontWeight: FontWeight.normal,
        ),
        // validator: (val) => validateEmail(),
        onSaved: (String? value) {
          email = value!;
        },
        onFieldSubmitted: (v) {
          fieldFocusChange(context, emailFocus, passFocus);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: kGreyColor900,
            size: size * 2,
          ),
          hintText: l10n.email,
          hintStyle: Theme.of(context)
              .textTheme
              .subtitle2!
              .apply(color: kGreyColor900),
          filled: true,
          fillColor: kGreyColor100,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: size, vertical: 5),
          prefixIconConstraints:
              const BoxConstraints(minWidth: size * 5, maxHeight: size * 3),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kGreyColor900),
            borderRadius: BorderRadius.circular(size),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: kWhiteColor),
            borderRadius: BorderRadius.circular(size),
          ),
        ),
      ),
    );
  }
}
