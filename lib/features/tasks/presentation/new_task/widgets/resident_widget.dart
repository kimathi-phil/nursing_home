part of '../new_task_modal.dart';

String residentHint = 'Resident 1';

var residentList = [
  'Resident 1',
  'Resident 2',
  'Resident 3',
  'Resident 4',
  'Resident 5',
  'Resident 6',
  'Resident 7',
];

class ResidentWidget extends StatelessWidget {
  const ResidentWidget({super.key});

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
            'Resident',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: size - 2),
          DropdownButton(
            hint: Text(
              residentHint,
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
            items: residentList.map((String items) {
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
