part of '../task_detail_modal.dart';

class TaskDetailCard extends StatelessWidget {
  const TaskDetailCard({super.key, required this.todo});

  final Task todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: size * 15.0,
        minHeight: size * 15.0,
        maxWidth: size * 50.0,
        maxHeight: size * 30.0,
      ),
      padding: const EdgeInsets.all(size * 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(size + 4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            todo.resident,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: size),
          Text(
            todo.task,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: size + 2),
          Row(
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: size * 2.4,
                    width: size * 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size + 4),
                      color: kGreyColor900,
                    ),
                    child: Text(
                      todo.shift,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .apply(color: kWhiteColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: size),
              Container(
                alignment: Alignment.center,
                height: size * 3,
                width: size * 9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size + 4),
                  color: todo.status == 'Open'
                      ? kGreenLightColor
                      : todo.status == 'In progress'
                          ? kOrangeLightColor
                          : kRedLightColor,
                ),
                child: Text(
                  todo.status,
                  style: Theme.of(context).textTheme.headline6!.apply(
                        color: todo.status == 'Open'
                            ? kGreenColor
                            : todo.status == 'In progress'
                                ? kOrangeColor
                                : kRedColor,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: size * 2),
          todo.status != 'Done'
              ? BlocListener<TasksCubit, TasksState>(
                  listener: (context, state) {
                    if (state is TasksFailed) {
                      setSnackbar(context, state.error);
                    } else if (state is TaskMapSuccess) {
                      Navigator.pop(context);
                      setSnackbar(context, 'Task updated successfully');
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DefaultButton(
                          widget: Text(
                            'Move to next shift',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          color: kBlackColor800,
                          onBtnSelected: () async {
                            updateTaskShift(context);
                          },
                        ),
                      ),
                      const SizedBox(width: size * 4),
                      Expanded(
                        child: DefaultButton(
                          widget: Text(
                            'Complete task',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          color: kPrimaryColor,
                          onBtnSelected: () async {
                            updateTaskStatus(context);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DefaultButton(
                        widget: Text(
                          'This task has been completed',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: kBlackColor800,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        color: kGreyColor400,
                        onBtnSelected: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Future<void> updateTaskShift(BuildContext context) {
    return context.read<TasksCubit>().updateTask(
      todo.id,
      {
        'shift': todo.shift == 'Morning'
            ? 'Evening'
            : todo.shift == 'Evening'
                ? 'Night'
                : 'Morning'
      },
    );
  }

  Future<void> updateTaskStatus(BuildContext context) {
    return context.read<TasksCubit>().updateTask(
      todo.id,
      {'status': 'Done'},
    );
  }
}
