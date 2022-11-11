part of '../new_task_modal.dart';

String residentHint = 'Select a resident';
String noResidentHint = 'No current residents';
String currentResident = '';

class ResidentWidget extends StatefulWidget {
  const ResidentWidget({super.key});

  @override
  State<ResidentWidget> createState() => _ResidentWidgetState();
}

class _ResidentWidgetState extends State<ResidentWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResidentsCubit>()..getAllResidents(),
      child: Padding(
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
            BlocBuilder<ResidentsCubit, ResidentsState>(
              builder: (context, state) {
                if (state is ResidentsSuccess) {
                  return DropdownButton(
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
                    items: state.residents.map((resident) {
                      return DropdownMenuItem(
                        value: resident.name,
                        child: Text(resident.name),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        residentHint = newValue ?? '';
                        currentResident = newValue ?? '';
                      });
                    },
                  );
                } else {
                  return DropdownButton(
                    hint: Text(
                      noResidentHint,
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
