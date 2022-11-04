part of '../tasks_screen.dart';

class EmptyTasksWidget extends StatelessWidget {
  @visibleForTesting
  const EmptyTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Seems like you have no tasks today.'),
    );
  }
}
