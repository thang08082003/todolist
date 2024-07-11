import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todolist/providers/service_provider.dart';
import 'package:todolist/views/screens/home%20screen/add_new_task_screen.dart';

import 'package:todolist/views/widgets/todo_card_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: ListTile(
          leading: const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/avt3.png'),
          ),
          title: Text(
            "Welcome Back!",
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
          ),
          subtitle: const Text(
            "Nam",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's Task",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'What you wanna do?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    context: context,
                    builder: (context) => AddNewTaskScreen(),
                  ),
                  child: const Text(
                    '+ New Task',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: todoData.when(
                data: (todos) => ListView.separated(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todoItem = todos[index];
                    return Dismissible(
                      key: Key(todoItem.docID.toString()),
                      onDismissed: (direction) async {
                        ref.read(serviceProvider).deleteTask(todoItem.docID);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${todoItem.titleTask} is Deleted'),
                          ),
                        );
                      },
                      background: Container(
                        color: Colors.white,
                        child: const Center(
                          child: Icon(CupertinoIcons.trash),
                        ),
                      ),
                      child: TodoCard(
                        getIndex: index,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
