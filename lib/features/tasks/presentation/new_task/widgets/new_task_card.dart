part of '../new_task_modal.dart';

class NewTaskCard extends StatelessWidget {
  const NewTaskCard({super.key});

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
          DefaultButton(
            widget: Text(
              'Add New Task',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: kWhiteColor,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            color: kPrimaryColor,
            onBtnSelected: () async {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
