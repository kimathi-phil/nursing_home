part of '../signin_screen.dart';

bool _showPassword = false;

class ShowPassword extends StatelessWidget {
  const ShowPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 30,
        end: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Checkbox(
            value: _showPassword,
            checkColor: kBlackColor800,
            activeColor: kWhiteColor,
            onChanged: (bool? value) => _showPassword = value!,
          ),
          Text(
            l10n.show,
            style: const TextStyle(
              color: kBlackColor800,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
