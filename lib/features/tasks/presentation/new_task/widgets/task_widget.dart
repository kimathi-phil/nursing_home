part of '../new_task_modal.dart';

late final String task;
final taskController = TextEditingController();
final FocusNode taskFocus = FocusNode();

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

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
            'Task',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: size - 2),
          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            focusNode: taskFocus,
            textInputAction: TextInputAction.next,
            controller: taskController,
            style: const TextStyle(
              color: kBlackColor900,
              fontWeight: FontWeight.normal,
            ),
            // validator: (val) => validateEmail(),
            onSaved: (String? value) {
              task = value!;
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.task_alt_rounded,
                color: kGreyColor900,
                size: size * 2,
              ),
              hintText: 'Enter the task here',
              hintStyle: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .apply(color: kGreyColor900),
              filled: true,
              fillColor: kGreyColor100,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: size, vertical: 5),
              prefixIconConstraints:
                  const BoxConstraints(minWidth: size * 5, maxHeight: size * 3),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kGreyColor900),
                borderRadius: BorderRadius.circular(size),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: kWhiteColor),
                borderRadius: BorderRadius.circular(size),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
