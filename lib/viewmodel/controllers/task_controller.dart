import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todolist/models/category.dart';
import 'package:todolist/models/todo_model.dart';
import 'package:todolist/providers/date_time_provider.dart';
import 'package:todolist/providers/radio_provider.dart';
import 'package:todolist/providers/service_provider.dart';

class TaskController {
  final WidgetRef ref;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  TaskController(this.ref, this.titleController, this.descriptionController);

  void createTask(BuildContext context) {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thiếu thông tin'),
            content: const Text('Vui lòng điền đầy đủ các trường'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    final selectedCategory = ref.read(radioProvider);
    final date = ref.read(dateProvider);
    final time = ref.read(timeProvider);

    ref.read(serviceProvider).addNewTask(
          TodoModel(
            titleTask: titleController.text,
            description: descriptionController.text,
            category: selectedCategory.displayTitle,
            dateTask: date,
            timeTask: time,
            isDone: false,
          ),
        );

    print('Dữ liệu đang được lưu');
    titleController.clear();
    descriptionController.clear();
    Navigator.pop(context);
  }
}
