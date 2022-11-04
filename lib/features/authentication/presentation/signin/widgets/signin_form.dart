part of '../signin_screen.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Card(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size),
                ),
                margin: const EdgeInsetsDirectional.only(
                  start: size * 3,
                  end: size * 3,
                  top: size * 3,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    FormTitle(),
                    Email(),
                    Password(),
                    ShowPassword(),
                    SignInButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void fieldFocusChange(
  BuildContext context,
  FocusNode currentFocus,
  FocusNode nextFocus,
) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
