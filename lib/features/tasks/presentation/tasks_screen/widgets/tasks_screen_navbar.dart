part of '../tasks_screen.dart';

class TasksScreenNavbar extends StatelessWidget {
  const TasksScreenNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hey Marc,',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: size * 5.0,
          width: size * 5.0,
          child: CircleAvatar(
            backgroundColor: kRedColor,
            backgroundImage: AssetImage('assets/images/ic_profile.png'),
          ),
        ),
      ],
    );
  }
}
