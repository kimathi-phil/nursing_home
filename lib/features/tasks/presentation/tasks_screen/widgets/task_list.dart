part of '../tasks_screen.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        if (state is TasksSuccess) {
          return state.tasks.isNotEmpty
              ? Column(
                  children: [
                    const SizedBox(height: size * 2),
                    ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: size * 2),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            showTaskDetailModal(context, state.tasks[index]);
                          },
                          child: TaskCard(tsk: state.tasks[index]),
                        );
                      },
                    ),
                  ],
                )
              : const EmptyTasksWidget();
        }
        return Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CircularProgressIndicator(),
          ],
        ));
      },
    );
  }
}
