part of '../signin_screen.dart';

String password = '';
final passwordController = TextEditingController();
FocusNode passFocus = FocusNode();

class Password extends StatelessWidget {
  const Password({super.key});

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
        keyboardType: TextInputType.text,
        obscureText: !_showPassword,
        focusNode: passFocus,
        onFieldSubmitted: (v) {
          login(context);
        },
        textInputAction: TextInputAction.next,
        style: const TextStyle(
          color: kBlackColor900,
          fontWeight: FontWeight.normal,
        ),
        controller: passwordController,
        // validator: (val) => validatePass(),
        onSaved: (String? value) {
          password = value!;
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: kGreyColor900,
            size: size * 2,
          ),
          hintText: l10n.password,
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
