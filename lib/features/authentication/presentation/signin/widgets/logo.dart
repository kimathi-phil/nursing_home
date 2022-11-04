part of '../signin_screen.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size * size * 2,
          width: size * size * 2,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Svg('assets/images/logo.svg'),
            ),
          ),
        ),
        const SizedBox(height: size * 2),
        Text(
          'Nursing Home',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
