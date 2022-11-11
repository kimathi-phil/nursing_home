part of '../new_task_modal.dart';

class NewTaskCard extends StatelessWidget {
  const NewTaskCard({super.key, required this.uid});

  final uid;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: size * 15.0,
        minHeight: size * 15.0,
        maxWidth: size * 50.0,
        maxHeight: size * 50.0,
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
          const ResidentWidget(),
          const SizedBox(height: size + 2),
          const TaskWidget(),
          const SizedBox(height: size + 2),
          Row(
            children: const [
              ShiftWidget(),
              SizedBox(width: size * 2),
              StatusWidget(),
            ],
          ),
          const SizedBox(height: size + 2),
          BlocListener<TasksCubit, TasksState>(
            listener: (context, state) {
              if (state is TasksFailed) {
                setSnackbar(context, state.error);
              } else if (state is TaskSuccess) {
                Navigator.pop(context);
                setSnackbar(context, 'Task added successfully');
              }
            },
            child: DefaultButton(
              widget: BlocBuilder<TasksCubit, TasksState>(
                builder: (context, state) {
                  if (state is TasksLoading) {
                    return const Center(
                      child: SizedBox(
                        width: size * 2,
                        height: size * 2,
                        child: CircularProgressIndicator(
                          color: kWhiteColor,
                        ),
                      ),
                    );
                  } else {
                    return Text(
                      'Add New Task',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: kWhiteColor,
                            fontWeight: FontWeight.normal,
                          ),
                    );
                  }
                },
              ),
              color: kPrimaryColor,
              onBtnSelected: () async => addTask(context),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addTask(BuildContext context) {
    if (currentResident != '' &&
        taskController.text != '' &&
        uid != '' &&
        currentShift != '' &&
        currentStatus != '') {
      return context.read<TasksCubit>().addNewTask(
            TaskModel(
              resident: currentResident,
              task: taskController.text,
              nurse: uid,
              shift: currentShift,
              status: currentStatus,
            ),
          );
    } else {
      return Future.delayed(const Duration(milliseconds: 0), () {
        setSnackbar(context, 'Please fill in all the fields.');
      });
    }
  }
}
