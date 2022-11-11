part of '../tasks_screen.dart';

class EmptyTasksWidget extends StatelessWidget {
  @visibleForTesting
  const EmptyTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('Seems like you have no tasks today.'),
        ],
      ),
    );
  }
}
