part of '../new_task_modal.dart';

String shiftHint = 'Morning';
String noShiftHint = 'None';
String currentShift = '';

class ShiftWidget extends StatefulWidget {
  const ShiftWidget({super.key});

  @override
  State<ShiftWidget> createState() => _ShiftWidgetState();
}

class _ShiftWidgetState extends State<ShiftWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShiftsCubit>()..getAllShifts(),
      child: Padding(
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
            BlocBuilder<ShiftsCubit, ShiftsState>(
              builder: (context, state) {
                if (state is ShiftsSuccess) {
                  return DropdownButton(
                    hint: Text(
                      shiftHint,
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
                    items: state.shifts.map((shift) {
                      return DropdownMenuItem(
                        value: shift.name,
                        child: Text(shift.name),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        shiftHint = newValue ?? '';
                        currentShift = newValue ?? '';
                      });
                    },
                  );
                } else {
                  return DropdownButton(
                    hint: Text(
                      noShiftHint,
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
