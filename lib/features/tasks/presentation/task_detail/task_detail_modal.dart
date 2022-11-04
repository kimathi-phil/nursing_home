import 'package:flutter/material.dart';
import 'package:nursing_home/config/config.dart';
import 'package:nursing_home/features/shared/presentation/widgets/buttons/default_button.dart';
import 'package:nursing_home/features/tasks/domain/entities/entities.dart';
import 'package:nursing_home/l10n/l10n.dart';

part 'widgets/task_detail_card.dart';

void showTaskDetailModal(BuildContext context, Task todo) {
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
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height / 2.4,
              maxHeight: MediaQuery.of(context).size.height / 2.4,
            ),
            padding: const EdgeInsets.symmetric(horizontal: size * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: size * 2),
                getTaskDetailTItle(context, l10n),
                const SizedBox(height: size + 4),
                TaskDetailCard(todo: todo),
                const SizedBox(height: size * 2),
              ],
            ),
          );
        },
      );
    },
  );
}

RichText getTaskDetailTItle(BuildContext context, AppLocalizations l10n) {
  return RichText(
    text: TextSpan(
      style: Theme.of(context).textTheme.headline1,
      children: <TextSpan>[
        // TextSpan(
        //   text: l10n.find,
        // ),
        TextSpan(
          text: 'Task',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: kGreyColor900,
              ),
        ),
      ],
    ),
  );
}
