part of '../new_task_modal.dart';

String shiftInitialValue = 'Morning';

var shiftList = [
  'Morning',
  'Afternoon',
  'Evening',
];

class ShiftWidget extends StatelessWidget {
  const ShiftWidget({super.key});

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
            'Shift',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: size - 2),
          DropdownButton(
            hint: Text(
              shiftInitialValue,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .apply(color: kGreyColor900),
            ),
            value: shiftInitialValue,
            style: Theme.of(context).textTheme.subtitle2,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: size * 2.6,
              color: kGreyColor900,
            ),
            items: shiftList.map((String items) {
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
