import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todolist/models/todo_model.dart';
import 'package:todolist/providers/service_provider.dart';

class TodoCard extends ConsumerWidget {
  const TodoCard({
    super.key,
    required this.getIndex,
  });

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<TodoModel>> todoData = ref.watch(fetchStreamProvider);

    return todoData.when(
      data: (todoList) {
        final getCategory = todoList[getIndex].category;
        Color categoryColor = Colors.white;

        switch (getCategory) {
          case 'Learn':
            categoryColor = Colors.grey.shade800;
            break;
          case 'Work':
            categoryColor = Colors.grey.shade600;
            break;
          case 'General':
            categoryColor = Colors.grey.shade400;
            break;
        }

        return Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: categoryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                width: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(todoList[getIndex].titleTask),
                        subtitle: Text(todoList[getIndex].description),
                        trailing: Checkbox(
                          shape: const CircleBorder(),
                          activeColor: Colors.black,
                          value: todoList[getIndex].isDone,
                          onChanged: (value) {
                            ref.read(serviceProvider).updateTask(
                                  todoList[getIndex].docID!,
                                  value ?? false,
                                );
                          },
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                        color: Colors.grey.shade200,
                      ),
                      Row(
                        children: [
                          Text(todoList[getIndex].timeTask),
                          const SizedBox(width: 10),
                          Text(todoList[getIndex].dateTask),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
