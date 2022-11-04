import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursing_home/config/config.dart';
import 'package:nursing_home/config/di/di.dart';
import 'package:nursing_home/features/shared/presentation/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:nursing_home/features/tasks/domain/entities/entities.dart';
import 'package:nursing_home/features/tasks/tasks.dart';
import 'package:nursing_home/l10n/l10n.dart';

part 'widgets/empty_tasks_widget.dart';
part 'widgets/task_card.dart';
part 'widgets/task_list.dart';
part 'widgets/tasks_screen_navbar.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key, required this.uid});

  final String uid;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocProvider(
      create: (context) => getIt<TasksCubit>()..getAllTasks(uid),
      child: Scaffold(
        backgroundColor: kGreyColor100,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: size * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: size * 2),
                  const TasksScreenNavbar(),
                  const SizedBox(height: size + 4),
                  getTItle(context, l10n),
                  const SizedBox(height: size + 4),
                  const TaskList(),
                  const SizedBox(height: size * 2),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavbar(
          iconData: Icons.add_circle_outline_rounded,
          title: 'Add a new task',
          onBtnSelected: () {
            showNewTaskModal(context);
          },
        ),
      ),
    );
  }

  RichText getTItle(BuildContext context, AppLocalizations l10n) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.headline1,
        children: <TextSpan>[
          const TextSpan(
            text: 'Your ',
          ),
          TextSpan(
            text: 'tasks today',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: kGreyColor900,
                ),
          ),
        ],
      ),
    );
  }
}
