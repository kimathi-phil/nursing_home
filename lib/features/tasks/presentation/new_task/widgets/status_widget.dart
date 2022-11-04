part of '../new_task_modal.dart';

String statusInitialValue = 'Open';

var statusList = [
  'Open',
  'In Progress',
  'Done',
];

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          DropdownButton(
            hint: Text(
              statusInitialValue,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .apply(color: kGreyColor900),
            ),
            value: statusInitialValue,
            style: Theme.of(context).textTheme.subtitle2,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: size * 2.6,
              color: kGreyColor900,
            ),
            items: statusList.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (newValue) {},
          ),
        ],
      ),
    );
  }
}
