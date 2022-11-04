part of '../tasks_screen.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.tsk});

  final Task tsk;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: size * 12.0,
        minHeight: size * 12.0,
        maxWidth: size * 15.0,
        maxHeight: size * 15.0,
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
          Text(
            tsk.resident,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: size),
          Text(
            tsk.task,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: size + 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: size * 2,
                    width: size * 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size + 4),
                      color: kGreyColor900,
                    ),
                    child: Text(
                      tsk.shift,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .apply(color: kWhiteColor),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: size * 3,
                width: size * 9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size + 4),
                  color: tsk.status == 'Open'
                      ? kGreenLightColor
                      : tsk.status == 'In progress'
                          ? kOrangeLightColor
                          : kRedLightColor,
                ),
                child: Text(
                  tsk.status,
                  style: Theme.of(context).textTheme.headline6!.apply(
                        color: tsk.status == 'Open'
                            ? kGreenColor
                            : tsk.status == 'In progress'
                                ? kOrangeColor
                                : kRedColor,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
