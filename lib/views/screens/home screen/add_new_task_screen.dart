import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todolist/models/action_buttons_model.dart';
import 'package:todolist/models/category.dart';
import 'package:todolist/models/date_time_model.dart';
import 'package:todolist/models/radio_list_model.dart';
import 'package:todolist/models/text_field_model.dart';
import 'package:todolist/viewmodel/controllers/category_controller.dart';
import 'package:todolist/viewmodel/controllers/date_time_controller.dart';
import 'package:todolist/viewmodel/controllers/description_controller.dart';
import 'package:todolist/viewmodel/controllers/task_controller.dart';
import 'package:todolist/viewmodel/controllers/title_controller.dart';
import 'package:todolist/views/widgets/action_buttons_widget.dart';
import 'package:todolist/views/widgets/date_time_widget.dart';
import 'package:todolist/views/widgets/radio_list_widget.dart';
import 'package:todolist/views/widgets/text_field_widget.dart';

class AddNewTaskScreen extends ConsumerWidget {
  AddNewTaskScreen({super.key});

  final titleController = TitleController();
  final descriptionController = DescriptionController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryController = CategoryController(ref);
    final dateTimeController = DateTimeController(ref);
    final taskController = TaskController(ref, titleController.titleController,
        descriptionController.descriptionController);

    return Container(
      height: MediaQuery.of(context).size.height * 0.80,
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'New Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const Divider(
              thickness: 1.2,
              color: Colors.grey,
            ),
            const Text(
              'Title Task',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              model: TextFieldModel(
                hintText: 'Add Task Name',
                maxLine: 1,
                txtController: titleController.titleController,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              model: TextFieldModel(
                hintText: 'Add Description',
                maxLine: 5,
                txtController: descriptionController.descriptionController,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Category',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                SizedBox(
                  child: RadioListWidget(
                    model: RadioModel(
                      cateColor: Category.learn.color,
                      titleRadio: Category.learn.displayTitle,
                      valueInput: Category.learn.index,
                    ),
                    onChangeValue: () =>
                        categoryController.selectCategory(Category.learn),
                    isSelected:
                        categoryController.selectedCategory == Category.learn,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: RadioListWidget(
                    model: RadioModel(
                      cateColor: Category.work.color,
                      titleRadio: Category.work.displayTitle,
                      valueInput: Category.work.index,
                    ),
                    onChangeValue: () =>
                        categoryController.selectCategory(Category.work),
                    isSelected:
                        categoryController.selectedCategory == Category.work,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: RadioListWidget(
                    model: RadioModel(
                      cateColor: Category.general.color,
                      titleRadio: Category.general.displayTitle,
                      valueInput: Category.general.index,
                    ),
                    onChangeValue: () =>
                        categoryController.selectCategory(Category.general),
                    isSelected:
                        categoryController.selectedCategory == Category.general,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateTimeWidget(
                  model: DateTimeModel(
                    iconSection: CupertinoIcons.calendar,
                    titleText: 'Date',
                    valueText: dateTimeController.date,
                    onTap: () async => dateTimeController.pickDate(context),
                  ),
                ),
                const SizedBox(height: 10),
                DateTimeWidget(
                  model: DateTimeModel(
                    iconSection: CupertinoIcons.clock,
                    titleText: 'Time',
                    valueText: dateTimeController.time,
                    onTap: () async => dateTimeController.pickTime(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ActionButtonsWidget(
                    Model: ActionButtonModel(
                      backgroundColor: Colors.white,
                      text: 'Cancel',
                      foregroundColor: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: ActionButtonsWidget(
                    Model: ActionButtonModel(
                      backgroundColor: Colors.black,
                      text: 'Create',
                      foregroundColor: Colors.white,
                      onPressed: () => taskController.createTask(context),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
