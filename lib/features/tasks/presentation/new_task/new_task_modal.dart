import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nursing_home/config/config.dart';
import 'package:nursing_home/config/di/di.dart';
import 'package:nursing_home/features/residents/application/residents/residents_cubit.dart';
import 'package:nursing_home/features/shared/presentation/widgets/buttons/default_button.dart';
import 'package:nursing_home/features/shared/presentation/widgets/common.dart';
import 'package:nursing_home/features/shifts/application/shifts/shifts_cubit.dart';
import 'package:nursing_home/features/status/application/status/status_cubit.dart';
import 'package:nursing_home/features/tasks/application/tasks/tasks_cubit.dart';
import 'package:nursing_home/features/tasks/data/models/task_model.dart';
import 'package:nursing_home/l10n/l10n.dart';

part 'widgets/new_task_card.dart';
part 'widgets/resident_widget.dart';
part 'widgets/shift_widget.dart';
part 'widgets/status_widget.dart';
part 'widgets/task_widget.dart';

void showNewTaskModal(BuildContext context, String uid) {
  final l10n = context.l10n;

  showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(size * 2),
        topRight: Radius.circular(size * 2),
      ),
    ),
    backgroundColor: kGreyColor100,
    builder: (builder) {
      return BlocProvider(
        create: (context) => getIt<TasksCubit>(),
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height / 1.8,
                maxHeight: MediaQuery.of(context).size.height / 1.6,
              ),
              padding: const EdgeInsets.symmetric(horizontal: size * 2),
              child: Scaffold(
                backgroundColor: kGreyColor100,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: size * 2),
                      getNewTaskTItle(context, l10n),
                      const SizedBox(height: size + 4),
                      NewTaskCard(uid: uid),
                      const SizedBox(height: size * 2),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

RichText getNewTaskTItle(BuildContext context, AppLocalizations l10n) {
  return RichText(
    text: TextSpan(
      style: Theme.of(context).textTheme.headline1,
      children: <TextSpan>[
        // TextSpan(
        //   text: l10n.find,
        // ),
        TextSpan(
          text: 'New Task',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: kGreyColor900,
              ),
        ),
      ],
    ),
  );
}
