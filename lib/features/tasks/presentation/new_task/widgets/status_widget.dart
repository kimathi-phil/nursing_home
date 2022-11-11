part of '../new_task_modal.dart';

String statusHint = 'Open';
String noStatusHint = 'None';
String currentStatus = '';

class StatusWidget extends StatefulWidget {
  const StatusWidget({super.key});

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StatusCubit>()..getAllStatus(),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          top: size,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Status',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: size - 2),
            BlocBuilder<StatusCubit, StatusState>(
              builder: (context, state) {
                if (state is StatusesSuccess) {
                  return DropdownButton(
                    hint: Text(
                      statusHint,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .apply(color: kGreyColor900),
                    ),
                    style: Theme.of(context).textTheme.subtitle2,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: size * 2.6,
                      color: kGreyColor900,
                    ),
                    items: state.statuses.map((status) {
                      return DropdownMenuItem(
                        value: status.name,
                        child: Text(status.name),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        statusHint = newValue ?? '';
                        currentStatus = newValue ?? '';
                      });
                    },
                  );
                } else {
                  return DropdownButton(
                    hint: Text(
                      noStatusHint,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .apply(color: kGreyColor900),
                    ),
                    style: Theme.of(context).textTheme.subtitle2,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: size * 2.6,
                      color: kGreyColor900,
                    ),
                    items: [],
                    onChanged: (newValue) {},
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
